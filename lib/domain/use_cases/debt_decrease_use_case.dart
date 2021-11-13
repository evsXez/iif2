import 'package:iif/domain/entities/account.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class DebtDecreaseUseCase {
  final OperationsRepository operationsRepository;
  DebtDecreaseUseCase({
    required this.operationsRepository,
  });

  void execute(
    Account account,
    Money money, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
    required Subject subject,
  }) {
    operationsRepository.addOperationDebtDecrease(
      account,
      money,
      subject,
      comment: comment,
      categoriesStamp: categoriesStamp,
      subjectsStamp: subjectsStamp,
    );
  }
}
