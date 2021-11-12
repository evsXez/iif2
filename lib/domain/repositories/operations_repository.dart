import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';

abstract class OperationsRepository extends ChangeNotifier {
  Future<Money> calculateBalance(Account account);

  Future<List<LogicOperation>> getOperations(Account account);
  Future<List<LogicOperation>> getAllOperations();

  void addOperationInitialInput(
    Account account,
    Money money,
  );
  void addOperationExpense(
    Account account,
    Money money, {
    String? comment,
    String? categoriesStamp,
  });
  void addOperationIncome(
    Account account,
    Money money, {
    String? comment,
    String? categoriesStamp,
  });
}
