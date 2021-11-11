import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

part 'category_selector_state.dart';
part 'category_selector_bloc.freezed.dart';

final Node<Category> _categoriesPredefined = Node(
  value: Category("", CategoryType.special),
  children: [
    Node(
      value: Category(Strings.category_expense, CategoryType.expense),
      children: [],
      isLocked: true,
    ),
    Node(
      value: Category(Strings.category_income, CategoryType.income),
      children: [],
      isLocked: true,
    ),
    Node(
      value: Category(Strings.category_transfer, CategoryType.transfer),
      children: [],
      canHaveMoreChildren: false,
      isLocked: true,
    ),
    Node(
      value: Category(Strings.category_debts, CategoryType.debts),
      children: [
        Node(
          value: Category(Strings.category_debts_new, CategoryType.debtNew),
          children: [],
          canHaveMoreChildren: false,
          isLocked: true,
        ),
        Node(
          value: Category(Strings.category_debts_return, CategoryType.debtReturn),
          children: [],
          canHaveMoreChildren: false,
          isLocked: true,
        ),
        Node(
          value: Category(Strings.category_debts_to_me, CategoryType.debtToMe),
          children: [],
          canHaveMoreChildren: false,
          isLocked: true,
        ),
        Node(
          value: Category(Strings.category_debts_returned_to_me, CategoryType.debtReturnedToMe),
          children: [],
          canHaveMoreChildren: false,
          isLocked: true,
        ),
      ],
      canHaveMoreChildren: false,
      isLocked: true,
    ),
  ],
  canHaveMoreChildren: false,
);

class CategorySelectorBloc extends Cubit<CategorySelectorState> {
  final BuildContext _context;

  final Node<Category> _root = _categoriesPredefined;
  final Node<Category> _addNode = Node(value: Category("+", CategoryType.special), children: []);

  CategorySelectorBloc(this._context) : super(const _Loading()) {
    // Future.delayed(Duration(seconds: 1)).then((_) {
    _showData();
    // });
  }

  void _showData() {
    List<CategoryNodeRef> view = [];

    Node<Category>? root = _root;

    while (root != null) {
      view.add(CategoryNodeRef(root));
      try {
        root = root.children.firstWhere((it) => it.isSelected);
      } catch (e) {
        break;
      }
    }
    view.addAll((root?.children ?? []).map((e) => CategoryNodeRef(e)).toList());
    if (root?.canHaveMoreChildren ?? false) {
      view.add(CategoryNodeRef(_addNode));
    }

    view.removeAt(0); //hide root

    emit(_Loaded(view));
  }

  void tap(Node<Category> node) {
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

  void save(Node<Category> node, String text) {
    if (node == _addNode) {
      final Node<Category> deepSelected = _firstDeepSelectedNode();
      deepSelected.children.add(Node(value: Category(text, deepSelected.value.type), children: [], isSelected: true));
    } else {
      node.value = Category(text, node.value.type);
    }
    node.isEditing = false;
    _showData();
  }

  void delete(Node<Category> node) {
    if (node == _addNode) {
      _addNode.isEditing = false;
    } else {
      _parentOf(_root, node)?.children.remove(node);
    }
    _showData();
  }

  void edit(Node<Category> node) {
    node.isEditing = true;
    _showData();
  }

  Node? _parentOf(Node<Category> root, Node<Category> child) {
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

  Node<Category> _firstDeepSelectedNode() {
    Node<Category> root = _root;

    while (root.children.isNotEmpty) {
      try {
        final node = root.children.firstWhere((it) => it.isSelected);
        root = node;
      } catch (_) {
        break;
      }
    }

    return root;
  }
}
