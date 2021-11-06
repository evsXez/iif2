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

  _Visibility visibility(
      {required bool objects,
      required bool locationFrom,
      required bool locationTo,
      required bool money,
      required bool comment}) {
    return _Visibility(
      objects: objects,
      locationFrom: locationFrom,
      locationTo: locationTo,
      money: money,
      comment: comment,
    );
  }
}

/// @nodoc
const $AddOperationState = _$AddOperationStateTearOff();

/// @nodoc
mixin _$AddOperationState {
  bool get objects => throw _privateConstructorUsedError;
  bool get locationFrom => throw _privateConstructorUsedError;
  bool get locationTo => throw _privateConstructorUsedError;
  bool get money => throw _privateConstructorUsedError;
  bool get comment => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment)
        visibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment)?
        visibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment)?
        visibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Visibility value) visibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Visibility value)? visibility,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Visibility value)? visibility,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddOperationStateCopyWith<AddOperationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOperationStateCopyWith<$Res> {
  factory $AddOperationStateCopyWith(
          AddOperationState value, $Res Function(AddOperationState) then) =
      _$AddOperationStateCopyWithImpl<$Res>;
  $Res call(
      {bool objects,
      bool locationFrom,
      bool locationTo,
      bool money,
      bool comment});
}

/// @nodoc
class _$AddOperationStateCopyWithImpl<$Res>
    implements $AddOperationStateCopyWith<$Res> {
  _$AddOperationStateCopyWithImpl(this._value, this._then);

  final AddOperationState _value;
  // ignore: unused_field
  final $Res Function(AddOperationState) _then;

  @override
  $Res call({
    Object? objects = freezed,
    Object? locationFrom = freezed,
    Object? locationTo = freezed,
    Object? money = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
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
    ));
  }
}

/// @nodoc
abstract class _$VisibilityCopyWith<$Res>
    implements $AddOperationStateCopyWith<$Res> {
  factory _$VisibilityCopyWith(
          _Visibility value, $Res Function(_Visibility) then) =
      __$VisibilityCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool objects,
      bool locationFrom,
      bool locationTo,
      bool money,
      bool comment});
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
      required this.comment});

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
  String toString() {
    return 'AddOperationState.visibility(objects: $objects, locationFrom: $locationFrom, locationTo: $locationTo, money: $money, comment: $comment)';
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
                const DeepCollectionEquality().equals(other.comment, comment)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(objects) ^
      const DeepCollectionEquality().hash(locationFrom) ^
      const DeepCollectionEquality().hash(locationTo) ^
      const DeepCollectionEquality().hash(money) ^
      const DeepCollectionEquality().hash(comment);

  @JsonKey(ignore: true)
  @override
  _$VisibilityCopyWith<_Visibility> get copyWith =>
      __$VisibilityCopyWithImpl<_Visibility>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment)
        visibility,
  }) {
    return visibility(objects, locationFrom, locationTo, money, comment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment)?
        visibility,
  }) {
    return visibility?.call(objects, locationFrom, locationTo, money, comment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool objects, bool locationFrom, bool locationTo,
            bool money, bool comment)?
        visibility,
    required TResult orElse(),
  }) {
    if (visibility != null) {
      return visibility(objects, locationFrom, locationTo, money, comment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Visibility value) visibility,
  }) {
    return visibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Visibility value)? visibility,
  }) {
    return visibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Visibility value)? visibility,
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
      required bool comment}) = _$_Visibility;

  @override
  bool get objects => throw _privateConstructorUsedError;
  @override
  bool get locationFrom => throw _privateConstructorUsedError;
  @override
  bool get locationTo => throw _privateConstructorUsedError;
  @override
  bool get money => throw _privateConstructorUsedError;
  @override
  bool get comment => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$VisibilityCopyWith<_Visibility> get copyWith =>
      throw _privateConstructorUsedError;
}
