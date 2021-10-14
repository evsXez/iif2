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
  late DataSource dataSource;
  final AccountModel accountModel = AccountModel(
    id: 244,
    name: "account#244",
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
          accountModel: accountModel,
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
          accountModel: accountModel,
        ),
      ],
    ),
    LogicOperationModel(
      id: 4,
      type: LogicOperationType.expense,
      created: DateTime.fromMillisecondsSinceEpoch(0),
      comment: "",
      atomicsModel: [
        AtomicOperationModel(
          id: 5,
          moneyModel: MoneyModel(coins: 9),
          type: AtomicOperationType.expense,
          accountModel: accountModel,
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
  // Future<List<Operation>> getOperations(Account account);

  test('calculate balance', () async {
    when(dataSource.getOperations()).thenReturn(allLogicOperations);
    final Money money = await repository.calculateBalance(accountModel);
    expect(money, moneyForAccount);
  });
}
