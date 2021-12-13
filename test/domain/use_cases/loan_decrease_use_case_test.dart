import 'package:flutter_test/flutter_test.dart';

import '../debts_use_cases.setup.dart';

void main() {
  setUp(() {
    debtsSetUp();
  });

  test('after adding debt increase operation we can get it', () async {
    await testAfterAddingDebtOperationWeCanGetIt(
      () {
        loanDecreaseUseCase.execute(account, money, subject: subject);
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
        loanDecreaseUseCase.execute(account, money, subject: subject);
      },
      mockOperationsRepository,
      account,
      money,
      subject,
      accountBalanceShouldIncrease: true,
    );
  });
}
