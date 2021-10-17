// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_options_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AccountOptionsStateTearOff {
  const _$AccountOptionsStateTearOff();

  Idle idle() {
    return const Idle();
  }

  Options options(AccountOptions options) {
    return Options(
      options,
    );
  }
}

/// @nodoc
const $AccountOptionsState = _$AccountOptionsStateTearOff();

/// @nodoc
mixin _$AccountOptionsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AccountOptions options) options,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AccountOptions options)? options,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AccountOptions options)? options,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Options value) options,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Options value)? options,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Options value)? options,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountOptionsStateCopyWith<$Res> {
  factory $AccountOptionsStateCopyWith(
          AccountOptionsState value, $Res Function(AccountOptionsState) then) =
      _$AccountOptionsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountOptionsStateCopyWithImpl<$Res>
    implements $AccountOptionsStateCopyWith<$Res> {
  _$AccountOptionsStateCopyWithImpl(this._value, this._then);

  final AccountOptionsState _value;
  // ignore: unused_field
  final $Res Function(AccountOptionsState) _then;
}

/// @nodoc
abstract class $IdleCopyWith<$Res> {
  factory $IdleCopyWith(Idle value, $Res Function(Idle) then) =
      _$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class _$IdleCopyWithImpl<$Res> extends _$AccountOptionsStateCopyWithImpl<$Res>
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
    return 'AccountOptionsState.idle()';
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
    required TResult Function(AccountOptions options) options,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AccountOptions options)? options,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AccountOptions options)? options,
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
    required TResult Function(Options value) options,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Options value)? options,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Options value)? options,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements AccountOptionsState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class $OptionsCopyWith<$Res> {
  factory $OptionsCopyWith(Options value, $Res Function(Options) then) =
      _$OptionsCopyWithImpl<$Res>;
  $Res call({AccountOptions options});
}

/// @nodoc
class _$OptionsCopyWithImpl<$Res>
    extends _$AccountOptionsStateCopyWithImpl<$Res>
    implements $OptionsCopyWith<$Res> {
  _$OptionsCopyWithImpl(Options _value, $Res Function(Options) _then)
      : super(_value, (v) => _then(v as Options));

  @override
  Options get _value => super._value as Options;

  @override
  $Res call({
    Object? options = freezed,
  }) {
    return _then(Options(
      options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as AccountOptions,
    ));
  }
}

/// @nodoc

class _$Options implements Options {
  const _$Options(this.options);

  @override
  final AccountOptions options;

  @override
  String toString() {
    return 'AccountOptionsState.options(options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Options &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(options);

  @JsonKey(ignore: true)
  @override
  $OptionsCopyWith<Options> get copyWith =>
      _$OptionsCopyWithImpl<Options>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(AccountOptions options) options,
  }) {
    return options(this.options);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AccountOptions options)? options,
  }) {
    return options?.call(this.options);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(AccountOptions options)? options,
    required TResult orElse(),
  }) {
    if (options != null) {
      return options(this.options);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Options value) options,
  }) {
    return options(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Options value)? options,
  }) {
    return options?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Options value)? options,
    required TResult orElse(),
  }) {
    if (options != null) {
      return options(this);
    }
    return orElse();
  }
}

abstract class Options implements AccountOptionsState {
  const factory Options(AccountOptions options) = _$Options;

  AccountOptions get options => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OptionsCopyWith<Options> get copyWith => throw _privateConstructorUsedError;
}
