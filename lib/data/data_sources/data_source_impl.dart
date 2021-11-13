import 'dart:convert';

import 'package:iif/data/data_sources/data_source.dart';
import 'package:iif/data/data_sources/keys.dart';
import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataSourceImpl extends DataSource {
  final SharedPreferences _prefs;
  DataSourceImpl(this._prefs);

  @override
  Account addAcount(Account accountTemplate) {
    final AccountModel account = AccountModel(
      id: _generateNextId(),
      name: accountTemplate.name,
      type: accountTemplate.type,
      currency: accountTemplate.currency,
      isArchived: accountTemplate.isArchived,
    );

    final List<String> list = _prefs.getStringList(Keys.accounts.toString()) ?? [];
    list.add(json.encode(account.toJson()));
    _prefs.setStringList(Keys.accounts.toString(), list);
    return account;
  }

  @override
  List<AccountModel> getAcounts() {
    final List<String>? list = _prefs.getStringList(Keys.accounts.toString());
    final List<AccountModel> result = [];
    list?.forEach((it) {
      result.add(AccountModel.fromJson(json.decode(it)));
    });

    return result;
  }

  @override
  List<LogicOperationModel> getOperations() {
    final List<String>? list = _prefs.getStringList(Keys.operations.toString());
    final List<LogicOperationModel> result = [];
    list?.forEach((it) {
      result.add(LogicOperationModel.fromJson(json.decode(it)));
    });

    return result;
  }

  int _generateNextId() {
    final int id = _prefs.getInt(Keys.nextId.toString()) ?? 0;
    _prefs.setInt(Keys.nextId.toString(), id + 1);
    return id;
  }

  @override
  void addOperation(LogicOperation operation) {
    final operationModel = LogicOperationModel(
      id: _generateNextId(),
      type: operation.type,
      created: operation.created,
      comment: operation.comment,
      categoriesStamp: operation.categoriesStamp,
      subjectsStamp: operation.subjectsStamp,
      atomicsModel: operation.atomics
          .map(
            (atomic) => AtomicOperationModel(
              id: _generateNextId(),
              moneyModel: MoneyModel(coins: atomic.money.coins),
              type: atomic.type,
              accountModel: AccountModel(
                id: atomic.account.id,
                name: atomic.account.name,
                type: atomic.account.type,
                currency: atomic.account.currency,
              ),
            ),
          )
          .toList(),
    );

    final List<String> list = _prefs.getStringList(Keys.operations.toString()) ?? [];
    list.add(json.encode(operationModel.toJson()));
    _prefs.setStringList(Keys.operations.toString(), list);
  }

  @override
  void updateAcount(Account account) {
    final List<String>? list = _prefs.getStringList(Keys.accounts.toString());
    final List<String> result = [];
    list?.forEach((encoded) {
      final decoded = AccountModel.fromJson(json.decode(encoded));
      if (decoded.id == account.id) {
        final updatedAccount = AccountModel.fromAccount(account);
        result.add(json.encode(updatedAccount.toJson()));
        _updateOperations(updatedAccount);
      } else {
        result.add(encoded);
      }
    });

    _prefs.setStringList(Keys.accounts.toString(), result);
  }

  void _updateOperations(AccountModel account) {
    final allOperations = getOperations();
    List<String> list = [];

    for (var logicOperation in allOperations) {
      final List<AtomicOperationModel> atomicsModel = [];
      for (var atomicOperationModel in logicOperation.atomicsModel) {
        if (atomicOperationModel.account.id == account.id) {
          atomicsModel.add(
            AtomicOperationModel(
              id: atomicOperationModel.id,
              moneyModel: atomicOperationModel.moneyModel,
              type: atomicOperationModel.type,
              accountModel: account,
            ),
          );
        } else {
          atomicsModel.add(atomicOperationModel);
        }
      }
      final LogicOperationModel current = LogicOperationModel(
        id: logicOperation.id,
        type: logicOperation.type,
        created: logicOperation.created,
        comment: logicOperation.comment,
        categoriesStamp: logicOperation.categoriesStamp,
        atomicsModel: atomicsModel,
      );
      list.add(json.encode(current.toJson()));
    }

    _prefs.setStringList(Keys.operations.toString(), list);
  }

  @override
  void deleteAcount(Account account) {
    final List<String> list = _prefs.getStringList(Keys.accounts.toString()) ?? [];
    list.removeWhere((it) => AccountModel.fromJson(jsonDecode(it)).id == account.id);
    _prefs.setStringList(Keys.accounts.toString(), list);

    _deleteOperationsWithAccount(account);
  }

  void _deleteOperationsWithAccount(Account account) {
    final List<String> list = _prefs.getStringList(Keys.operations.toString()) ?? [];
    list.removeWhere((it) => LogicOperationModel.fromJson(jsonDecode(it)).atomicsModel.first.account.id == account.id);
    _prefs.setStringList(Keys.operations.toString(), list);
  }
}
