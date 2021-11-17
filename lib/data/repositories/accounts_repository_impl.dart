import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';

class AccountsRepositoryImpl extends AccountsRepository {
  final DataSource _dataSource;

  AccountsRepositoryImpl(this._dataSource);

  @override
  List<Account> getAccountsOfType(AccountType type) {
    final data = _dataSource.getAccounts();
    return data.where((it) => it.type == type && !it.isArchived).toList();
  }

  @override
  Account saveAccount(Account accountTemplate, {Subject? subject}) {
    try {
      if (accountTemplate.id >= 0) {
        if (accountTemplate.isDeleted) {
          _dataSource.deleteAcount(accountTemplate);
          return accountTemplate;
        }

        final accounts = _dataSource.getAccounts();
        if (accounts.any((it) => it.id == accountTemplate.id)) {
          _dataSource.updateAcount(accountTemplate, subject);
          return accountTemplate;
        }
      }

      return _dataSource.addAcount(accountTemplate, subject);
    } finally {
      notifyListeners();
    }
  }

  //TODO: untested
  @override
  Account getAccountForSubject(Subject subject) {
    final data = _dataSource.getAccounts();
    try {
      final result = data.firstWhere((it) => it.subjectId == subject.id);
      return result;
    } catch (e) {
      return saveAccount(
        Account(
          id: -1,
          type: subject.type == SubjectType.debts ? AccountType.debts : AccountType.investments,
          name: subject.name,
          currency: Currency.debugDefault,
        ),
        subject: subject,
      );
    }
  }
}
