import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/entities/category.dart';
import 'package:iif/domain/entities/category_node.dart';
import 'package:iif/domain/entities/category_node.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

part 'category_selector_state.dart';
part 'category_selector_bloc.freezed.dart';

final CategoryNode _categoriesPredefined = CategoryNode(
    category: Category("[[ROOT]]"),
    children: [
      CategoryNode(category: Category(Strings.category_expense), children: [], isLocked: true),
      CategoryNode(category: Category(Strings.category_income), children: [], isLocked: true),
      CategoryNode(
          category: Category(Strings.category_transfer), children: [], canHaveMoreChildren: false, isLocked: true),
      CategoryNode(
          category: Category(Strings.category_debts),
          children: [
            CategoryNode(
                category: Category(Strings.category_debts_new),
                children: [],
                canHaveMoreChildren: false,
                isLocked: true),
            CategoryNode(
                category: Category(Strings.category_debts_return),
                children: [],
                canHaveMoreChildren: false,
                isLocked: true),
            CategoryNode(
                category: Category(Strings.category_debts_to_me),
                children: [],
                canHaveMoreChildren: false,
                isLocked: true),
            CategoryNode(
                category: Category(Strings.category_debts_returned_to_me),
                children: [],
                canHaveMoreChildren: false,
                isLocked: true),
          ],
          canHaveMoreChildren: false,
          isLocked: true),
    ],
    canHaveMoreChildren: false,
    isLocked: true);

class CategorySelectorBloc extends Cubit<CategorySelectorState> {
  final BuildContext _context;

  final CategoryNode _root = _categoriesPredefined;
  final CategoryNode _addNode = CategoryNode(category: Category("+"), children: []);

  CategorySelectorBloc(this._context) : super(const _Loading()) {
    // Future.delayed(Duration(seconds: 1)).then((_) {
    _showData();
    // });
  }

  void _showData() {
    List<CategoryNodeRef> view = [];

    CategoryNode? root = _root;

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

  void tap(CategoryNode node) {
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

  void save(CategoryNode node, String text) {
    if (node == _addNode) {
      final CategoryNode deepSelected = _firstDeepSelectedNode();
      deepSelected.children.add(CategoryNode(category: Category(text), children: [], isSelected: true));
    } else {
      node.category = Category(text);
    }
    node.isEditing = false;
    _showData();
  }

  void delete(CategoryNode node) {
    if (node == _addNode) {
      _addNode.isEditing = false;
    } else {
      _parentOf(_root, node)?.children.remove(node);
    }
    _showData();
  }

  void edit(CategoryNode node) {
    node.isEditing = true;
    _showData();
  }

  CategoryNode? _parentOf(CategoryNode root, CategoryNode child) {
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

  CategoryNode _firstDeepSelectedNode() {
    CategoryNode root = _root;

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
