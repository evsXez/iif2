import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:iif/domain/use_cases/get_accounts_balance_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_accounts_balance_use_case_test.mocks.dart';

@GenerateMocks([AccountsRepository, OperationsRepository])
void main() {
  late GetAccountsBalanceUseCase getAccountsBalanceUseCase;
  late AccountsRepository mockAccountsRepository;
  late OperationsRepository mockOperationsRepository;
  const AccountType accountType = AccountType.money;

  final account1 = Account(id: 11, currency: Currency.debugDefault, name: "name1", type: accountType);
  final account2 = Account(id: 12, currency: Currency.debugDefault, name: "name2", type: accountType);

  const money1 = Money(coins: 100);
  const money2 = Money(coins: 200);

  setUp(() {
    mockAccountsRepository = MockAccountsRepository();
    mockOperationsRepository = MockOperationsRepository();

    getAccountsBalanceUseCase = GetAccountsBalanceUseCase(
      accountsRepository: mockAccountsRepository,
      operationsRepository: mockOperationsRepository,
    );
  });

  test('repositories have data and use case combines them', () async {
    when(mockAccountsRepository.getAccountsOfType(accountType)).thenReturn([account1, account2]);
    when(mockOperationsRepository.calculateBalance(account1)).thenAnswer((_) async => money1);
    when(mockOperationsRepository.calculateBalance(account2)).thenAnswer((_) async => money2);

    final data = await getAccountsBalanceUseCase.execute(accountType);
    expect(data, [AccountBalance(account1, money1), AccountBalance(account2, money2)]);
  });
}
