import 'package:flutter_test/flutter_test.dart';
import 'package:iif/data/data_sources/data_source.dart';
import 'package:iif/data/include.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../domain/operation_fixtures.dart';
import '../account_model_fixtures.dart';
import 'accounts_repository_impl_test.mocks.dart';

@GenerateMocks([DataSource])
void main() {
  final money = money100;
  late MockDataSource dataSource;
  final AccountModel accountModel1 = AccountModel(
    id: 244,
    name: "account#244",
    type: AccountType.investments,
    currency: Currency.debugDefault,
  );
  final AccountModel accountModel2 = AccountModel(
    id: 245,
    name: "account#245",
    type: AccountType.investments,
    currency: Currency.debugDefault,
  );
  const Money moneyForAccount = Money(coins: 1001);
  final List<LogicOperationModel> allLogicOperations = [
    LogicOperationModel(
      id: 0,
      type: LogicOperationType.initialInput,
      created: DateTime.fromMillisecondsSinceEpoch(0),
      comment: "",
      atomicsModel: [
        AtomicOperationModel(
          id: 1,
          moneyModel: MoneyModel(coins: 1000),
          type: AtomicOperationType.initialInput,
          accountModel: accountModel1,
        ),
      ],
    ),
    LogicOperationModel(
      id: 2,
      type: LogicOperationType.income,
      created: DateTime.fromMillisecondsSinceEpoch(0),
      comment: "",
      atomicsModel: [
        AtomicOperationModel(
          id: 3,
          moneyModel: MoneyModel(coins: 10),
          type: AtomicOperationType.income,
          accountModel: accountModel1,
        ),
      ],
    ),
    LogicOperationModel(
      id: 4,
      type: LogicOperationType.initialInput,
      created: DateTime.fromMillisecondsSinceEpoch(0),
      comment: "",
      atomicsModel: [
        AtomicOperationModel(
          id: 5,
          moneyModel: MoneyModel(coins: 250),
          type: AtomicOperationType.initialInput,
          accountModel: accountModel2,
        ),
      ],
    ),
    LogicOperationModel(
      id: 6,
      type: LogicOperationType.expense,
      created: DateTime.fromMillisecondsSinceEpoch(0),
      comment: "",
      atomicsModel: [
        AtomicOperationModel(
          id: 7,
          moneyModel: MoneyModel(coins: 9),
          type: AtomicOperationType.expense,
          accountModel: accountModel1,
        ),
      ],
    ),
  ];
  late OperationsRepository repository;
  final Subject subject = Subject("subject", SubjectType.debts, accountModel(333, AccountType.debtsAndLoans));
  late List<LogicOperationModel> defaultAllOperations;

  setUp(() {
    dataSource = MockDataSource();
    repository = OperationsRepositoryImpl(dataSource);

    defaultAllOperations = [];

    when(dataSource.getOperations()).thenAnswer((_) => defaultAllOperations);
    when(dataSource.addOperation(any)).thenAnswer((realInvocation) {
      final LogicOperation operation = realInvocation.positionalArguments.first;
      final AtomicOperation atomic1 = operation.atomics.first;
      final AtomicOperation atomic2 = operation.atomics.last;
      defaultAllOperations.add(
        LogicOperationModel(
          id: -1,
          type: operation.type,
          created: operation.created,
          comment: operation.comment,
          categoriesStamp: operation.categoriesStamp,
          subjectsStamp: operation.subjectsStamp,
          atomicsModel: [
            atomicOperationModel(
                -1, atomic1.type, atomic1.money, accountModel(atomic1.account.id, atomic1.account.type)),
            atomicOperationModel(
                -1, atomic2.type, atomic2.money, accountModel(atomic2.account.id, atomic2.account.type)),
          ],
        ),
      );
    });
  });

  Future testOperationDebtsAdded() async {
    final operations = await repository.getOperations(accountModel1);

    expect(operations.length, 1);
    final operation = operations.first;
    expect(operation.type, LogicOperationType.debts);
    expect(operation.atomics.length, 2);
    final atomicAccount = operation.atomics.firstWhere((it) => it.type == AtomicOperationType.income);
    final atomicSubject = operation.atomics.firstWhere((it) => it.type == AtomicOperationType.expense);
    expect(atomicAccount.money.coins, money.coins);
    expect(atomicSubject.money.coins, money.coins);
  }

  // void addOperationInitialInput(Account account, Money money);

  test('calculate balance', () async {
    when(dataSource.getOperations()).thenReturn(allLogicOperations);
    final Money money = await repository.calculateBalance(accountModel1);
    expect(money, moneyForAccount);
  });

  test('get list of operations for account', () async {
    when(dataSource.getOperations()).thenReturn(allLogicOperations);
    final operationsForAccount1 = await repository.getOperations(accountModel1);
    final operationsForAccount2 = await repository.getOperations(accountModel2);
    expect(operationsForAccount1,
        allLogicOperations.where((it) => it.atomics.any((atomic) => atomic.account.id == accountModel1.id)).toList());
    expect(operationsForAccount2,
        allLogicOperations.where((it) => it.atomics.any((atomic) => atomic.account.id == accountModel2.id)).toList());
  });

  test('adds operation initial input', () async {
    final initialInput = allLogicOperations.firstWhere((it) => it.type == LogicOperationType.initialInput);

    when(dataSource.getOperations()).thenReturn(defaultAllOperations);
    when(dataSource.addOperation(any)).thenAnswer((realInvocation) {
      final LogicOperation operation = realInvocation.positionalArguments.first;
      final AtomicOperation atomic = operation.atomics.first;
      defaultAllOperations.add(
        LogicOperationModel(
          id: -1,
          type: operation.type,
          created: operation.created,
          comment: operation.comment,
          atomicsModel: [
            AtomicOperationModel(
              id: -1,
              moneyModel: MoneyModel(coins: atomic.money.coins),
              type: atomic.type,
              accountModel: accountModel1,
            )
          ],
        ),
      );
    });

    repository.addOperationInitialInput(accountModel1, initialInput.atomics.first.money);
    final operations = await repository.getOperations(accountModel1);
    expect(operations.length, 1);
    expect(operations.first.type, LogicOperationType.initialInput);
  });

  test('we can get all operations from data source', () async {
    when(dataSource.getOperations()).thenReturn(allLogicOperations);
    expect(await repository.getAllOperations(), allLogicOperations);
  });
  test('add operation initial input notifies listeners', () async {
    when(dataSource.addOperation(any)).thenAnswer((_) {});

    int listenerCounter = 0;
    repository.addListener(() {
      listenerCounter++;
    });
    repository.addOperationInitialInput(accountModel1, money100);
    expect(listenerCounter, 1);
  });

  test('adds operation expense', () async {
    final List<LogicOperationModel> allOperations = [];
    when(dataSource.getOperations()).thenAnswer((_) => allOperations);
    when(dataSource.addOperation(any)).thenAnswer((realInvocation) {
      final LogicOperation operation = realInvocation.positionalArguments.first;
      final AtomicOperation atomic = operation.atomics.first;
      allOperations.add(
        LogicOperationModel(
          id: -1,
          type: operation.type,
          created: operation.created,
          comment: operation.comment,
          atomicsModel: [
            AtomicOperationModel(
              id: -1,
              moneyModel: MoneyModel(coins: atomic.money.coins),
              type: atomic.type,
              accountModel: accountModel1,
            )
          ],
        ),
      );
    });

    repository.addOperationExpense(accountModel1, money100);
    final operations = await repository.getOperations(accountModel1);
    expect(operations.length, 1);
    expect(operations.first.type, LogicOperationType.expense);
  });

  test('adds operation income', () async {
    final List<LogicOperationModel> allOperations = [];
    when(dataSource.getOperations()).thenAnswer((_) => allOperations);
    when(dataSource.addOperation(any)).thenAnswer((realInvocation) {
      final LogicOperation operation = realInvocation.positionalArguments.first;
      final AtomicOperation atomic = operation.atomics.first;
      allOperations.add(
        LogicOperationModel(
          id: -1,
          type: operation.type,
          created: operation.created,
          comment: operation.comment,
          atomicsModel: [
            AtomicOperationModel(
              id: -1,
              moneyModel: MoneyModel(coins: atomic.money.coins),
              type: atomic.type,
              accountModel: accountModel1,
            )
          ],
        ),
      );
    });

    repository.addOperationIncome(accountModel1, money100);
    final operations = await repository.getOperations(accountModel1);
    expect(operations.length, 1);
    expect(operations.first.type, LogicOperationType.income);
  });

  test('adds operation debt increase', () async {
    repository.addOperationDebtIncrease(accountModel1, money, subject);
    await testOperationDebtsAdded();
  });
  test('adds operation debt decrease', () async {
    repository.addOperationDebtDecrease(accountModel1, money, subject);
    await testOperationDebtsAdded();
  });
  test('adds operation loan increase', () async {
    repository.addOperationLoanIncrease(accountModel1, money, subject);
    await testOperationDebtsAdded();
  });
  test('adds operation loan decrease', () async {
    repository.addOperationLoanDecrease(accountModel1, money, subject);
    await testOperationDebtsAdded();
  });
}
