import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:iif/data/data_sources/data_source_impl.dart';
import 'package:iif/data/data_sources/keys.dart';
import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data_source_impl_test.mocks.dart';
import 'fixtures.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late DataSource dataSource;
  final AccountModel accountModel = AccountModel(
    id: 15,
    name: "Account Name",
    type: AccountType.creditCards,
    currency: const Currency(code: "RUB", symbol: "₽"),
  );
  final LogicOperationModel logicOperationModel1 = LogicOperationModel(
    id: 112,
    type: LogicOperationType.initialInput,
    created: DateTime.fromMillisecondsSinceEpoch(1634239069458),
    comment: "salary",
    atomicsModel: [
      AtomicOperationModel(
        id: 113,
        moneyModel: MoneyModel(coins: 1002),
        type: AtomicOperationType.initialInput,
        accountModel: accountModel,
      ),
    ],
  );
  final LogicOperationModel logicOperationModel2 = LogicOperationModel(
    id: 15,
    type: LogicOperationType.expense,
    created: DateTime.fromMillisecondsSinceEpoch(1634239069459),
    comment: "food",
    atomicsModel: [
      AtomicOperationModel(
        id: 16,
        moneyModel: MoneyModel(coins: 10),
        type: AtomicOperationType.expense,
        accountModel: accountModel,
      ),
    ],
  );
  final String accountModelJson = json.encode(accountModel.toJson());
  final List<AccountModel> accountsPersisted = [accountModel];
  final List<LogicOperationModel> operationsPersisted = [logicOperationModel1];
  late MockSharedPreferences prefs;
  final logicOperationModel2Json = json.encode(logicOperationModel2.toJson());
  int nextGeneratedId = 0;

  setUp(() async {
    prefs = MockSharedPreferences();
    dataSource = DataSourceImpl(prefs);

    nextGeneratedId = 15;
    when(prefs.getInt(Keys.nextId.toString())).thenAnswer((_) => nextGeneratedId);
    when(prefs.setInt(Keys.nextId.toString(), any)).thenAnswer((_) async {
      nextGeneratedId = nextGeneratedId + 1;
      return true;
    });
  });

  test('previously added accounts persisted', () {
    when(prefs.getStringList(Keys.accounts.toString())).thenReturn(persistedAccountsFixture);
    expect(dataSource.getAcounts(), accountsPersisted);
  });

  test('after adding account we can get it', () {
    final List<String> stringList = [];
    when(prefs.getStringList(Keys.accounts.toString())).thenReturn(stringList);
    when(prefs.setStringList(Keys.accounts.toString(), [accountModelJson])).thenAnswer((_) async {
      stringList.add(accountModelJson);
      return true;
    });

    expect(dataSource.getAcounts().contains(accountModel), isFalse);
    dataSource.addAcount(accountModel);
    expect(dataSource.getAcounts().contains(accountModel), isTrue);
  });

  test('previously added operations persisted', () {
    when(prefs.getStringList(Keys.operations.toString())).thenReturn(persistedOperationsFixture);
    expect(dataSource.getOperations(), operationsPersisted);
  });

  test('adding new operation', () {
    List<String> stringList = [];
    when(prefs.getStringList(Keys.operations.toString())).thenReturn(stringList);
    when(prefs.setStringList(Keys.operations.toString(), [logicOperationModel2Json])).thenAnswer((invocation) async {
      stringList = invocation.positionalArguments[1];
      return true;
    });
    expect(dataSource.getOperations().length, 0);
    dataSource.addOperation(logicOperationModel2);
    expect(dataSource.getOperations().length, 1);
  });
}
