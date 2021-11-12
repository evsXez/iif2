// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'node_selector_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NodeSelectorStateTearOff {
  const _$NodeSelectorStateTearOff();

  _Loading<T> loading<T>() {
    return _Loading<T>();
  }

  _Loaded<T> loaded<T>(List<NodeRef<T>> refs) {
    return _Loaded<T>(
      refs,
    );
  }
}

/// @nodoc
const $NodeSelectorState = _$NodeSelectorStateTearOff();

/// @nodoc
mixin _$NodeSelectorState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NodeRef<T>> refs) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NodeRef<T>> refs)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NodeRef<T>> refs)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Loaded<T> value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeSelectorStateCopyWith<T, $Res> {
  factory $NodeSelectorStateCopyWith(NodeSelectorState<T> value,
          $Res Function(NodeSelectorState<T>) then) =
      _$NodeSelectorStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$NodeSelectorStateCopyWithImpl<T, $Res>
    implements $NodeSelectorStateCopyWith<T, $Res> {
  _$NodeSelectorStateCopyWithImpl(this._value, this._then);

  final NodeSelectorState<T> _value;
  // ignore: unused_field
  final $Res Function(NodeSelectorState<T>) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<T, $Res> {
  factory _$LoadingCopyWith(
          _Loading<T> value, $Res Function(_Loading<T>) then) =
      __$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<T, $Res>
    extends _$NodeSelectorStateCopyWithImpl<T, $Res>
    implements _$LoadingCopyWith<T, $Res> {
  __$LoadingCopyWithImpl(_Loading<T> _value, $Res Function(_Loading<T>) _then)
      : super(_value, (v) => _then(v as _Loading<T>));

  @override
  _Loading<T> get _value => super._value as _Loading<T>;
}

/// @nodoc

class _$_Loading<T> implements _Loading<T> {
  const _$_Loading();

  @override
  String toString() {
    return 'NodeSelectorState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NodeRef<T>> refs) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NodeRef<T>> refs)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NodeRef<T>> refs)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Loaded<T> value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> implements NodeSelectorState<T> {
  const factory _Loading() = _$_Loading<T>;
}

/// @nodoc
abstract class _$LoadedCopyWith<T, $Res> {
  factory _$LoadedCopyWith(_Loaded<T> value, $Res Function(_Loaded<T>) then) =
      __$LoadedCopyWithImpl<T, $Res>;
  $Res call({List<NodeRef<T>> refs});
}

/// @nodoc
class __$LoadedCopyWithImpl<T, $Res>
    extends _$NodeSelectorStateCopyWithImpl<T, $Res>
    implements _$LoadedCopyWith<T, $Res> {
  __$LoadedCopyWithImpl(_Loaded<T> _value, $Res Function(_Loaded<T>) _then)
      : super(_value, (v) => _then(v as _Loaded<T>));

  @override
  _Loaded<T> get _value => super._value as _Loaded<T>;

  @override
  $Res call({
    Object? refs = freezed,
  }) {
    return _then(_Loaded<T>(
      refs == freezed
          ? _value.refs
          : refs // ignore: cast_nullable_to_non_nullable
              as List<NodeRef<T>>,
    ));
  }
}

/// @nodoc

class _$_Loaded<T> implements _Loaded<T> {
  const _$_Loaded(this.refs);

  @override
  final List<NodeRef<T>> refs;

  @override
  String toString() {
    return 'NodeSelectorState<$T>.loaded(refs: $refs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Loaded<T> &&
            (identical(other.refs, refs) ||
                const DeepCollectionEquality().equals(other.refs, refs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(refs);

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<T, _Loaded<T>> get copyWith =>
      __$LoadedCopyWithImpl<T, _Loaded<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<NodeRef<T>> refs) loaded,
  }) {
    return loaded(refs);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NodeRef<T>> refs)? loaded,
  }) {
    return loaded?.call(refs);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<NodeRef<T>> refs)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(refs);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Loaded<T> value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Loaded<T> value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded<T> implements NodeSelectorState<T> {
  const factory _Loaded(List<NodeRef<T>> refs) = _$_Loaded<T>;

  List<NodeRef<T>> get refs => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadedCopyWith<T, _Loaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
