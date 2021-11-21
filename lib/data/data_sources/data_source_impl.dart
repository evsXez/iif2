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
  Account addAcount(Account accountTemplate, Subject? subject, Money? creditLimit) {
    final AccountModel account = AccountModel(
      id: _generateNextId(),
      name: accountTemplate.name,
      type: accountTemplate.type,
      currency: accountTemplate.currency,
      isArchived: accountTemplate.isArchived,
      subjectId: subject?.id,
      creditLimitModel: MoneyModel(coins: creditLimit?.coins ?? 0),
    );

    final List<String> list = _prefs.getStringList(Keys.accounts.toString()) ?? [];
    list.add(json.encode(account.toJson()));
    _prefs.setStringList(Keys.accounts.toString(), list);
    return account;
  }

  @override
  List<AccountModel> getAccounts() {
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
                creditLimitModel: MoneyModel(coins: 0),
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
  void updateAcount(Account account, Subject? subject, Money? creditLimit) {
    final List<String>? list = _prefs.getStringList(Keys.accounts.toString());
    final List<String> result = [];
    list?.forEach((encoded) {
      final decoded = AccountModel.fromJson(json.decode(encoded));
      if (decoded.id == account.id) {
        final updatedAccount = AccountModel.fromAccount(account, subjectId: subject?.id, creditLimit: creditLimit);
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

  @override
  CategoryModel addCategory(Category categoryTemplate, Category parent) {
    final CategoryModel category = CategoryModel(
      id: _generateNextId(),
      parentId: parent.id,
      name: categoryTemplate.name,
      type: categoryTemplate.type,
    );

    final List<String> list = _prefs.getStringList(Keys.categories.toString()) ?? [];
    list.add(json.encode(category.toJson()));
    _prefs.setStringList(Keys.categories.toString(), list);
    return category;
  }

  @override
  List<CategoryModel> getCategories() {
    // if (true) {
    //   _prefs.remove(Keys.categories.toString());
    // }

    List<String>? list = _prefs.getStringList(Keys.categories.toString());
    if (list == null) {
      _prefs.setStringList(Keys.categories.toString(), _categoriesPredefined());
      list = _prefs.getStringList(Keys.categories.toString());
    }
    final List<CategoryModel> result = [];
    list?.forEach((it) {
      result.add(CategoryModel.fromJson(json.decode(it)));
    });

    return result;
  }

  @override
  void updateCategory(Category category) {
    final List<String>? list = _prefs.getStringList(Keys.categories.toString());
    final List<String> result = [];
    list?.forEach((encoded) {
      final decoded = CategoryModel.fromJson(json.decode(encoded));
      if (decoded.id == category.id) {
        final updatedCategory = CategoryModel(
          id: category.id,
          name: category.name,
          type: category.type,
          parentId: decoded.parentId,
        );
        result.add(json.encode(updatedCategory.toJson()));
      } else {
        result.add(encoded);
      }
    });

    _prefs.setStringList(Keys.categories.toString(), result);
  }

  List<String> _categoriesPredefined() {
    final rootId = _generateNextId();
    final debtsId = _generateNextId();
    return [
      '{"id": $rootId, "parentId": $rootId, "type": 0, "name": "root"}',
      '{"id": ${_generateNextId()}, "parentId": $rootId, "type": 1, "name": "Доход"}',
      '{"id": ${_generateNextId()}, "parentId": $rootId, "type": 2, "name": "Расход"}',
      '{"id": ${_generateNextId()}, "parentId": $rootId, "type": 3, "name": "Перемещение"}',
      '{"id": $debtsId, "parentId": $rootId, "type": 4, "name": "Долги"}',
      '{"id": ${_generateNextId()}, "parentId": $debtsId, "type": 5, "name": "Я взял в долг"}',
      '{"id": ${_generateNextId()}, "parentId": $debtsId, "type": 6, "name": "Я вернул долг"}',
      '{"id": ${_generateNextId()}, "parentId": $debtsId, "type": 7, "name": "Я дал в долг"}',
      '{"id": ${_generateNextId()}, "parentId": $debtsId, "type": 8, "name": "Мне вернули долг"}',
    ];
  }

  //TODO: untested
  @override
  SubjectModel addSubject(Subject template, Subject parent) {
    final SubjectModel subject = SubjectModel(
      id: _generateNextId(),
      parentId: parent.id,
      name: template.name,
      type: template.type,
    );

    final List<String> list = _prefs.getStringList(Keys.subjects.toString()) ?? [];
    list.add(json.encode(subject.toJson()));
    _prefs.setStringList(Keys.subjects.toString(), list);
    return subject;
  }

  //TODO: untested
  @override
  List<SubjectModel> getSubjects() {
    List<String>? list = _prefs.getStringList(Keys.subjects.toString());
    if (list == null) {
      _prefs.setStringList(Keys.subjects.toString(), _subjectsPredefined());
      list = _prefs.getStringList(Keys.subjects.toString());
    }
    final List<SubjectModel> result = [];
    list?.forEach((it) {
      result.add(SubjectModel.fromJson(json.decode(it)));
    });

    return result;
  }

  List<String> _subjectsPredefined() {
    final rootGeneralId = _generateNextId();
    final rootDebtsId = _generateNextId();
    final rootInvestmentsId = _generateNextId();
    return [
      '{"id": $rootGeneralId, "parentId": $rootGeneralId, "type": 0, "name": "rootGeneral"}',
      '{"id": $rootDebtsId, "parentId": $rootDebtsId, "type": 1, "name": "rootDebts"}',
      '{"id": $rootInvestmentsId, "parentId": $rootInvestmentsId, "type": 2, "name": "rootInvestments"}',
    ];
  }

  //TODO: untested
  @override
  void updateSubject(Subject subject) {
    final List<String>? list = _prefs.getStringList(Keys.subjects.toString());
    final List<String> result = [];
    list?.forEach((encoded) {
      final decoded = SubjectModel.fromJson(json.decode(encoded));
      if (decoded.id == subject.id) {
        final updatedSubject = SubjectModel(
          id: subject.id,
          name: subject.name,
          type: subject.type,
          parentId: decoded.parentId,
        );
        result.add(json.encode(updatedSubject.toJson()));
        _updateAcountForSubject(subject);
      } else {
        result.add(encoded);
      }
    });

    _prefs.setStringList(Keys.subjects.toString(), result);
  }

  void _updateAcountForSubject(Subject subject) {
    try {
      final account = getAccounts().firstWhere((it) => it.subjectId == subject.id);
      updateAcount(
        Account(
          id: account.id,
          name: subject.name,
          type: account.type,
          currency: account.currency,
        ),
        subject,
        account is CreditCardAccount ? account.creditLimitModel : null,
      );
    } catch (_) {}
  }
}
