import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/use_cases/get_fund_types_on_main_page.dart';

void main() {
  late GetFundTypesOnMainPage useCase;

  setUp(() {
    useCase = GetFundTypesOnMainPage();
  });

  test('show all fund types on main page', () {
    expect(useCase.execute(), FundType.values);
  });
}
