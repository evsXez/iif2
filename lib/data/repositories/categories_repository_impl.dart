import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/categories_repository.dart';
import 'package:iif/misc/resources/strings.dart';
import 'package:intl/date_time_patterns.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final DataSource _dataSource;

  CategoriesRepositoryImpl(this._dataSource);

  Node<Category> withChildren(List<CategoryModel> list, Node<Category> parent) {
    final nodes = list.where((model) => model.id != model.parentId && model.parentId == parent.value?.id).map(
          (it) => withChildren(
            list,
            Node<Category>(value: it, children: []),
          ),
        );
    if (nodes.isNotEmpty) {
      parent.children.addAll(nodes);
    }
    return parent;
  }

  @override
  Node<Category> getCategories() {
    final List<CategoryModel> list = _dataSource.getCategories();

    final rootModel = list.firstWhere((it) => it.id == it.parentId);
    final result = withChildren(
      list,
      Node<Category>(
        value: rootModel,
        children: [],
        type: NodeType.root,
        canHaveMoreChildren: false,
      ),
    );

    return result;
  }

  @override
  Category saveCategory(Category categoryTemplate, Category parent) {
    return _dataSource.addCategory(categoryTemplate, parent);
  }
}
/*
final Node<Category> predefinedCategoriesNode = Node(
  value: null, 
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
      value: Category(Strings.category_debts, CategoryType.debtsAndLoans),
      children: [
        Node(
          value: Category(Strings.category_debts_new, CategoryType.debtIncrease),
          children: [],
          canHaveMoreChildren: false,
          isLocked: true,
        ),
        Node(
          value: Category(Strings.category_debts_return, CategoryType.debtDecrease),
          children: [],
          canHaveMoreChildren: false,
          isLocked: true,
        ),
        Node(
          value: Category(Strings.category_debts_to_me, CategoryType.loanIncrease),
          children: [],
          canHaveMoreChildren: false,
          isLocked: true,
        ),
        Node(
          value: Category(Strings.category_debts_returned_to_me, CategoryType.loanDecrease),
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
*/