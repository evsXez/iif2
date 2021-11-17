import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/use_cases/debt_increase_use_case.dart';
import 'package:mockito/mockito.dart';

import 'account_fixtures.dart';
import 'mocks.mocks.dart';
import 'operation_fixtures.dart';

late DebtIncreaseUseCase debtIncreaseUseCase;
late DebtDecreaseUseCase debtDecreaseUseCase;
late LoanIncreaseUseCase loanIncreaseUseCase;
late LoanDecreaseUseCase loanDecreaseUseCase;
late MockOperationsRepository mockOperationsRepository;
final Account account = accountMoney;
final Account subjectAccount = getAccount(5, AccountType.debtsAndLoans);
late List<LogicOperation> listOperations;
final money = money100;
const initialMoney = Money(coins: 1000);
final subject = Subject("John K.", SubjectType.debts, subjectAccount);

void debtsSetUp() {
  mockOperationsRepository = MockOperationsRepository();

  debtIncreaseUseCase = DebtIncreaseUseCase(operationsRepository: mockOperationsRepository);
  debtDecreaseUseCase = DebtDecreaseUseCase(operationsRepository: mockOperationsRepository);
  loanIncreaseUseCase = LoanIncreaseUseCase(operationsRepository: mockOperationsRepository);
  loanDecreaseUseCase = LoanDecreaseUseCase(operationsRepository: mockOperationsRepository);
  listOperations = [
    getLogicOperationInitialInput(account, initialMoney),
  ];

  when(mockOperationsRepository.getOperations(account)).thenAnswer((_) async => listOperations);
  when(mockOperationsRepository.addOperationDebtIncrease(account, money, subject)).thenAnswer((_) {
    listOperations.add(LogicOperation.debtIncrease(account, money, subject));
  });
  when(mockOperationsRepository.addOperationDebtDecrease(account, money, subject)).thenAnswer((_) {
    listOperations.add(LogicOperation.debtDecrease(account, money, subject));
  });
  when(mockOperationsRepository.addOperationLoanIncrease(account, money, subject)).thenAnswer((_) {
    listOperations.add(LogicOperation.loanIncrease(account, money, subject));
  });
  when(mockOperationsRepository.addOperationLoanDecrease(account, money, subject)).thenAnswer((_) {
    listOperations.add(LogicOperation.loanDecrease(account, money, subject));
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
}

Future testAfterAddingDebtOperationWeCanGetIt(VoidCallback useCase, MockOperationsRepository mockOperationsRepository,
    Account account, Money money, Subject subject) async {
  useCase();
  final operations = await mockOperationsRepository.getOperations(account);
  expect(operations.length, 2);
  expect(operations.last.type, LogicOperationType.debts);
  expect(operations.last.atomics.length, 2);

  final atomicAccount = operations.last.atomics.firstWhere((it) => it.account.type != AccountType.debtsAndLoans);
  final atomicSubject = operations.last.atomics.firstWhere((it) => it.account.type == AccountType.debtsAndLoans);
  expect(atomicAccount.account, account);
  expect(atomicAccount.money, money);
  expect(atomicSubject.account, subject.account);
  expect(atomicSubject.money, money);
}

Future testAfterAddingDebtOperationTheBalanceChangesRight(
  VoidCallback useCase,
  MockOperationsRepository mockOperationsRepository,
  Account account,
  Money money,
  Subject subject, {
  required bool accountBalanceShouldIncrease,
}) async {
  final Money balanceBefore = await mockOperationsRepository.calculateBalance(account);
  useCase();
  final Money balanceAccountAfter = await mockOperationsRepository.calculateBalance(account);
  final Money balanceSubjectAfter = await mockOperationsRepository.calculateBalance(subject.account);
  expect(balanceAccountAfter, accountBalanceShouldIncrease ? balanceBefore.add(money) : balanceBefore.substract(money));
  expect(balanceSubjectAfter, accountBalanceShouldIncrease ? Money.zero.substract(money) : Money.zero.add(money));
}
