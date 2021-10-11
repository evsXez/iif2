import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:iif/domain/use_cases/get_accounts_balance.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_accounts_balance_test.mocks.dart';

@GenerateMocks([AccountsRepository, OperationsRepository])
void main() {
  late GetAccountsBalanceUseCase getAccountsWithMoneyUseCase;
  late AccountsRepository mockAccountsRepository;
  late OperationsRepository mockOperationsRepository;
  const AccountType accountType = AccountType.money;

  final account1 = Account(currency: Currency.debugDefault, name: "name1", type: accountType);
  final account2 = Account(currency: Currency.debugDefault, name: "name2", type: accountType);

  const money1 = Money(100);
  const money2 = Money(200);

  setUp(() {
    mockAccountsRepository = MockAccountsRepository();
    mockOperationsRepository = MockOperationsRepository();

    getAccountsWithMoneyUseCase = GetAccountsBalanceUseCase(
      accountsRepository: mockAccountsRepository,
      operationsRepository: mockOperationsRepository,
    );
  });

  test('repositories have data and use case combines them', () async {
    when(mockAccountsRepository.getAccountsOfType(accountType)).thenReturn([account1, account2]);
    when(mockOperationsRepository.calculateMoney(account1)).thenAnswer((_) async => money1);
    when(mockOperationsRepository.calculateMoney(account2)).thenAnswer((_) async => money2);

    final data = await getAccountsWithMoneyUseCase.execute(accountType);
    expect(listEquals(data, [AccountBalance(account1, money1), AccountBalance(account2, money2)]), true);
  });
}
