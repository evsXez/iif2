// Mocks generated by Mockito 5.0.15 from annotations
// in iif/test/domain/use_cases/get_account_options_use_case_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:iif/domain/include.dart' as _i2;
import 'package:iif/domain/repositories/operations_repository.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeMoney_0 extends _i1.Fake implements _i2.Money {}

/// A class which mocks [OperationsRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockOperationsRepository extends _i1.Mock
    implements _i3.OperationsRepository {
  MockOperationsRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Money> calculateBalance(_i2.Account? account) =>
      (super.noSuchMethod(Invocation.method(#calculateBalance, [account]),
              returnValue: Future<_i2.Money>.value(_FakeMoney_0()))
          as _i4.Future<_i2.Money>);
  @override
  void addOperationInitialInput(_i2.Account? account, _i2.Money? money) =>
      super.noSuchMethod(
          Invocation.method(#addOperationInitialInput, [account, money]),
          returnValueForMissingStub: null);
  @override
  _i4.Future<List<_i2.LogicOperation>> getOperations(_i2.Account? account) =>
      (super.noSuchMethod(Invocation.method(#getOperations, [account]),
          returnValue: Future<List<_i2.LogicOperation>>.value(
              <_i2.LogicOperation>[])) as _i4.Future<List<_i2.LogicOperation>>);
  @override
  _i4.Future<List<_i2.LogicOperation>> getAllOperations() =>
      (super.noSuchMethod(Invocation.method(#getAllOperations, []),
          returnValue: Future<List<_i2.LogicOperation>>.value(
              <_i2.LogicOperation>[])) as _i4.Future<List<_i2.LogicOperation>>);
  @override
  String toString() => super.toString();
}
