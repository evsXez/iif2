import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';

class AccountsRepositoryImpl extends AccountsRepository {
  final DataSource _dataSource;

  AccountsRepositoryImpl(this._dataSource);

  @override
  List<Account> getAccountsOfType(AccountType type) {
    final data = _dataSource.getAcounts();
    return data.where((it) => it.type == type).toList();
  }

  @override
  Account saveAccount(Account accountTemplate) {
    return _dataSource.addAcount(accountTemplate);
  }

  // Future<Map<AccountType, Money>> getMoneyForAccountTypes() async {
  //   void addMoney(Map<AccountType, Money> data, AccountType type, Money money) {
  //     Money accumulator = data[type] ?? Money.zero;
  //     data[type] = accumulator.add(money);
  //   }

  //   final Map<AccountType, Money> result = {};
  //   final accounts = _data;
  //   final operationsRepository = OperationsRepositoryImpl();

  //   Future.forEach<Account>(accounts, (account) async {
  //     addMoney(result, account.type, await operationsRepository.calculateBalance(account));
  //   });

  //   return result;
  // }
}
