// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_operation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddOperationStateTearOff {
  const _$AddOperationStateTearOff();

  _Idle idle() {
    return const _Idle();
  }

  _Visibility visibility(
      {required bool objects,
      required bool locationFrom,
      required bool locationTo,
      required bool money,
      required bool comment,
      required List<AccountBalance> accountsBalance}) {
    return _Visibility(
      objects: objects,
      locationFrom: locationFrom,
      locationTo: locationTo,
      money: money,
      comment: comment,
      accountsBalance: accountsBalance,
    );
  }

  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
const $AddOperationState = _$AddOperationStateTearOff();

/// @nodoc
mixin _$AddOperationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)
        visibility,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)?
        visibility,
    TResult Function()? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)?
        visibility,
    TResult Function()? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Visibility value) visibility,
    required TResult Function(_Saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Visibility value)? visibility,
    TResult Function(_Saved value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Visibility value)? visibility,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOperationStateCopyWith<$Res> {
  factory $AddOperationStateCopyWith(
          AddOperationState value, $Res Function(AddOperationState) then) =
      _$AddOperationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddOperationStateCopyWithImpl<$Res>
    implements $AddOperationStateCopyWith<$Res> {
  _$AddOperationStateCopyWithImpl(this._value, this._then);

  final AddOperationState _value;
  // ignore: unused_field
  final $Res Function(AddOperationState) _then;
}

/// @nodoc
abstract class _$IdleCopyWith<$Res> {
  factory _$IdleCopyWith(_Idle value, $Res Function(_Idle) then) =
      __$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$IdleCopyWithImpl<$Res> extends _$AddOperationStateCopyWithImpl<$Res>
    implements _$IdleCopyWith<$Res> {
  __$IdleCopyWithImpl(_Idle _value, $Res Function(_Idle) _then)
      : super(_value, (v) => _then(v as _Idle));

  @override
  _Idle get _value => super._value as _Idle;
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle();

  @override
  String toString() {
    return 'AddOperationState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)
        visibility,
    required TResult Function() saved,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)?
        visibility,
    TResult Function()? saved,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)?
        visibility,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Visibility value) visibility,
    required TResult Function(_Saved value) saved,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Visibility value)? visibility,
    TResult Function(_Saved value)? saved,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Visibility value)? visibility,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements AddOperationState {
  const factory _Idle() = _$_Idle;
}

/// @nodoc
abstract class _$VisibilityCopyWith<$Res> {
  factory _$VisibilityCopyWith(
          _Visibility value, $Res Function(_Visibility) then) =
      __$VisibilityCopyWithImpl<$Res>;
  $Res call(
      {bool objects,
      bool locationFrom,
      bool locationTo,
      bool money,
      bool comment,
      List<AccountBalance> accountsBalance});
}

/// @nodoc
class __$VisibilityCopyWithImpl<$Res>
    extends _$AddOperationStateCopyWithImpl<$Res>
    implements _$VisibilityCopyWith<$Res> {
  __$VisibilityCopyWithImpl(
      _Visibility _value, $Res Function(_Visibility) _then)
      : super(_value, (v) => _then(v as _Visibility));

  @override
  _Visibility get _value => super._value as _Visibility;

  @override
  $Res call({
    Object? objects = freezed,
    Object? locationFrom = freezed,
    Object? locationTo = freezed,
    Object? money = freezed,
    Object? comment = freezed,
    Object? accountsBalance = freezed,
  }) {
    return _then(_Visibility(
      objects: objects == freezed
          ? _value.objects
          : objects // ignore: cast_nullable_to_non_nullable
              as bool,
      locationFrom: locationFrom == freezed
          ? _value.locationFrom
          : locationFrom // ignore: cast_nullable_to_non_nullable
              as bool,
      locationTo: locationTo == freezed
          ? _value.locationTo
          : locationTo // ignore: cast_nullable_to_non_nullable
              as bool,
      money: money == freezed
          ? _value.money
          : money // ignore: cast_nullable_to_non_nullable
              as bool,
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as bool,
      accountsBalance: accountsBalance == freezed
          ? _value.accountsBalance
          : accountsBalance // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
    ));
  }
}

/// @nodoc

class _$_Visibility implements _Visibility {
  const _$_Visibility(
      {required this.objects,
      required this.locationFrom,
      required this.locationTo,
      required this.money,
      required this.comment,
      required this.accountsBalance});

  @override
  final bool objects;
  @override
  final bool locationFrom;
  @override
  final bool locationTo;
  @override
  final bool money;
  @override
  final bool comment;
  @override
  final List<AccountBalance> accountsBalance;

  @override
  String toString() {
    return 'AddOperationState.visibility(objects: $objects, locationFrom: $locationFrom, locationTo: $locationTo, money: $money, comment: $comment, accountsBalance: $accountsBalance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Visibility &&
            (identical(other.objects, objects) ||
                const DeepCollectionEquality()
                    .equals(other.objects, objects)) &&
            (identical(other.locationFrom, locationFrom) ||
                const DeepCollectionEquality()
                    .equals(other.locationFrom, locationFrom)) &&
            (identical(other.locationTo, locationTo) ||
                const DeepCollectionEquality()
                    .equals(other.locationTo, locationTo)) &&
            (identical(other.money, money) ||
                const DeepCollectionEquality().equals(other.money, money)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.accountsBalance, accountsBalance) ||
                const DeepCollectionEquality()
                    .equals(other.accountsBalance, accountsBalance)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(objects) ^
      const DeepCollectionEquality().hash(locationFrom) ^
      const DeepCollectionEquality().hash(locationTo) ^
      const DeepCollectionEquality().hash(money) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(accountsBalance);

  @JsonKey(ignore: true)
  @override
  _$VisibilityCopyWith<_Visibility> get copyWith =>
      __$VisibilityCopyWithImpl<_Visibility>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)
        visibility,
    required TResult Function() saved,
  }) {
    return visibility(
        objects, locationFrom, locationTo, money, comment, accountsBalance);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)?
        visibility,
    TResult Function()? saved,
  }) {
    return visibility?.call(
        objects, locationFrom, locationTo, money, comment, accountsBalance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)?
        visibility,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (visibility != null) {
      return visibility(
          objects, locationFrom, locationTo, money, comment, accountsBalance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Visibility value) visibility,
    required TResult Function(_Saved value) saved,
  }) {
    return visibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Visibility value)? visibility,
    TResult Function(_Saved value)? saved,
  }) {
    return visibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Visibility value)? visibility,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (visibility != null) {
      return visibility(this);
    }
    return orElse();
  }
}

abstract class _Visibility implements AddOperationState {
  const factory _Visibility(
      {required bool objects,
      required bool locationFrom,
      required bool locationTo,
      required bool money,
      required bool comment,
      required List<AccountBalance> accountsBalance}) = _$_Visibility;

  bool get objects => throw _privateConstructorUsedError;
  bool get locationFrom => throw _privateConstructorUsedError;
  bool get locationTo => throw _privateConstructorUsedError;
  bool get money => throw _privateConstructorUsedError;
  bool get comment => throw _privateConstructorUsedError;
  List<AccountBalance> get accountsBalance =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$VisibilityCopyWith<_Visibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$AddOperationStateCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
}

/// @nodoc

class _$_Saved implements _Saved {
  const _$_Saved();

  @override
  String toString() {
    return 'AddOperationState.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)
        visibility,
    required TResult Function() saved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)?
        visibility,
    TResult Function()? saved,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment, List<AccountBalance> accountsBalance)?
        visibility,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Visibility value) visibility,
    required TResult Function(_Saved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Visibility value)? visibility,
    TResult Function(_Saved value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Visibility value)? visibility,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements AddOperationState {
  const factory _Saved() = _$_Saved;
}
