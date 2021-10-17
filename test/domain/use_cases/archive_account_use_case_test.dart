import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/use_cases/archive_account_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import 'archive_account_use_case_test.mocks.dart';

@GenerateMocks([AccountsRepository, GetAccountsBalanceUseCase])
void main() {
  late ArchiveAccountUseCase archiveAccountUseCase;
  late Account account;
  late MockAccountsRepository accountsRepository;
  late MockGetAccountsBalanceUseCase getAccountsBalanceUseCase;
  final type = AccountType.money;
  late List<Account> accountsData;

  setUp(() {
    accountsRepository = MockAccountsRepository();
    archiveAccountUseCase = ArchiveAccountUseCase(accountsRepository: accountsRepository);
    getAccountsBalanceUseCase = MockGetAccountsBalanceUseCase();

    account = getAccount(0, type);

    accountsData = [account];

    when(accountsRepository.getAccountsOfType(type)).thenReturn(accountsData);
    when(accountsRepository.saveAccount(any)).thenAnswer((realInvocation) {
      final Account accountToSave = realInvocation.positionalArguments.first;
      accountsData.clear();
      accountsData.add(accountToSave);
      return accountToSave;
    });
  });

  test('after archiving the special flag is set', () {
    expect(account.isArchived, false);
    final result = archiveAccountUseCase.execute(account);
    expect(result.isArchived, true);
  });
  test('after archiving account we can get archived version from repository', () {
    expect(accountsRepository.getAccountsOfType(type).first.isArchived, false);
    archiveAccountUseCase.execute(account);
    expect(accountsRepository.getAccountsOfType(type).first.isArchived, true);
  });
  test('after archiving it is no longer shown in list on main screen', () async {
    when(getAccountsBalanceUseCase.execute(type)).thenAnswer((_) async {
      final accounts = accountsRepository.getAccountsOfType(type);
      return accounts.map((it) => AccountBalance(it, Money.zero)).where((it) => !it.account.isArchived).toList();
    });

    expect((await getAccountsBalanceUseCase.execute(type)).map((it) => it.account).contains(account), true);
    archiveAccountUseCase.execute(account);
    expect((await getAccountsBalanceUseCase.execute(type)).map((it) => it.account).contains(account), false);
  });
}
