import 'package:flutter_test/flutter_test.dart';
import 'package:iif/data/data_sources/data_source_impl.dart';
import 'package:iif/data/include.dart';
import 'package:iif/data/repositories/accounts_repository_impl.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'accounts_repository_impl_test.mocks.dart';

@GenerateMocks([DataSource])
void main() {
  late AccountsRepository repository;
  late DataSource dataSource;
  const AccountType type1 = AccountType.money;
  const AccountType type2 = AccountType.creditCards;
  final AccountModel account1Type1 =
      AccountModel(id: 1, currency: Currency.debugDefault, name: 'account1', type: type1);
  final AccountModel account2Type1 =
      AccountModel(id: 2, currency: Currency.debugDefault, name: 'account2', type: type1);
  final AccountModel account3Type1 =
      AccountModel(id: 3, currency: Currency.debugDefault, name: 'account3', type: type1);
  final AccountModel account1Type2 =
      AccountModel(id: 4, currency: Currency.debugDefault, name: 'account1', type: type2);
  final AccountModel account2Type2 =
      AccountModel(id: 5, currency: Currency.debugDefault, name: 'account2', type: type2);
  final List<AccountModel> accountsType1 = [
    account1Type1,
    account2Type1,
    account3Type1,
  ];
  final List<AccountModel> accountsType2 = [
    account1Type2,
    account2Type2,
  ];
  final List<AccountModel> allAccounts = [
    ...accountsType2,
    ...accountsType1,
  ];
  final List<AccountModel> initiallyEmptyAccounts = [];
  final account =
      AccountModel(id: 101, currency: Currency.debugDefault, name: 'account to save', type: AccountType.debtsToMe);

  setUp(() {
    dataSource = MockDataSource();
    repository = AccountsRepositoryImpl(dataSource);
    initiallyEmptyAccounts.clear();
  });

  test('data source has data and repository fetches it by type', () async {
    when(dataSource.getAcounts()).thenReturn(allAccounts);
    expect(repository.getAccountsOfType(type1), accountsType1);
    expect(repository.getAccountsOfType(type2), accountsType2);
  });

  test('data source has no data, then save, then it has data', () async {
    when(dataSource.getAcounts()).thenReturn(initiallyEmptyAccounts);
    when(dataSource.addAcount(account)).thenAnswer((_) {
      initiallyEmptyAccounts.add(account);
      return account;
    });
    expect(repository.getAccountsOfType(account.type), []);
    repository.saveAccount(account);
    expect(repository.getAccountsOfType(account.type), [account]);
  });
}
