import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:iif/data/data_sources/data_source_impl.dart';
import 'package:iif/data/data_sources/keys.dart';
import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/account_fixtures.dart';
import '../../domain/operation_fixtures.dart';
import '../account_model_fixtures.dart';
import 'data_source_impl_test.mocks.dart';
import 'fixtures.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late DataSource dataSource;
  final AccountModel accountModelFixed = accountModel(
    15,
    AccountType.creditCards,
    name: "Account Name",
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
  List<String> listOfAccountsJson = [];
  List<String> listOfOperationsJson = [];
  late List<CategoryModel> listOfCategories;

  setUp(() async {
    prefs = MockSharedPreferences();
    dataSource = DataSourceImpl(prefs);

    nextGeneratedId = 15;
    when(prefs.getInt(Keys.nextId.toString())).thenAnswer((_) => nextGeneratedId);
    when(prefs.setInt(Keys.nextId.toString(), any)).thenAnswer((_) async {
      nextGeneratedId = nextGeneratedId + 1;
      return true;
    });

    when(prefs.getStringList(Keys.accounts.toString())).thenAnswer((_) => listOfAccountsJson);
    when(prefs.setStringList(Keys.accounts.toString(), any)).thenAnswer((realInvocation) async {
      final List<String> argument = realInvocation.positionalArguments[1];
      listOfAccountsJson = argument;
      return true;
    });
    when(prefs.getStringList(Keys.operations.toString())).thenAnswer((_) => listOfOperationsJson);
    when(prefs.setStringList(Keys.operations.toString(), any)).thenAnswer((realInvocation) async {
      final List<String> argument = realInvocation.positionalArguments[1];
      listOfOperationsJson = argument;
      return true;
    });

    listOfCategories = [
      CategoryModel(parentId: 0, id: 0, name: "root", type: CategoryType.undefined),
      CategoryModel(parentId: 0, id: 1, name: "expense", type: CategoryType.expense),
    ];
    when(prefs.getStringList(Keys.categories.toString()))
        .thenAnswer((_) => listOfCategories.map((it) => json.encode(it.toJson())).toList());
    when(prefs.setStringList(Keys.categories.toString(), any)).thenAnswer((realInvocation) async {
      final List<String> argument = realInvocation.positionalArguments[1];
      listOfCategories = argument.map((e) => CategoryModel.fromJson(jsonDecode(e))).toList();
      return true;
    });
  });

  test('previously added accounts persisted', () {
    when(prefs.getStringList(Keys.accounts.toString())).thenReturn(persistedAccountsFixture);
    expect(dataSource.getAccounts(), accountsPersisted);
  });

  test('after adding account we can get it', () {
    final List<String> stringList = [];
    when(prefs.getStringList(Keys.accounts.toString())).thenReturn(stringList);
    when(prefs.setStringList(Keys.accounts.toString(), [accountModelJson])).thenAnswer((_) async {
      stringList.add(accountModelJson);
      return true;
    });

    expect(dataSource.getAccounts().contains(accountModelFixed), isFalse);
    dataSource.addAcount(accountModelFixed, null, null);
    expect(dataSource.getAccounts().contains(accountModelFixed), isTrue);
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
    when(prefs.getStringList(Keys.operations.toString())).thenReturn([]);
    when(prefs.setStringList(Keys.operations.toString(), any)).thenAnswer((_) async => true);
    when(prefs.getStringList(Keys.accounts.toString())).thenAnswer((_) => stringList);
    when(prefs.setStringList(Keys.accounts.toString(), any)).thenAnswer((realInvocation) async {
      final List<String> list = realInvocation.positionalArguments[1];
      stringList = list;
      return true;
    });

    final before = dataSource.getAccounts();
    expect(before.length, 1);
    expect(before.first, accountModelOriginal);

    dataSource.updateAcount(accountModelUpdated, null, null);

    final after = dataSource.getAccounts();
    expect(after.length, 1);
    expect(after.first, accountModelUpdated);
  });

  test('after updating account, the account from operations updates accordingly', () {
    const nameOriginal = "original";
    const nameUpdated = "updated";

    final accountTemplate = getAccount(-1, AccountType.money, name: nameOriginal);

    final accountOriginal = dataSource.addAcount(accountTemplate, null, null);
    dataSource.addOperation(getLogicOperationInitialInput(accountOriginal, money999));

    final accountUpdated = Account(
        id: accountOriginal.id, name: nameUpdated, type: accountOriginal.type, currency: accountOriginal.currency);
    dataSource.updateAcount(accountUpdated, null, null);

    final accountFromOperation = dataSource.getOperations().first.atomics.first.account;
    expect(accountFromOperation.name, nameUpdated);
  });

  test('after deleting account we can\'t get it', () {
    listOfAccountsJson = [accountModelJson];

    expect(dataSource.getAccounts().first, accountModelFixed);
    dataSource.deleteAcount(accountModelFixed);
    expect(dataSource.getAccounts(), isEmpty);
  });

  test('after deleting account we delete operations with this account too', () {
    listOfAccountsJson = [accountModelJson];

    dataSource.addOperation(getLogicOperationInitialInput(accountModelFixed, money999));

    expect(dataSource.getOperations(), isNotEmpty);
    dataSource.deleteAcount(accountModelFixed);
    expect(dataSource.getOperations(), isEmpty);
  });

  test('get categories returns list', () {
    final result = dataSource.getCategories();
    expect(result, listOfCategories);
  });

  test('add category adds to the list', () {
    expect(dataSource.getCategories().length, 2);
    final categoryModel = dataSource.addCategory(
      Category.template(name: "name category added", type: CategoryType.income),
      Category(0, "", CategoryType.undefined),
    );
    expect(dataSource.getCategories().length, 3);
  });

  test('update category updates it', () {
    final newName = "name category updated";
    final newType = CategoryType.transfer;
    expect(dataSource.getCategories().length, 2);
    final categoryModel = dataSource.updateCategory(Category(1, newName, newType));
    final categories = dataSource.getCategories();
    expect(categories.length, 2);
    final updated = categories.firstWhere((it) => it.id == 1);
    expect(updated.name, newName);
    expect(updated.type, newType);
  });
}
