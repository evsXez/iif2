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

  _LoadInProgress loadInProgress(int? expandedIndex) {
    return _LoadInProgress(
      expandedIndex,
    );
  }

  _LoadSuccess loadSuccess(Map<FundType, Money> data, int? expandedIndex) {
    return _LoadSuccess(
      data,
      expandedIndex,
    );
  }
}

/// @nodoc
const $FundsState = _$FundsStateTearOff();

/// @nodoc
mixin _$FundsState {
  int? get expandedIndex => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? expandedIndex) loadInProgress,
    required TResult Function(Map<FundType, Money> data, int? expandedIndex)
        loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? expandedIndex)? loadInProgress,
    TResult Function(Map<FundType, Money> data, int? expandedIndex)?
        loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? expandedIndex)? loadInProgress,
    TResult Function(Map<FundType, Money> data, int? expandedIndex)?
        loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
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
  $Res call({int? expandedIndex});
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
  }) {
    return _then(_value.copyWith(
      expandedIndex: expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$LoadInProgressCopyWith<$Res>
    implements $FundsStateCopyWith<$Res> {
  factory _$LoadInProgressCopyWith(
          _LoadInProgress value, $Res Function(_LoadInProgress) then) =
      __$LoadInProgressCopyWithImpl<$Res>;
  @override
  $Res call({int? expandedIndex});
}

/// @nodoc
class __$LoadInProgressCopyWithImpl<$Res> extends _$FundsStateCopyWithImpl<$Res>
    implements _$LoadInProgressCopyWith<$Res> {
  __$LoadInProgressCopyWithImpl(
      _LoadInProgress _value, $Res Function(_LoadInProgress) _then)
      : super(_value, (v) => _then(v as _LoadInProgress));

  @override
  _LoadInProgress get _value => super._value as _LoadInProgress;

  @override
  $Res call({
    Object? expandedIndex = freezed,
  }) {
    return _then(_LoadInProgress(
      expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress(this.expandedIndex);

  @override
  final int? expandedIndex;

  @override
  String toString() {
    return 'FundsState.loadInProgress(expandedIndex: $expandedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadInProgress &&
            (identical(other.expandedIndex, expandedIndex) ||
                const DeepCollectionEquality()
                    .equals(other.expandedIndex, expandedIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(expandedIndex);

  @JsonKey(ignore: true)
  @override
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      __$LoadInProgressCopyWithImpl<_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? expandedIndex) loadInProgress,
    required TResult Function(Map<FundType, Money> data, int? expandedIndex)
        loadSuccess,
  }) {
    return loadInProgress(expandedIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? expandedIndex)? loadInProgress,
    TResult Function(Map<FundType, Money> data, int? expandedIndex)?
        loadSuccess,
  }) {
    return loadInProgress?.call(expandedIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? expandedIndex)? loadInProgress,
    TResult Function(Map<FundType, Money> data, int? expandedIndex)?
        loadSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(expandedIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements FundsState {
  const factory _LoadInProgress(int? expandedIndex) = _$_LoadInProgress;

  @override
  int? get expandedIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadInProgressCopyWith<_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadSuccessCopyWith<$Res>
    implements $FundsStateCopyWith<$Res> {
  factory _$LoadSuccessCopyWith(
          _LoadSuccess value, $Res Function(_LoadSuccess) then) =
      __$LoadSuccessCopyWithImpl<$Res>;
  @override
  $Res call({Map<FundType, Money> data, int? expandedIndex});
}

/// @nodoc
class __$LoadSuccessCopyWithImpl<$Res> extends _$FundsStateCopyWithImpl<$Res>
    implements _$LoadSuccessCopyWith<$Res> {
  __$LoadSuccessCopyWithImpl(
      _LoadSuccess _value, $Res Function(_LoadSuccess) _then)
      : super(_value, (v) => _then(v as _LoadSuccess));

  @override
  _LoadSuccess get _value => super._value as _LoadSuccess;

  @override
  $Res call({
    Object? data = freezed,
    Object? expandedIndex = freezed,
  }) {
    return _then(_LoadSuccess(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<FundType, Money>,
      expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.data, this.expandedIndex);

  @override
  final Map<FundType, Money> data;
  @override
  final int? expandedIndex;

  @override
  String toString() {
    return 'FundsState.loadSuccess(data: $data, expandedIndex: $expandedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadSuccess &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.expandedIndex, expandedIndex) ||
                const DeepCollectionEquality()
                    .equals(other.expandedIndex, expandedIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(expandedIndex);

  @JsonKey(ignore: true)
  @override
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      __$LoadSuccessCopyWithImpl<_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? expandedIndex) loadInProgress,
    required TResult Function(Map<FundType, Money> data, int? expandedIndex)
        loadSuccess,
  }) {
    return loadSuccess(data, expandedIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int? expandedIndex)? loadInProgress,
    TResult Function(Map<FundType, Money> data, int? expandedIndex)?
        loadSuccess,
  }) {
    return loadSuccess?.call(data, expandedIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? expandedIndex)? loadInProgress,
    TResult Function(Map<FundType, Money> data, int? expandedIndex)?
        loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(data, expandedIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements FundsState {
  const factory _LoadSuccess(Map<FundType, Money> data, int? expandedIndex) =
      _$_LoadSuccess;

  Map<FundType, Money> get data => throw _privateConstructorUsedError;
  @override
  int? get expandedIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LoadSuccessCopyWith<_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
