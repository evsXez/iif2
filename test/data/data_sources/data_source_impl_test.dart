import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:iif/data/data_sources/data_source_impl.dart';
import 'package:iif/data/data_sources/keys.dart';
import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../account_model_fixtures.dart';
import 'data_source_impl_test.mocks.dart';
import 'fixtures.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late DataSource dataSource;
  final AccountModel accountModelFixed = AccountModel(
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
        accountModel: accountModelFixed,
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
        accountModel: accountModelFixed,
      ),
    ],
  );
  final String accountModelJson = json.encode(accountModelFixed.toJson());
  final List<AccountModel> accountsPersisted = [accountModelFixed];
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

    expect(dataSource.getAcounts().contains(accountModelFixed), isFalse);
    dataSource.addAcount(accountModelFixed);
    expect(dataSource.getAcounts().contains(accountModelFixed), isTrue);
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

  test('after editing account we can get updated version', () {
    const type = AccountType.money;
    final accountModelOriginal = accountModel(1, type, name: "original", isArchived: false);
    final accountModelUpdated = accountModel(1, type, name: "updated", isArchived: true);

    List<String> stringList = [json.encode(accountModelOriginal.toJson())];
    when(prefs.getStringList(Keys.accounts.toString())).thenAnswer((_) => stringList);
    when(prefs.setStringList(Keys.accounts.toString(), any)).thenAnswer((realInvocation) async {
      final List<String> list = realInvocation.positionalArguments[1];
      stringList = list;
      return true;
    });

    final before = dataSource.getAcounts();
    expect(before.length, 1);
    expect(before.first, accountModelOriginal);

    dataSource.updateAcount(accountModelUpdated);

    final after = dataSource.getAcounts();
    expect(after.length, 1);
    expect(after.first, accountModelUpdated);
  });
}
