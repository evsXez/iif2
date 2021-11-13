// Mocks generated by Mockito 5.0.15 from annotations
// in iif/test/data/repositories/accounts_repository_impl_test.dart.
// Do not manually edit this file.

import 'package:iif/data/include.dart' as _i3;
import 'package:iif/domain/include.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeAccount_0 extends _i1.Fake implements _i2.Account {}

/// A class which mocks [DataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockDataSource extends _i1.Mock implements _i3.DataSource {
  MockDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Account addAcount(_i2.Account? accountTemplate) =>
      (super.noSuchMethod(Invocation.method(#addAcount, [accountTemplate]),
          returnValue: _FakeAccount_0()) as _i2.Account);
  @override
  void updateAcount(_i2.Account? account) =>
      super.noSuchMethod(Invocation.method(#updateAcount, [account]),
          returnValueForMissingStub: null);
  @override
  void deleteAcount(_i2.Account? account) =>
      super.noSuchMethod(Invocation.method(#deleteAcount, [account]),
          returnValueForMissingStub: null);
  @override
  List<_i3.AccountModel> getAcounts() =>
      (super.noSuchMethod(Invocation.method(#getAcounts, []),
          returnValue: <_i3.AccountModel>[]) as List<_i3.AccountModel>);
  @override
  void addOperation(_i2.LogicOperation? operation) =>
      super.noSuchMethod(Invocation.method(#addOperation, [operation]),
          returnValueForMissingStub: null);
  @override
  List<_i3.LogicOperationModel> getOperations() =>
      (super.noSuchMethod(Invocation.method(#getOperations, []),
              returnValue: <_i3.LogicOperationModel>[])
          as List<_i3.LogicOperationModel>);
  @override
  void addCategory(_i2.Category? category, _i2.Category? parent) =>
      super.noSuchMethod(Invocation.method(#addCategory, [category, parent]),
          returnValueForMissingStub: null);
  @override
  List<_i2.Category> getCategories() =>
      (super.noSuchMethod(Invocation.method(#getCategories, []),
          returnValue: <_i2.Category>[]) as List<_i2.Category>);
  @override
  String toString() => super.toString();
}
