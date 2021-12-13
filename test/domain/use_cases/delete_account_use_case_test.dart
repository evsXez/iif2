import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/use_cases/delete_account_use_case.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import '../mocks.mocks.dart';

void main() {
  late DeleteAccountUseCase deleteAccountUseCase;
  late MockAccountsRepository mockAccountsRepository;

  const type = AccountType.money;
  final accountToDelete = getAccount(0, type);

  setUp(() {
    mockAccountsRepository = MockAccountsRepository();
    deleteAccountUseCase = DeleteAccountUseCase(accountsRepository: mockAccountsRepository);
  });

  test('after deletion we can\'t get it through repository', () {
    final List<Account> listOfAccounts = [accountToDelete];
    when(mockAccountsRepository.getAccountsOfType(type))
        .thenAnswer((_) => listOfAccounts.where((it) => !it.isDeleted).toList());
    when(mockAccountsRepository.saveAccount(any)).thenAnswer((realInvocation) {
      final Account account = realInvocation.positionalArguments.first;

      listOfAccounts.clear();
      listOfAccounts.add(account);
      return account;
    });

    deleteAccountUseCase.execute(accountToDelete);
    expect(mockAccountsRepository.getAccountsOfType(type), isEmpty);
  });
}
