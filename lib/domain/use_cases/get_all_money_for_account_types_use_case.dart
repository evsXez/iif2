import 'package:iif/domain/include.dart';

class GetAllMoneyForAccountTypesUseCase {
  final GetAccountsBalanceUseCase _getAccountsBalanceUseCase;
  final GetAccountTypesOnMainPageUseCase _getAccountTypesOnMainPageUseCase;

  GetAllMoneyForAccountTypesUseCase(
    this._getAccountsBalanceUseCase,
    this._getAccountTypesOnMainPageUseCase,
  );

  Future<List<MapEntry<AccountType, Money?>>> execute() async {
    final types = _getAccountTypesOnMainPageUseCase.execute();

    final List<MapEntry<AccountType, Money?>> result = [];
    await Future.forEach(types, (AccountType type) async {
      final sum = await _calculateSum(type);
      result.add(MapEntry(type, sum));
    });
    return result;
  }

  Future<Money> _calculateSum(AccountType type) async {
    final accountBalances = await _getAccountsBalanceUseCase.execute(type);
    Money accumulator = Money.zero;
    for (var accountBalance in accountBalances) {
      accumulator = accumulator.add(accountBalance.money);
    }
    return accumulator;
  }
}
