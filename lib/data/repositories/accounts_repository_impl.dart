import 'package:iif/domain/include.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';

class AccountsRepositoryImpl extends AccountsRepository {
  final List<Account> _data = [];

  @override
  List<Account> getAccountsOfType(AccountType type) {
    // await Future.delayed(const Duration(seconds: 1));
    return _data.where((it) => it.type == type).toList();
  }

  @override
  void saveAccount(Account account) {
    _data.add(account);
  }

  Future<Map<AccountType, Money>> getMoneyForAccountTypes() async {
    void addMoney(Map<AccountType, Money> data, AccountType type, Money money) {
      Money accumulator = data[type] ?? Money.zero;
      data[type] = accumulator.add(money);
    }

    final Map<AccountType, Money> result = {};
    final accounts = _data;
    final operationsRepository = OperationsRepositoryImpl();

    Future.forEach<Account>(accounts, (account) async {
      addMoney(result, account.type, await operationsRepository.calculateMoney(account));
    });

    return result;
  }
}
