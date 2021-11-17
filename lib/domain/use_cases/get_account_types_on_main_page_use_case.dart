import 'package:iif/domain/include.dart';

class GetAccountTypesOnMainPageUseCase {
  List<AccountType> execute() => [
        AccountType.money,
        AccountType.creditCards,
        AccountType.debts,
        AccountType.loans,
        AccountType.investments,
      ];
}
