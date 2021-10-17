import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class GetAccountOptionsUseCase {
  final OperationsRepository operationsRepository;

  GetAccountOptionsUseCase({
    required this.operationsRepository,
  });

  Future<AccountOptions> execute(AccountBalance accountBalance) async {
    final operations = await operationsRepository.getOperations(accountBalance.account);
    final accountHasNoOperationsExceptInitialInput = operations.every(
      (it) => it.type == LogicOperationType.initialInput,
    );

    return AccountOptions(
      isArchiveAvailable: accountBalance.money == Money.zero,
      isDeleteAvailable: accountHasNoOperationsExceptInitialInput,
    );
  }
}