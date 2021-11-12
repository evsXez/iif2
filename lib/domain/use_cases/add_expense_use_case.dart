import 'package:iif/domain/entities/account.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class AddExpenseUseCase {
  final OperationsRepository operationsRepository;
  AddExpenseUseCase({
    required this.operationsRepository,
  });

  void execute(
    Account account,
    Money money, {
    String? comment,
    String? categoriesStamp,
  }) {
    operationsRepository.addOperationExpense(
      account,
      money,
      comment: comment,
      categoriesStamp: categoriesStamp,
    );
  }
}
