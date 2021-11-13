// Mocks generated by Mockito 5.0.15 from annotations
// in iif/test/domain/use_cases/add_expense_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:ui' as _i4;

import 'package:iif/domain/include.dart' as _i2;
import 'package:iif/domain/repositories/accounts_repository.dart' as _i3;
import 'package:iif/domain/repositories/operations_repository.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeAccount_0 extends _i1.Fake implements _i2.Account {}

class _FakeMoney_1 extends _i1.Fake implements _i2.Money {}

/// A class which mocks [AccountsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAccountsRepository extends _i1.Mock
    implements _i3.AccountsRepository {
  MockAccountsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  List<_i2.Account> getAccountsOfType(_i2.AccountType? type) =>
      (super.noSuchMethod(Invocation.method(#getAccountsOfType, [type]),
          returnValue: <_i2.Account>[]) as List<_i2.Account>);
  @override
  _i2.Account saveAccount(_i2.Account? accountTemplate) =>
      (super.noSuchMethod(Invocation.method(#saveAccount, [accountTemplate]),
          returnValue: _FakeAccount_0()) as _i2.Account);
  @override
  void addListener(_i4.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i4.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [OperationsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockOperationsRepository extends _i1.Mock
    implements _i5.OperationsRepository {
  MockOperationsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i6.Future<_i2.Money> calculateBalance(_i2.Account? account) =>
      (super.noSuchMethod(Invocation.method(#calculateBalance, [account]),
              returnValue: Future<_i2.Money>.value(_FakeMoney_1()))
          as _i6.Future<_i2.Money>);
  @override
  _i6.Future<List<_i2.LogicOperation>> getOperations(_i2.Account? account) =>
      (super.noSuchMethod(Invocation.method(#getOperations, [account]),
          returnValue: Future<List<_i2.LogicOperation>>.value(
              <_i2.LogicOperation>[])) as _i6.Future<List<_i2.LogicOperation>>);
  @override
  _i6.Future<List<_i2.LogicOperation>> getAllOperations() =>
      (super.noSuchMethod(Invocation.method(#getAllOperations, []),
          returnValue: Future<List<_i2.LogicOperation>>.value(
              <_i2.LogicOperation>[])) as _i6.Future<List<_i2.LogicOperation>>);
  @override
  void addOperationInitialInput(_i2.Account? account, _i2.Money? money) =>
      super.noSuchMethod(
          Invocation.method(#addOperationInitialInput, [account, money]),
          returnValueForMissingStub: null);
  @override
  void addOperationExpense(_i2.Account? account, _i2.Money? money,
          {String? comment, String? categoriesStamp}) =>
      super.noSuchMethod(
          Invocation.method(#addOperationExpense, [account, money],
              {#comment: comment, #categoriesStamp: categoriesStamp}),
          returnValueForMissingStub: null);
  @override
  void addOperationIncome(_i2.Account? account, _i2.Money? money,
          {String? comment, String? categoriesStamp}) =>
      super.noSuchMethod(
          Invocation.method(#addOperationIncome, [account, money],
              {#comment: comment, #categoriesStamp: categoriesStamp}),
          returnValueForMissingStub: null);
  @override
  void addOperationDebtIncrease(
          _i2.Account? account, _i2.Money? money, _i2.Subject? subject,
          {String? comment, String? categoriesStamp, String? subjectsStamp}) =>
      super.noSuchMethod(
          Invocation.method(#addOperationDebtIncrease, [
            account,
            money,
            subject
          ], {
            #comment: comment,
            #categoriesStamp: categoriesStamp,
            #subjectsStamp: subjectsStamp
          }),
          returnValueForMissingStub: null);
  @override
  void addOperationDebtDecrease(
          _i2.Account? account, _i2.Money? money, _i2.Subject? subject,
          {String? comment, String? categoriesStamp, String? subjectsStamp}) =>
      super.noSuchMethod(
          Invocation.method(#addOperationDebtDecrease, [
            account,
            money,
            subject
          ], {
            #comment: comment,
            #categoriesStamp: categoriesStamp,
            #subjectsStamp: subjectsStamp
          }),
          returnValueForMissingStub: null);
  @override
  void addOperationLoanIncrease(
          _i2.Account? account, _i2.Money? money, _i2.Subject? subject,
          {String? comment, String? categoriesStamp, String? subjectsStamp}) =>
      super.noSuchMethod(
          Invocation.method(#addOperationLoanIncrease, [
            account,
            money,
            subject
          ], {
            #comment: comment,
            #categoriesStamp: categoriesStamp,
            #subjectsStamp: subjectsStamp
          }),
          returnValueForMissingStub: null);
  @override
  void addOperationLoanDecrease(
          _i2.Account? account, _i2.Money? money, _i2.Subject? subject,
          {String? comment, String? categoriesStamp, String? subjectsStamp}) =>
      super.noSuchMethod(
          Invocation.method(#addOperationLoanDecrease, [
            account,
            money,
            subject
          ], {
            #comment: comment,
            #categoriesStamp: categoriesStamp,
            #subjectsStamp: subjectsStamp
          }),
          returnValueForMissingStub: null);
  @override
  void addListener(_i4.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i4.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}