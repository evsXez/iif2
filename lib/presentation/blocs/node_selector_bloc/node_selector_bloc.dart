import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

part 'node_selector_state.dart';
part 'node_selector_bloc.freezed.dart';

class NodeSelectorBloc<T extends NodeValue> extends Cubit<NodeSelectorState<T>> {
  final BuildContext _context;

  late final Node<NodeValue> _root;
  final Node<T> _addNode = Node.composer();

  NodeSelectorBloc(this._context) : super(const _Loading()) {
    _root = getRootNodeUseCase.of(_context).execute(T);
    // _root = GetRootNodeUseCase<T>().execute();

    // Future.delayed(Duration(seconds: 1)).then((_) {
    _showData();
    // });
  }

  void _showData() {
    List<NodeRef<T>> view = [];

    Node<NodeValue>? root = _root;
    Node<T> parent = root as Node<T>;

    while (root != null) {
      view.add(NodeRef<T>(node: root as Node<T>, parent: parent));
      parent = root;
      try {
        root = root.children.firstWhere((it) => it.isSelected);
      } catch (e) {
        break;
      }
    }
    view.addAll((root?.children ?? []).map((e) => NodeRef<T>(node: e as Node<T>, parent: root as Node<T>)).toList());
    bool canHaveMoreChildren = root?.canHaveMoreChildren ?? false;
    final value = root?.value;
    if (value is Category && value.type == CategoryType.debtsAndLoans) {
      canHaveMoreChildren = false;
    }

    if (canHaveMoreChildren) {
      view.add(NodeRef<T>(node: _addNode, parent: root as Node<T>));
    }

    view.removeAt(0); //hide root

    emit(_Loaded(view));
  }

  void tap(NodeRef<T> nodeRef) {
    if (nodeRef.node == _addNode) {
      _addNode.isEditing = !_addNode.isEditing;
    } else {
      if (nodeRef.node.isSelected) {
        _addNode.isEditing = false;
      }
      nodeRef.node.isSelected = !nodeRef.node.isSelected;
    }
    _showData();
  }

  void save(NodeRef<T> nodeRef, String text, NodeValue reference) {
    if (nodeRef.node == _addNode) {
      final Node<NodeValue> parent = _root.deepSelected();
      parent.children.add(
        Node<T>(
          value: createNodeValueUseCase.of(_context).execute<T>(
                text,
                null,
                reference,
                parent: nodeRef.parent.value as NodeValue,
              ),
          children: [],
          isSelected: true,
        ),
      );
    } else {
      nodeRef.node.value = createNodeValueUseCase.of(_context).execute<T>(
            text,
            nodeRef.node.value,
            reference,
            parent: nodeRef.parent.value as NodeValue,
          );
    }
    nodeRef.node.isEditing = false;
    _showData();
  }

  void delete(NodeRef<T> nodeRef) {
    if (nodeRef.node == _addNode) {
      _addNode.isEditing = false;
    } else {
      _parentOf(_root, nodeRef.node)?.children.remove(nodeRef.node);
    }
    _showData();
  }

  void edit(NodeRef<T> nodeRef) {
    nodeRef.node.isEditing = true;
    _showData();
  }

  Node? _parentOf(Node<NodeValue> root, Node<T> child) {
    if (root.children.contains(child)) {
      return root;
    }
    for (var element in root.children) {
      final result = _parentOf(element, child);
      if (result != null) {
        return result;
      }
    }
    return null;
  }
}
