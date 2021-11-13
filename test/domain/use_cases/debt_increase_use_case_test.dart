import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import '../mocks.mocks.dart';
import '../operation_fixtures.dart';

void main() {
  late DebtIncreaseUseCase debtIncreaseUseCase;
  late MockOperationsRepository mockOperationsRepository;
  final Account account = accountMoney;
  final Account subjectAccount = getAccount(5, AccountType.debts);
  late List<LogicOperation> listOperations;
  final money = money100;
  const initialMoney = Money(coins: 1000);
  final subject = Subject("John K.", SubjectType.debts, subjectAccount);

  setUp(() {
    mockOperationsRepository = MockOperationsRepository();

    debtIncreaseUseCase = DebtIncreaseUseCase(
      operationsRepository: mockOperationsRepository,
    );
    listOperations = [
      getLogicOperationInitialInput(account, initialMoney),
    ];

    when(mockOperationsRepository.getOperations(account)).thenAnswer((_) async => listOperations);
    when(mockOperationsRepository.addOperationDebtIncrease(account, money, subject)).thenAnswer((_) {
      listOperations.add(LogicOperation.debtIncrease(account, money, subject));
    });
    when(mockOperationsRepository.calculateBalance(any)).thenAnswer((realInvocation) async {
      final argument = realInvocation.positionalArguments.first as Account;
      Money sum = Money.zero;
      for (final operation in listOperations) {
        try {
          final AtomicOperation atomic = operation.atomics.firstWhere((it) => it.account.id == argument.id);
          switch (atomic.type) {
            case AtomicOperationType.initialInput:
              sum = atomic.money;
              break;
            case AtomicOperationType.expense:
              sum = sum.substract(atomic.money);
              break;
            case AtomicOperationType.income:
              sum = sum.add(atomic.money);
              break;
            default:
          }
        } catch (notFoundAtomic) {}
      }
      return sum;
    });
  });

  test('after adding debt increase operation we can get it', () async {
    debtIncreaseUseCase.execute(account, money, subject: subject);
    final operations = await mockOperationsRepository.getOperations(account);
    expect(operations.length, 2);
    expect(operations.last.type, LogicOperationType.debts);
    expect(operations.last.atomics.length, 2);

    final atomicAccount = operations.last.atomics.firstWhere((it) => it.type == AtomicOperationType.income);
    final atomicSubject = operations.last.atomics.firstWhere((it) => it.type == AtomicOperationType.expense);
    expect(atomicAccount.account, account);
    expect(atomicAccount.money, money);
    expect(atomicSubject.account, subject.account);
    expect(atomicSubject.money, money);
  });

  test('after adding debt increase operation the balances changes right', () async {
    final Money balanceBefore = await mockOperationsRepository.calculateBalance(account);
    expect(balanceBefore, initialMoney);
    debtIncreaseUseCase.execute(account, money, subject: subject);
    final Money balanceAccountAfter = await mockOperationsRepository.calculateBalance(account);
    final Money balanceSubjectAfter = await mockOperationsRepository.calculateBalance(subject.account);
    expect(balanceAccountAfter, balanceBefore.add(money));
    expect(balanceSubjectAfter, Money.zero.substract(money));
  });
}
