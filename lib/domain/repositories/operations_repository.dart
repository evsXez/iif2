import 'package:flutter/foundation.dart';
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
    String? subjectsStamp,
  });
  void addOperationIncome(
    Account account,
    Money money, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  });
  void addOperationTransfer(
    Account accountFrom,
    Account accountTo,
    Money money, {
    String? comment,
    String? categoriesStamp,
  });
  void addOperationDebtIncrease(
    Account account,
    Money money,
    Account debtAccount, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  });
  void addOperationDebtDecrease(
    Account account,
    Money money,
    Account debtAccount, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  });
  void addOperationLoanIncrease(
    Account account,
    Money money,
    Account debtAccount, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  });
  void addOperationLoanDecrease(
    Account account,
    Money money,
    Account debtAccount, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  });
}
