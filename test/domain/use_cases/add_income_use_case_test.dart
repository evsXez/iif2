import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:iif/domain/use_cases/add_income_use_case.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import '../mocks.mocks.dart';
import '../operation_fixtures.dart';

void main() {
  late AddIncomeUseCase addIncomeUseCase;
  late OperationsRepository mockOperationsRepository;
  final Account account = accountMoney;
  late List<LogicOperation> listOperations;
  final money = money100;
  const initialMoney = Money(coins: 1000);

  setUp(() {
    mockOperationsRepository = MockOperationsRepository();

    addIncomeUseCase = AddIncomeUseCase(
      operationsRepository: mockOperationsRepository,
    );
    listOperations = [
      getLogicOperationInitialInput(account, initialMoney),
    ];

    when(mockOperationsRepository.getOperations(account)).thenAnswer((_) async => listOperations);
    when(mockOperationsRepository.addOperationIncome(account, money)).thenAnswer((_) {
      listOperations.add(LogicOperation.income(account, money));
    });
    when(mockOperationsRepository.calculateBalance(account)).thenAnswer((_) async {
      Money sum = Money.zero;
      for (final operation in listOperations) {
        final Money onlyFirstMoney = operation.atomics.first.money;
        switch (operation.type) {
          case LogicOperationType.initialInput:
            sum = onlyFirstMoney;
            break;
          case LogicOperationType.income:
            sum = sum.add(onlyFirstMoney);
            break;
          default:
        }
      }
      return sum;
    });
  });

  test('after adding income operation we can get it', () async {
    addIncomeUseCase.execute(account, money);
    final operations = await mockOperationsRepository.getOperations(account);
    expect(operations.length, 2);
    expect(operations.last.type, LogicOperationType.income);
  });

  test('after adding income operation the balance changes right', () async {
    final Money balanceBefore = await mockOperationsRepository.calculateBalance(account);
    expect(balanceBefore, initialMoney);
    addIncomeUseCase.execute(account, money);
    final Money balanceAfter = await mockOperationsRepository.calculateBalance(account);
    expect(balanceAfter, balanceBefore.add(money));
  });
}
