import 'package:flutter_test/flutter_test.dart';

import '../debts_use_cases.setup.dart';

void main() {
  setUp(() {
    debtsSetUp();
  });

  test('after adding debt decrease operation we can get it', () async {
    await testAfterAddingDebtOperationWeCanGetIt(
      () {
        debtDecreaseUseCase.execute(account, money, subject: subject);
      },
      mockOperationsRepository,
      account,
      money,
      subject,
    );
  });

  test('after adding debt increase operation the balances changes right', () async {
    await testAfterAddingDebtOperationTheBalanceChangesRight(
      () {
        debtDecreaseUseCase.execute(account, money, subject: subject);
      },
      mockOperationsRepository,
      account,
      money,
      subject,
      accountBalanceShouldIncrease: false,
    );
  });
}
