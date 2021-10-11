// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'funds_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FundsStateTearOff {
  const _$FundsStateTearOff();

  _Loaded loaded(int? expandedIndex, List<MapEntry<FundType, Money?>> data) {
    return _Loaded(
      expandedIndex,
      data,
    );
  }
}

/// @nodoc
const $FundsState = _$FundsStateTearOff();

/// @nodoc
mixin _$FundsState {
  int? get expandedIndex => throw _privateConstructorUsedError;
  List<MapEntry<FundType, Money?>> get data =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? expandedIndex, List<MapEntry<FundType, Money?>> data)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? expandedIndex, List<MapEntry<FundType, Money?>> data)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? expandedIndex, List<MapEntry<FundType, Money?>> data)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FundsStateCopyWith<FundsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundsStateCopyWith<$Res> {
  factory $FundsStateCopyWith(
          FundsState value, $Res Function(FundsState) then) =
      _$FundsStateCopyWithImpl<$Res>;
  $Res call({int? expandedIndex, List<MapEntry<FundType, Money?>> data});
}

/// @nodoc
class _$FundsStateCopyWithImpl<$Res> implements $FundsStateCopyWith<$Res> {
  _$FundsStateCopyWithImpl(this._value, this._then);

  final FundsState _value;
  // ignore: unused_field
  final $Res Function(FundsState) _then;

  @override
  $Res call({
    Object? expandedIndex = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      expandedIndex: expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MapEntry<FundType, Money?>>,
    ));
  }
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> implements $FundsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({int? expandedIndex, List<MapEntry<FundType, Money?>> data});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$FundsStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? expandedIndex = freezed,
    Object? data = freezed,
  }) {
    return _then(_Loaded(
      expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MapEntry<FundType, Money?>>,
    ));
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.expandedIndex, this.data);

  @override
  final int? expandedIndex;
  @override
  final List<MapEntry<FundType, Money?>> data;

  @override
  String toString() {
    return 'FundsState.loaded(expandedIndex: $expandedIndex, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded &&
            (identical(other.expandedIndex, expandedIndex) ||
                const DeepCollectionEquality()
                    .equals(other.expandedIndex, expandedIndex)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(expandedIndex) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? expandedIndex, List<MapEntry<FundType, Money?>> data)
        loaded,
  }) {
    return loaded(expandedIndex, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? expandedIndex, List<MapEntry<FundType, Money?>> data)?
        loaded,
  }) {
    return loaded?.call(expandedIndex, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? expandedIndex, List<MapEntry<FundType, Money?>> data)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(expandedIndex, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements FundsState {
  const factory _Loaded(
      int? expandedIndex, List<MapEntry<FundType, Money?>> data) = _$_Loaded;

  @override
  int? get expandedIndex => throw _privateConstructorUsedError;
  @override
  List<MapEntry<FundType, Money?>> get data =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}
