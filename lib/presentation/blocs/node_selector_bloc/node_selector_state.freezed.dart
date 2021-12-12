// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'node_selector_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NodeSelectorStateTearOff {
  const _$NodeSelectorStateTearOff();

  Loading<T> loading<T>() {
    return Loading<T>();
  }

  Loaded<T> loaded<T>(List<NodeRef<T>> refs) {
    return Loaded<T>(
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
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
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
abstract class $LoadingCopyWith<T, $Res> {
  factory $LoadingCopyWith(Loading<T> value, $Res Function(Loading<T>) then) =
      _$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<T, $Res>
    extends _$NodeSelectorStateCopyWithImpl<T, $Res>
    implements $LoadingCopyWith<T, $Res> {
  _$LoadingCopyWithImpl(Loading<T> _value, $Res Function(Loading<T>) _then)
      : super(_value, (v) => _then(v as Loading<T>));

  @override
  Loading<T> get _value => super._value as Loading<T>;
}

/// @nodoc

class _$Loading<T> implements Loading<T> {
  const _$Loading();

  @override
  String toString() {
    return 'NodeSelectorState<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading<T>);
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
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements NodeSelectorState<T> {
  const factory Loading() = _$Loading<T>;
}

/// @nodoc
abstract class $LoadedCopyWith<T, $Res> {
  factory $LoadedCopyWith(Loaded<T> value, $Res Function(Loaded<T>) then) =
      _$LoadedCopyWithImpl<T, $Res>;
  $Res call({List<NodeRef<T>> refs});
}

/// @nodoc
class _$LoadedCopyWithImpl<T, $Res>
    extends _$NodeSelectorStateCopyWithImpl<T, $Res>
    implements $LoadedCopyWith<T, $Res> {
  _$LoadedCopyWithImpl(Loaded<T> _value, $Res Function(Loaded<T>) _then)
      : super(_value, (v) => _then(v as Loaded<T>));

  @override
  Loaded<T> get _value => super._value as Loaded<T>;

  @override
  $Res call({
    Object? refs = freezed,
  }) {
    return _then(Loaded<T>(
      refs == freezed
          ? _value.refs
          : refs // ignore: cast_nullable_to_non_nullable
              as List<NodeRef<T>>,
    ));
  }
}

/// @nodoc

class _$Loaded<T> implements Loaded<T> {
  const _$Loaded(this.refs);

  @override
  final List<NodeRef<T>> refs;

  @override
  String toString() {
    return 'NodeSelectorState<$T>.loaded(refs: $refs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Loaded<T> &&
            (identical(other.refs, refs) ||
                const DeepCollectionEquality().equals(other.refs, refs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(refs);

  @JsonKey(ignore: true)
  @override
  $LoadedCopyWith<T, Loaded<T>> get copyWith =>
      _$LoadedCopyWithImpl<T, Loaded<T>>(this, _$identity);

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
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Loaded<T> value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Loaded<T> value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class Loaded<T> implements NodeSelectorState<T> {
  const factory Loaded(List<NodeRef<T>> refs) = _$Loaded<T>;

  List<NodeRef<T>> get refs => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedCopyWith<T, Loaded<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
