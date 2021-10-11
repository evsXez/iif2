import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class GetAccountsWithMoneyUseCase {
  final AccountsRepository accountsRepository;
  final OperationsRepository operationsRepository;

  GetAccountsWithMoneyUseCase({
    required this.accountsRepository,
    required this.operationsRepository,
  });

  Future<List<MapEntry<Account, Money>>> execute(AccountType type) async {
    final List<MapEntry<Account, Money>> result = [];
    await Future.forEach<Account>(accountsRepository.getAccountsOfType(type), (account) async {
      final money = await operationsRepository.calculateMoney(account);
      result.add(MapEntry(account, money));
    });
    return result;
  }
}
