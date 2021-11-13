import 'package:iif/domain/include.dart';
import 'package:iif/misc/resources/strings.dart';

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
