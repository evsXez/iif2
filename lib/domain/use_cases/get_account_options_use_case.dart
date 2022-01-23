import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class GetAccountOptionsUseCase {
  final OperationsRepository operationsRepository;

  GetAccountOptionsUseCase({
    required this.operationsRepository,
  });

  Future<AccountOptions?> execute(AccountBalance accountBalance) async {
    final operations = await operationsRepository.getOperations(accountBalance.account);
    final accountHasNoOperationsExceptInitialInput = operations.every(
      (it) => it.type == LogicOperationType.initialInput,
    );

    switch (accountBalance.account.type) {
      case AccountType.money:
        return AccountOptions(
          isArchiveAvailable: accountBalance.money == Money.zero,
          isDeleteAvailable: accountHasNoOperationsExceptInitialInput,
        );
      case AccountType.creditCards:
        final creditCardAccount = accountBalance.account as CreditCardAccount;
        return AccountOptions(
          isArchiveAvailable: accountBalance.money == creditCardAccount.limit,
          isDeleteAvailable: accountHasNoOperationsExceptInitialInput,
        );
      case AccountType.debts:
      case AccountType.loans:
        return AccountOptions(
          isDeleteVisible: false,
          isArchiveVisible: false,
        );
      default:
        return null;
    }
  }
}
