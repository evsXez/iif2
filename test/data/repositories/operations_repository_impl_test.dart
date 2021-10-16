import 'package:flutter_test/flutter_test.dart';
import 'package:iif/data/data_sources/data_source.dart';
import 'package:iif/data/include.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'accounts_repository_impl_test.mocks.dart';

@GenerateMocks([DataSource])
void main() {
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
  setUp(() {
    dataSource = MockDataSource();
    repository = OperationsRepositoryImpl(dataSource);
  });

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
    final List<LogicOperationModel> allOperations = [];
    final initialInput = allLogicOperations.firstWhere((it) => it.type == LogicOperationType.initialInput);

    when(dataSource.getOperations()).thenReturn(allOperations);
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

    repository.addOperationInitialInput(accountModel1, initialInput.atomics.first.money);
    final operations = await repository.getOperations(accountModel1);
    expect(operations.length, 1);
    expect(operations.first.type, LogicOperationType.initialInput);
  });
}
