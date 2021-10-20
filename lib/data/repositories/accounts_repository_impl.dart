import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';

class AccountsRepositoryImpl extends AccountsRepository {
  final DataSource _dataSource;

  AccountsRepositoryImpl(this._dataSource);

  @override
  List<Account> getAccountsOfType(AccountType type) {
    final data = _dataSource.getAcounts();
    return data.where((it) => it.type == type && !it.isArchived).toList();
  }

  @override
  Account saveAccount(Account accountTemplate) {
    try {
      if (accountTemplate.id >= 0) {
        if (accountTemplate.isDeleted) {
          _dataSource.deleteAcount(accountTemplate);
          return accountTemplate;
        }

        final accounts = _dataSource.getAcounts();
        if (accounts.any((it) => it.id == accountTemplate.id)) {
          _dataSource.updateAcount(accountTemplate);
          return accountTemplate;
        }
      }

      return _dataSource.addAcount(accountTemplate);
    } finally {
      notifyListeners();
    }
  }
}
