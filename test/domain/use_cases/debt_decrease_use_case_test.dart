import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';
import 'package:mockito/mockito.dart';

import '../debts_use_cases.setup.dart';
import '../mocks.mocks.dart';

void main() {
  setUp(() {
    debtsSetUp();
  });

  test('after adding debt increase operation we can get it', () async {
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
