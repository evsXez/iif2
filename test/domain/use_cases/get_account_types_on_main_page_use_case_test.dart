import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/use_cases/get_account_types_on_main_page_use_case.dart';

void main() {
  late GetAccountTypesOnMainPageUseCase useCase;

  setUp(() {
    useCase = GetAccountTypesOnMainPageUseCase();
  });

  test('specific account types on main page', () {
    expect(useCase.execute(), [
      AccountType.money,
      AccountType.creditCards,
      AccountType.debts,
      AccountType.loans,
      AccountType.investments,
    ]);
  });
}
