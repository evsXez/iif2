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
  const AccountType type2 = AccountType.debts;
  const AccountType typeCredit = AccountType.creditCards;
  final AccountModel account1Type1 = accountModel(1, type1, name: 'account1');
  final AccountModel account2Type1 = accountModel(2, type1, name: 'account2');
  final AccountModel account3Type1 = accountModel(3, type1, name: 'account3');
  final AccountModel account1Type2 = accountModel(4, type2, name: 'account1');
  final AccountModel account2Type2 = accountModel(5, type2, name: 'account2');
  final AccountModel accountDeletedType1 = accountModel(6, type1, name: 'account2', isDeleted: true);
  final CreditCardAccount account1TypeCredit =
      CreditCardAccount(id: 1, name: 'account1', currency: Currency.debugDefault, limit: const Money(coins: 10));

  final List<Account> accountsType1 = [
    account1Type1,
    account2Type1,
    account3Type1,
  ];
  final List<Account> accountsType2 = [
    account1Type2,
    account2Type2,
  ];
  final List<Account> accountsTypeCredit = [
    account1TypeCredit,
  ];
  final List<Account> allAccounts = [
    ...accountsType2,
    ...accountsType1,
    ...accountsTypeCredit,
  ];
  final List<AccountModel> initiallyEmptyAccounts = [];
  final account = accountModel(101, AccountType.debtsAndLoans, name: 'account to save');

  final List<AccountModel> accountsWithDeletedType1 = [
    account1Type1,
    account2Type1,
    accountDeletedType1,
    account3Type1,
  ];

  const type = AccountType.investments;

  setUp(() {
    mockDataSource = MockDataSource();
    repository = AccountsRepositoryImpl(mockDataSource);
    initiallyEmptyAccounts.clear();
  });

  test('data source has data and repository fetches it by type', () async {
    when(mockDataSource.getAccounts()).thenReturn(
      allAccounts
          .map((it) => AccountModel.fromAccount(it,
              subjectId: null, creditLimit: it is CreditCardAccount ? it.limit : Money.zero))
          .toList(),
    );
    expect(repository.getAccountsOfType(type1), accountsType1);
    expect(repository.getAccountsOfType(type2), accountsType2);
  });

  test('data source has credit accounts and repository fetches it', () async {
    when(mockDataSource.getAccounts()).thenReturn(
      allAccounts
          .map((it) => AccountModel.fromAccount(it,
              subjectId: null, creditLimit: it is CreditCardAccount ? it.limit : Money.zero))
          .toList(),
    );
    expect(repository.getAccountsOfType(typeCredit), accountsTypeCredit);
  });

  test('data source has archived accounts and repository\'s "getAccounts" ignores them', () async {
    when(mockDataSource.getAccounts()).thenReturn(accountsWithDeletedType1);
    expect(repository.getAccountsOfType(type1), everyElement((Account it) => !it.isArchived));
  });

  test('data source has no data, then save, then it has data', () async {
    when(mockDataSource.getAccounts()).thenReturn(initiallyEmptyAccounts);
    when(mockDataSource.addAcount(account, null, null)).thenAnswer((_) {
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
    when(mockDataSource.getAccounts()).thenReturn(accountModels);
    when(mockDataSource.updateAcount(any, null, null)).thenAnswer((realInvocation) {
      final account = realInvocation.positionalArguments.first;
      accountModels.clear();
      accountModels.add(account);
    });

    final dataBefore = repository.getAccountsOfType(type);
    expect(dataBefore.length, 1);
    expect(dataBefore.first.id, id);

    final modifiedAccount = accountModel(id, type, name: modifiedName);
    repository.saveAccount(modifiedAccount);
    verify(mockDataSource.updateAcount(modifiedAccount, null, null));
    verifyNever(mockDataSource.addAcount(any, null, null));

    final dataAfter = repository.getAccountsOfType(type);
    expect(dataAfter.length, 1);
    expect(dataAfter.first.id, id);
    expect(dataAfter.first.name, modifiedName);
  });
  test('save/update account calls notifies listeners', () {
    when(mockDataSource.getAccounts()).thenAnswer((realInvocation) => initiallyEmptyAccounts);
    when(mockDataSource.addAcount(account, null, null)).thenAnswer((_) {
      initiallyEmptyAccounts.add(account);
      return account;
    });
    int listenerCounter = 0;
    repository.addListener(() {
      listenerCounter++;
    });
    //save
    repository.saveAccount(account);
    expect(listenerCounter, 1);
    //update
    repository.saveAccount(account);
    expect(listenerCounter, 2);
  });
}
