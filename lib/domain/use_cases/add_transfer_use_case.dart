import 'package:iif/domain/entities/account.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class AddTransferUseCase {
  final OperationsRepository operationsRepository;
  AddTransferUseCase({
    required this.operationsRepository,
  });

  void execute(
    Account accountFrom,
    Account accountTo,
    Money money, {
    String? comment,
    String? categoriesStamp,
  }) {
    operationsRepository.addOperationTransfer(
      accountFrom,
      accountTo,
      money,
      comment: comment,
      categoriesStamp: categoriesStamp,
    );
  }
}
