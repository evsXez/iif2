import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';

class AccountsRepositoryImpl extends AccountsRepository {
  final DataSource _dataSource;

  AccountsRepositoryImpl(this._dataSource);

  @override
  List<Account> getAccountsOfType(AccountType type) {
    final data = _dataSource.getAccounts();
    return data
        .where((it) => it.type == type && !it.isArchived)
        .map((it) => it.type == AccountType.creditCards
            ? CreditCardAccount(
                id: it.id,
                name: it.name,
                currency: it.currency,
                limit: it.creditLimitModel,
              )
            : it)
        .toList();
  }

  @override
  Account saveAccount(
    Account accountTemplate, {
    Subject? subject,
    Money? creditLimit,
  }) {
    try {
      if (accountTemplate.id >= 0) {
        if (accountTemplate.isDeleted) {
          _dataSource.deleteAcount(accountTemplate);
          return accountTemplate;
        }

        final accounts = _dataSource.getAccounts();
        if (accounts.any((it) => it.id == accountTemplate.id)) {
          _dataSource.updateAcount(accountTemplate, subject, creditLimit);
          return accountTemplate;
        }
      }

      return _dataSource.addAcount(accountTemplate, subject, creditLimit);
    } finally {
      notifyListeners();
    }
  }

  //TODO: untested
  @override
  Account getAccountForSubjectAndType(Subject subject, AccountType type) {
    final data = _dataSource.getAccounts();
    try {
      final result = data.firstWhere((it) => it.subjectId == subject.id && it.type == type);
      return result;
    } catch (e) {
      return saveAccount(
        Account(
          id: -1,
          type: type,
          name: subject.name,
          currency: Currency.debugDefault,
        ),
        subject: subject,
      );
    }
  }
}
