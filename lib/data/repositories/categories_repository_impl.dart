import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/categories_repository.dart';
import 'package:iif/misc/resources/strings.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final DataSource _dataSource;

  CategoriesRepositoryImpl(this._dataSource);

  @override
  Node<Category> getCategories() {
    throw UnimplementedError();
  }

  @override
  Category saveCategory(Category categoryTemplate, Category parent) {
    throw UnimplementedError();
  }
}

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
