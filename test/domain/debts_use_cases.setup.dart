import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/use_cases/debt_increase_use_case.dart';
import 'package:mockito/mockito.dart';

import '../data/account_model_fixtures.dart';
import 'account_fixtures.dart';
import 'mocks.mocks.dart';
import 'operation_fixtures.dart';

late DebtIncreaseUseCase debtIncreaseUseCase;
late DebtDecreaseUseCase debtDecreaseUseCase;
late LoanIncreaseUseCase loanIncreaseUseCase;
late LoanDecreaseUseCase loanDecreaseUseCase;
late MockOperationsRepository mockOperationsRepository;
late MockAccountsRepository mockAccountsRepository;
final Account account = accountMoney;
late List<LogicOperation> listOperations;
final money = money100;
const initialMoney = Money(coins: 1000);
final debtAccount = accountModel(1001, AccountType.debtsAndLoans, name: "John K.");
final subject = Subject(1002, "subject name", SubjectType.debts);

void debtsSetUp() {
  mockOperationsRepository = MockOperationsRepository();
  mockAccountsRepository = MockAccountsRepository();

  debtIncreaseUseCase =
      DebtIncreaseUseCase(operationsRepository: mockOperationsRepository, accountsRepository: mockAccountsRepository);
  debtDecreaseUseCase =
      DebtDecreaseUseCase(operationsRepository: mockOperationsRepository, accountsRepository: mockAccountsRepository);
  loanIncreaseUseCase =
      LoanIncreaseUseCase(operationsRepository: mockOperationsRepository, accountsRepository: mockAccountsRepository);
  loanDecreaseUseCase =
      LoanDecreaseUseCase(operationsRepository: mockOperationsRepository, accountsRepository: mockAccountsRepository);
  listOperations = [
    getLogicOperationInitialInput(account, initialMoney),
  ];

  when(mockAccountsRepository.getAccountForSubject(any)).thenAnswer((realInvocation) {
    final Subject? subject = realInvocation.positionalArguments.first;
    return debtAccount;
  });

  when(mockOperationsRepository.getOperations(account)).thenAnswer((_) async => listOperations);
  when(mockOperationsRepository.addOperationDebtIncrease(account, money, debtAccount)).thenAnswer((_) {
    listOperations.add(LogicOperation.debtIncrease(account, money, debtAccount));
  });
  when(mockOperationsRepository.addOperationDebtDecrease(account, money, debtAccount)).thenAnswer((_) {
    listOperations.add(LogicOperation.debtDecrease(account, money, debtAccount));
  });
  when(mockOperationsRepository.addOperationLoanIncrease(account, money, debtAccount)).thenAnswer((_) {
    listOperations.add(LogicOperation.loanIncrease(account, money, debtAccount));
  });
  when(mockOperationsRepository.addOperationLoanDecrease(account, money, debtAccount)).thenAnswer((_) {
    listOperations.add(LogicOperation.loanDecrease(account, money, debtAccount));
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
  expect(atomicSubject.account, debtAccount);
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
  final Money balanceSubjectAfter = await mockOperationsRepository.calculateBalance(debtAccount);
  expect(balanceAccountAfter, accountBalanceShouldIncrease ? balanceBefore.add(money) : balanceBefore.substract(money));
  expect(balanceSubjectAfter, accountBalanceShouldIncrease ? Money.zero.substract(money) : Money.zero.add(money));
}
