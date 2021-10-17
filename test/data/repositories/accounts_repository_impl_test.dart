import 'package:flutter_test/flutter_test.dart';
import 'package:iif/data/data_sources/data_source_impl.dart';
import 'package:iif/data/include.dart';
import 'package:iif/data/repositories/accounts_repository_impl.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../account_model_fixtures.dart';
import 'accounts_repository_impl_test.mocks.dart';

@GenerateMocks([DataSource])
void main() {
  late AccountsRepository repository;
  late MockDataSource mockDataSource;
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

  final type = AccountType.investments;

  setUp(() {
    mockDataSource = MockDataSource();
    repository = AccountsRepositoryImpl(mockDataSource);
    initiallyEmptyAccounts.clear();
  });

  test('data source has data and repository fetches it by type', () async {
    when(mockDataSource.getAcounts()).thenReturn(allAccounts);
    expect(repository.getAccountsOfType(type1), accountsType1);
    expect(repository.getAccountsOfType(type2), accountsType2);
  });

  test('data source has no data, then save, then it has data', () async {
    when(mockDataSource.getAcounts()).thenReturn(initiallyEmptyAccounts);
    when(mockDataSource.addAcount(account)).thenAnswer((_) {
      initiallyEmptyAccounts.add(account);
      return account;
    });
    expect(repository.getAccountsOfType(account.type), []);
    repository.saveAccount(account);
    expect(repository.getAccountsOfType(account.type), [account]);
  });
  test('data modification', () {
    const id = 1;
    const modifiedName = "modified";
    final account = accountModel(id, type);

    List<AccountModel> accountModels = [account];
    when(mockDataSource.getAcounts()).thenReturn(accountModels);
    when(mockDataSource.updateAcount(any)).thenAnswer((realInvocation) {
      final account = realInvocation.positionalArguments.first;
      accountModels.clear();
      accountModels.add(account);
    });

    final dataBefore = repository.getAccountsOfType(type);
    expect(dataBefore.length, 1);
    expect(dataBefore.first.id, id);

    final modifiedAccount = accountModel(id, type, name: modifiedName);
    repository.saveAccount(modifiedAccount);
    verify(mockDataSource.updateAcount(modifiedAccount));
    verifyNever(mockDataSource.addAcount(any));

    final dataAfter = repository.getAccountsOfType(type);
    expect(dataAfter.length, 1);
    expect(dataAfter.first.id, id);
    expect(dataAfter.first.name, modifiedName);
  });
}
