// Mocks generated by Mockito 5.0.15 from annotations
// in iif/test/domain/use_cases/get_all_money_for_account_types_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:iif/domain/include.dart' as _i4;
import 'package:iif/domain/repositories/accounts_repository.dart' as _i2;
import 'package:iif/domain/repositories/operations_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeAccountsRepository_0 extends _i1.Fake
    implements _i2.AccountsRepository {}

class _FakeOperationsRepository_1 extends _i1.Fake
    implements _i3.OperationsRepository {}

/// A class which mocks [GetAccountsBalanceUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAccountsBalanceUseCase extends _i1.Mock
    implements _i4.GetAccountsBalanceUseCase {
  MockGetAccountsBalanceUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AccountsRepository get accountsRepository =>
      (super.noSuchMethod(Invocation.getter(#accountsRepository),
          returnValue: _FakeAccountsRepository_0()) as _i2.AccountsRepository);
  @override
  _i3.OperationsRepository get operationsRepository => (super.noSuchMethod(
      Invocation.getter(#operationsRepository),
      returnValue: _FakeOperationsRepository_1()) as _i3.OperationsRepository);
  @override
  _i5.Future<List<_i4.AccountBalance>> execute(_i4.AccountType? type) =>
      (super.noSuchMethod(Invocation.method(#execute, [type]),
          returnValue: Future<List<_i4.AccountBalance>>.value(
              <_i4.AccountBalance>[])) as _i5.Future<List<_i4.AccountBalance>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetAccountTypesOnMainPageUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAccountTypesOnMainPageUseCase extends _i1.Mock
    implements _i4.GetAccountTypesOnMainPageUseCase {
  MockGetAccountTypesOnMainPageUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i4.AccountType> execute() =>
      (super.noSuchMethod(Invocation.method(#execute, []),
          returnValue: <_i4.AccountType>[]) as List<_i4.AccountType>);
  @override
  String toString() => super.toString();
}
