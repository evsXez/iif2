import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:iif/domain/use_cases/add_income_use_case.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import '../mocks.mocks.dart';
import '../operation_fixtures.dart';

void main() {
  late AddTransferUseCase addTransferUseCase;
  late MockOperationsRepository mockOperationsRepository;
  final Account accountFrom = getAccount(0, AccountType.money);
  final Account accountTo = getAccount(1, AccountType.money);
  late List<LogicOperation> listOperations;
  final money = money100;
  const initialMoneyFrom = Money(coins: 1000);
  const initialMoneyTo = Money(coins: 500);

  setUp(() {
    mockOperationsRepository = MockOperationsRepository();

    addTransferUseCase = AddTransferUseCase(
      operationsRepository: mockOperationsRepository,
    );
    listOperations = [
      getLogicOperationInitialInput(accountFrom, initialMoneyFrom),
      getLogicOperationInitialInput(accountTo, initialMoneyTo),
    ];

    when(mockOperationsRepository.getOperations(accountFrom)).thenAnswer((_) async =>
        listOperations.where((it) => it.atomics.any((atomic) => atomic.account.id == accountFrom.id)).toList());
    when(mockOperationsRepository.getOperations(accountTo)).thenAnswer((_) async =>
        listOperations.where((it) => it.atomics.any((atomic) => atomic.account.id == accountTo.id)).toList());

    when(mockOperationsRepository.addOperationTransfer(accountFrom, accountTo, money)).thenAnswer((_) {
      listOperations.add(LogicOperation.transfer(accountFrom, accountTo, money));
    });
    when(mockOperationsRepository.calculateBalance(any)).thenAnswer((realInvocation) async {
      final Account account = realInvocation.positionalArguments.first;
      Money sum = Money.zero;
      for (final operation in listOperations) {
        try {
          final atomic = operation.atomics.firstWhere((it) => it.account.id == account.id);
          final Money money = atomic.money;
          switch (atomic.type) {
            case AtomicOperationType.initialInput:
              sum = money;
              break;
            case AtomicOperationType.income:
              sum = sum.add(money);
              break;
            case AtomicOperationType.expense:
              sum = sum.substract(money);
              break;
            default:
          }
        } catch (_) {}
      }
      return sum;
    });
  });

  test('after adding transfer operation we can get it', () async {
    final operationsBefore = await mockOperationsRepository.getOperations(accountFrom);
    expect(operationsBefore.length, 1);
    addTransferUseCase.execute(accountFrom, accountTo, money);
    final operations = await mockOperationsRepository.getOperations(accountFrom);
    expect(operations.length, 2);
    expect(operations.last.type, LogicOperationType.transfer);
  });

  test('after adding transfer operation the balance changes right', () async {
    final Money balanceBeforeFrom = await mockOperationsRepository.calculateBalance(accountFrom);
    final Money balanceBeforeTo = await mockOperationsRepository.calculateBalance(accountTo);
    expect(balanceBeforeFrom, initialMoneyFrom);
    expect(balanceBeforeTo, initialMoneyTo);
    addTransferUseCase.execute(accountFrom, accountTo, money);
    final Money balanceAfterFrom = await mockOperationsRepository.calculateBalance(accountFrom);
    final Money balanceAfterTo = await mockOperationsRepository.calculateBalance(accountTo);
    expect(balanceAfterFrom, balanceBeforeFrom.substract(money));
    expect(balanceAfterTo, balanceBeforeTo.add(money));
  });
}
