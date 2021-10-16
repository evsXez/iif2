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
}
