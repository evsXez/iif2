import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/use_cases/get_all_money_for_account_types_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_all_money_for_account_types_use_case_test.mocks.dart';

@GenerateMocks([GetAccountsBalanceUseCase, GetAccountTypesOnMainPageUseCase])
void main() {
  late GetAllMoneyForAccountTypesUseCase getAllMoneyForAccountTypesUseCase;
  late MockGetAccountsBalanceUseCase getAccountsBalanceUseCase;
  late MockGetAccountTypesOnMainPageUseCase getAccountTypesOnMainPageUseCase;

  final account1 = Account(id: 1, name: "account1", type: AccountType.money, currency: Currency.debugDefault);
  final account2 = Account(id: 2, name: "account2", type: AccountType.money, currency: Currency.debugDefault);
  final account3 = Account(id: 3, name: "account3", type: AccountType.creditCards, currency: Currency.debugDefault);
  const int coins1 = 11;
  const int coins2 = 22;
  const int coins3 = 100;

  final List<AccountBalance> accountBalancesMoney = [
    AccountBalance(account1, const Money(coins: coins1)),
    AccountBalance(account2, const Money(coins: coins2)),
  ];
  final List<AccountBalance> accountBalancesCreditCards = [
    AccountBalance(account3, const Money(coins: coins3)),
  ];

  setUp(() {
    getAccountsBalanceUseCase = MockGetAccountsBalanceUseCase();
    getAccountTypesOnMainPageUseCase = MockGetAccountTypesOnMainPageUseCase();

    getAllMoneyForAccountTypesUseCase =
        GetAllMoneyForAccountTypesUseCase(getAccountsBalanceUseCase, getAccountTypesOnMainPageUseCase);
  });

  test('calculation for two account types', () async {
    when(getAccountTypesOnMainPageUseCase.execute()).thenReturn([AccountType.money, AccountType.creditCards]);
    when(getAccountsBalanceUseCase.execute(AccountType.money))
        .thenAnswer((realInvocation) async => accountBalancesMoney);
    when(getAccountsBalanceUseCase.execute(AccountType.creditCards))
        .thenAnswer((realInvocation) async => accountBalancesCreditCards);

    final result = await getAllMoneyForAccountTypesUseCase.execute();
    final stringResult = result.map((it) => it.toString()).toList(); //had to compare as strings

    expect(
      stringResult,
      [
        const MapEntry(AccountType.money, Money(coins: coins1 + coins2)),
        const MapEntry(AccountType.creditCards, Money(coins: coins3)),
      ].map((it) => it.toString()).toList(),
    );
  });
}
