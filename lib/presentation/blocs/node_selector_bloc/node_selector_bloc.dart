import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

part 'node_selector_state.dart';
part 'node_selector_bloc.freezed.dart';

class NodeSelectorBloc<T extends NodeValue> extends Cubit<NodeSelectorState<T>> {
  final BuildContext _context;

  final Node<T> _root;
  final Node<T> _addNode = Node.composer();

  NodeSelectorBloc(
    this._context, {
    required Node<T> root,
    // required Node<T> addNode,
  })  : _root = root,
        // _addNode = addNode,
        super(const _Loading()) {
    // Future.delayed(Duration(seconds: 1)).then((_) {
    _showData();
    // });
  }

  void _showData() {
    List<NodeRef<T>> view = [];

    Node<T>? root = _root;

    while (root != null) {
      view.add(NodeRef<T>(root));
      try {
        root = root.children.firstWhere((it) => it.isSelected);
      } catch (e) {
        break;
      }
    }
    view.addAll((root?.children ?? []).map((e) => NodeRef<T>(e)).toList());
    if (root?.canHaveMoreChildren ?? false) {
      view.add(NodeRef<T>(_addNode));
    }

    view.removeAt(0); //hide root

    emit(_Loaded(view));
  }

  void tap(Node<T> node) {
    if (node == _addNode) {
      _addNode.isEditing = !_addNode.isEditing;
    } else {
      if (node.isSelected) {
        _addNode.isEditing = false;
      }
      node.isSelected = !node.isSelected;
    }
    _showData();
  }

  void save(Node<T> node, dynamic Function(String text, Node<NodeValue> parent) valueBuilder, String text) {
    if (node == _addNode) {
      final Node<T> parent = _root.deepSelected();
      parent.children.add(
        Node(
          value: valueBuilder(text, parent), //Category(text, deepSelected.value.type)
          children: [],
          isSelected: true,
        ),
      );
    } else {
      node.value = valueBuilder(text, node); //Category(text, node.value.type);
    }
    node.isEditing = false;
    _showData();
  }

  void delete(Node<T> node) {
    if (node == _addNode) {
      _addNode.isEditing = false;
    } else {
      _parentOf(_root, node)?.children.remove(node);
    }
    _showData();
  }

  void edit(Node<T> node) {
    node.isEditing = true;
    _showData();
  }

  Node? _parentOf(Node<T> root, Node<T> child) {
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
