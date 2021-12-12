// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'accounts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AccountsStateTearOff {
  const _$AccountsStateTearOff();

  Loaded loaded(int? expandedIndex, List<MapEntry<AccountType, Money?>> data) {
    return Loaded(
      expandedIndex,
      data,
    );
  }
}

/// @nodoc
const $AccountsState = _$AccountsStateTearOff();

/// @nodoc
mixin _$AccountsState {
  int? get expandedIndex => throw _privateConstructorUsedError;
  List<MapEntry<AccountType, Money?>> get data =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? expandedIndex, List<MapEntry<AccountType, Money?>> data)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            int? expandedIndex, List<MapEntry<AccountType, Money?>> data)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? expandedIndex, List<MapEntry<AccountType, Money?>> data)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountsStateCopyWith<AccountsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsStateCopyWith<$Res> {
  factory $AccountsStateCopyWith(
          AccountsState value, $Res Function(AccountsState) then) =
      _$AccountsStateCopyWithImpl<$Res>;
  $Res call({int? expandedIndex, List<MapEntry<AccountType, Money?>> data});
}

/// @nodoc
class _$AccountsStateCopyWithImpl<$Res>
    implements $AccountsStateCopyWith<$Res> {
  _$AccountsStateCopyWithImpl(this._value, this._then);

  final AccountsState _value;
  // ignore: unused_field
  final $Res Function(AccountsState) _then;

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
              as List<MapEntry<AccountType, Money?>>,
    ));
  }
}

/// @nodoc
abstract class $LoadedCopyWith<$Res> implements $AccountsStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) then) =
      _$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({int? expandedIndex, List<MapEntry<AccountType, Money?>> data});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> extends _$AccountsStateCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(Loaded _value, $Res Function(Loaded) _then)
      : super(_value, (v) => _then(v as Loaded));

  @override
  Loaded get _value => super._value as Loaded;

  @override
  $Res call({
    Object? expandedIndex = freezed,
    Object? data = freezed,
  }) {
    return _then(Loaded(
      expandedIndex == freezed
          ? _value.expandedIndex
          : expandedIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MapEntry<AccountType, Money?>>,
    ));
  }
}

/// @nodoc

class _$Loaded implements Loaded {
  const _$Loaded(this.expandedIndex, this.data);

  @override
  final int? expandedIndex;
  @override
  final List<MapEntry<AccountType, Money?>> data;

  @override
  String toString() {
    return 'AccountsState.loaded(expandedIndex: $expandedIndex, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded &&
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
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int? expandedIndex, List<MapEntry<AccountType, Money?>> data)
        loaded,
  }) {
    return loaded(expandedIndex, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            int? expandedIndex, List<MapEntry<AccountType, Money?>> data)?
        loaded,
  }) {
    return loaded?.call(expandedIndex, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            int? expandedIndex, List<MapEntry<AccountType, Money?>> data)?
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
    required TResult Function(Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded implements AccountsState {
  const factory Loaded(
      int? expandedIndex, List<MapEntry<AccountType, Money?>> data) = _$Loaded;

  @override
  int? get expandedIndex => throw _privateConstructorUsedError;
  @override
  List<MapEntry<AccountType, Money?>> get data =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $LoadedCopyWith<Loaded> get copyWith => throw _privateConstructorUsedError;
}
