import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class GetAccountsBalanceUseCase {
  final AccountsRepository accountsRepository;
  final OperationsRepository operationsRepository;

  GetAccountsBalanceUseCase({
    required this.accountsRepository,
    required this.operationsRepository,
  });

  Future<List<AccountBalance>> execute(AccountType type) async {
    final List<AccountBalance> result = [];
    await Future.forEach<Account>(accountsRepository.getAccountsOfType(type), (account) async {
      if (!account.isArchived) {
        final money = await operationsRepository.calculateBalance(account);
        result.add(AccountBalance(account, money));
      }
    });
    if (type == AccountType.debts) {
      result.removeWhere((it) => it.money == Money.zero);
    }
    return result;
  }
}
