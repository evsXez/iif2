import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/use_cases/get_accounts_balance_use_case.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import '../mocks.mocks.dart';

void main() {
  late GetAccountsBalanceUseCase getAccountsBalanceUseCase;
  late AccountsRepository mockAccountsRepository;
  late MockOperationsRepository mockOperationsRepository;
  const AccountType type = AccountType.money;

  final account1 = getAccount(1, type);
  final account2 = getAccount(2, type);
  final account3 = getAccount(3, type, isArchived: true);

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
    when(mockAccountsRepository.getAccountsOfType(type)).thenReturn([account1, account2]);
    when(mockOperationsRepository.calculateBalance(account1)).thenAnswer((_) async => money1);
    when(mockOperationsRepository.calculateBalance(account2)).thenAnswer((_) async => money2);

    final data = await getAccountsBalanceUseCase.execute(type);
    expect(data, [AccountBalance(account1, money1), AccountBalance(account2, money2)]);
  });
  test('we hide archived accounts from user', () async {
    when(mockAccountsRepository.getAccountsOfType(type)).thenReturn([account1, account2, account3]);
    when(mockOperationsRepository.calculateBalance(any)).thenAnswer((_) async => Money.zero);

    expect(await getAccountsBalanceUseCase.execute(type), [
      AccountBalance(account1, Money.zero),
      AccountBalance(account2, Money.zero),
    ]);
  });
}
