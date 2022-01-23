// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_operation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddOperationStateTearOff {
  const _$AddOperationStateTearOff();

  Idle idle() {
    return const Idle();
  }

  VisibilityState visibility(
      {required bool debtSubject,
      required bool generalSubject,
      required bool locationFrom,
      required bool locationTo,
      required bool money,
      required bool comment,
      required List<AccountBalance> accountsBalance,
      String? errorMessage}) {
    return VisibilityState(
      debtSubject: debtSubject,
      generalSubject: generalSubject,
      locationFrom: locationFrom,
      locationTo: locationTo,
      money: money,
      comment: comment,
      accountsBalance: accountsBalance,
      errorMessage: errorMessage,
    );
  }

  Saved saved() {
    return const Saved();
  }
}

/// @nodoc
const $AddOperationState = _$AddOperationStateTearOff();

/// @nodoc
mixin _$AddOperationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)
        visibility,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)?
        visibility,
    TResult Function()? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)?
        visibility,
    TResult Function()? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(VisibilityState value) visibility,
    required TResult Function(Saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(VisibilityState value)? visibility,
    TResult Function(Saved value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(VisibilityState value)? visibility,
    TResult Function(Saved value)? saved,
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
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$AddOperationStateCopyWithImpl<$Res>
    implements $IdleCopyWith<$Res> {
  _$IdleCopyWithImpl(Idle _value, $Res Function(Idle) _then)
      : super(_value, (v) => _then(v as Idle));

  @override
  Idle get _value => super._value as Idle;
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'AddOperationState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)
        visibility,
    required TResult Function() saved,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)?
        visibility,
    TResult Function()? saved,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)?
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
    required TResult Function(Idle value) idle,
    required TResult Function(VisibilityState value) visibility,
    required TResult Function(Saved value) saved,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(VisibilityState value)? visibility,
    TResult Function(Saved value)? saved,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(VisibilityState value)? visibility,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements AddOperationState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $VisibilityStateCopyWith<$Res> {
  factory $VisibilityStateCopyWith(
          VisibilityState value, $Res Function(VisibilityState) then) =
      _$VisibilityStateCopyWithImpl<$Res>;
  $Res call(
      {bool debtSubject,
      bool generalSubject,
      bool locationFrom,
      bool locationTo,
      bool money,
      bool comment,
      List<AccountBalance> accountsBalance,
      String? errorMessage});
}

/// @nodoc
class _$VisibilityStateCopyWithImpl<$Res>
    extends _$AddOperationStateCopyWithImpl<$Res>
    implements $VisibilityStateCopyWith<$Res> {
  _$VisibilityStateCopyWithImpl(
      VisibilityState _value, $Res Function(VisibilityState) _then)
      : super(_value, (v) => _then(v as VisibilityState));

  @override
  VisibilityState get _value => super._value as VisibilityState;

  @override
  $Res call({
    Object? debtSubject = freezed,
    Object? generalSubject = freezed,
    Object? locationFrom = freezed,
    Object? locationTo = freezed,
    Object? money = freezed,
    Object? comment = freezed,
    Object? accountsBalance = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(VisibilityState(
      debtSubject: debtSubject == freezed
          ? _value.debtSubject
          : debtSubject // ignore: cast_nullable_to_non_nullable
              as bool,
      generalSubject: generalSubject == freezed
          ? _value.generalSubject
          : generalSubject // ignore: cast_nullable_to_non_nullable
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
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$VisibilityState implements VisibilityState {
  const _$VisibilityState(
      {required this.debtSubject,
      required this.generalSubject,
      required this.locationFrom,
      required this.locationTo,
      required this.money,
      required this.comment,
      required this.accountsBalance,
      this.errorMessage});

  @override
  final bool debtSubject;
  @override
  final bool generalSubject;
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
  final String? errorMessage;

  @override
  String toString() {
    return 'AddOperationState.visibility(debtSubject: $debtSubject, generalSubject: $generalSubject, locationFrom: $locationFrom, locationTo: $locationTo, money: $money, comment: $comment, accountsBalance: $accountsBalance, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VisibilityState &&
            (identical(other.debtSubject, debtSubject) ||
                const DeepCollectionEquality()
                    .equals(other.debtSubject, debtSubject)) &&
            (identical(other.generalSubject, generalSubject) ||
                const DeepCollectionEquality()
                    .equals(other.generalSubject, generalSubject)) &&
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
                    .equals(other.accountsBalance, accountsBalance)) &&
            (identical(other.errorMessage, errorMessage) ||
                const DeepCollectionEquality()
                    .equals(other.errorMessage, errorMessage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(debtSubject) ^
      const DeepCollectionEquality().hash(generalSubject) ^
      const DeepCollectionEquality().hash(locationFrom) ^
      const DeepCollectionEquality().hash(locationTo) ^
      const DeepCollectionEquality().hash(money) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(accountsBalance) ^
      const DeepCollectionEquality().hash(errorMessage);

  @JsonKey(ignore: true)
  @override
  $VisibilityStateCopyWith<VisibilityState> get copyWith =>
      _$VisibilityStateCopyWithImpl<VisibilityState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)
        visibility,
    required TResult Function() saved,
  }) {
    return visibility(debtSubject, generalSubject, locationFrom, locationTo,
        money, comment, accountsBalance, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)?
        visibility,
    TResult Function()? saved,
  }) {
    return visibility?.call(debtSubject, generalSubject, locationFrom,
        locationTo, money, comment, accountsBalance, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)?
        visibility,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (visibility != null) {
      return visibility(debtSubject, generalSubject, locationFrom, locationTo,
          money, comment, accountsBalance, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(VisibilityState value) visibility,
    required TResult Function(Saved value) saved,
  }) {
    return visibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(VisibilityState value)? visibility,
    TResult Function(Saved value)? saved,
  }) {
    return visibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(VisibilityState value)? visibility,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (visibility != null) {
      return visibility(this);
    }
    return orElse();
  }
}

abstract class VisibilityState implements AddOperationState {
  const factory VisibilityState(
      {required bool debtSubject,
      required bool generalSubject,
      required bool locationFrom,
      required bool locationTo,
      required bool money,
      required bool comment,
      required List<AccountBalance> accountsBalance,
      String? errorMessage}) = _$VisibilityState;

  bool get debtSubject => throw _privateConstructorUsedError;
  bool get generalSubject => throw _privateConstructorUsedError;
  bool get locationFrom => throw _privateConstructorUsedError;
  bool get locationTo => throw _privateConstructorUsedError;
  bool get money => throw _privateConstructorUsedError;
  bool get comment => throw _privateConstructorUsedError;
  List<AccountBalance> get accountsBalance =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisibilityStateCopyWith<VisibilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedCopyWith<$Res> {
  factory $SavedCopyWith(Saved value, $Res Function(Saved) then) =
      _$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SavedCopyWithImpl<$Res> extends _$AddOperationStateCopyWithImpl<$Res>
    implements $SavedCopyWith<$Res> {
  _$SavedCopyWithImpl(Saved _value, $Res Function(Saved) _then)
      : super(_value, (v) => _then(v as Saved));

  @override
  Saved get _value => super._value as Saved;
}

/// @nodoc

class _$Saved implements Saved {
  const _$Saved();

  @override
  String toString() {
    return 'AddOperationState.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)
        visibility,
    required TResult Function() saved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)?
        visibility,
    TResult Function()? saved,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(
            bool debtSubject,
            bool generalSubject,
            bool locationFrom,
            bool locationTo,
            bool money,
            bool comment,
            List<AccountBalance> accountsBalance,
            String? errorMessage)?
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
    required TResult Function(Idle value) idle,
    required TResult Function(VisibilityState value) visibility,
    required TResult Function(Saved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(VisibilityState value)? visibility,
    TResult Function(Saved value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(VisibilityState value)? visibility,
    TResult Function(Saved value)? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class Saved implements AddOperationState {
  const factory Saved() = _$Saved;
}
