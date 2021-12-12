// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'accounts_panel_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AccountsPanelStateTearOff {
  const _$AccountsPanelStateTearOff();

  LoadInProgress loadInProgress() {
    return const LoadInProgress();
  }

  LoadSuccess loadSuccess(List<AccountBalance> data,
      {required Account? editing,
      required bool isAddingNew,
      required bool isButtonAddVisible}) {
    return LoadSuccess(
      data,
      editing: editing,
      isAddingNew: isAddingNew,
      isButtonAddVisible: isButtonAddVisible,
    );
  }
}

/// @nodoc
const $AccountsPanelState = _$AccountsPanelStateTearOff();

/// @nodoc
mixin _$AccountsPanelState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function(List<AccountBalance> data, Account? editing,
            bool isAddingNew, bool isButtonAddVisible)
        loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(List<AccountBalance> data, Account? editing,
            bool isAddingNew, bool isButtonAddVisible)?
        loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(List<AccountBalance> data, Account? editing,
            bool isAddingNew, bool isButtonAddVisible)?
        loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsPanelStateCopyWith<$Res> {
  factory $AccountsPanelStateCopyWith(
          AccountsPanelState value, $Res Function(AccountsPanelState) then) =
      _$AccountsPanelStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountsPanelStateCopyWithImpl<$Res>
    implements $AccountsPanelStateCopyWith<$Res> {
  _$AccountsPanelStateCopyWithImpl(this._value, this._then);

  final AccountsPanelState _value;
  // ignore: unused_field
  final $Res Function(AccountsPanelState) _then;
}

/// @nodoc
abstract class $LoadInProgressCopyWith<$Res> {
  factory $LoadInProgressCopyWith(
          LoadInProgress value, $Res Function(LoadInProgress) then) =
      _$LoadInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadInProgressCopyWithImpl<$Res>
    extends _$AccountsPanelStateCopyWithImpl<$Res>
    implements $LoadInProgressCopyWith<$Res> {
  _$LoadInProgressCopyWithImpl(
      LoadInProgress _value, $Res Function(LoadInProgress) _then)
      : super(_value, (v) => _then(v as LoadInProgress));

  @override
  LoadInProgress get _value => super._value as LoadInProgress;
}

/// @nodoc

class _$LoadInProgress implements LoadInProgress {
  const _$LoadInProgress();

  @override
  String toString() {
    return 'AccountsPanelState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function(List<AccountBalance> data, Account? editing,
            bool isAddingNew, bool isButtonAddVisible)
        loadSuccess,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(List<AccountBalance> data, Account? editing,
            bool isAddingNew, bool isButtonAddVisible)?
        loadSuccess,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(List<AccountBalance> data, Account? editing,
            bool isAddingNew, bool isButtonAddVisible)?
        loadSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class LoadInProgress implements AccountsPanelState {
  const factory LoadInProgress() = _$LoadInProgress;
}

/// @nodoc
abstract class $LoadSuccessCopyWith<$Res> {
  factory $LoadSuccessCopyWith(
          LoadSuccess value, $Res Function(LoadSuccess) then) =
      _$LoadSuccessCopyWithImpl<$Res>;
  $Res call(
      {List<AccountBalance> data,
      Account? editing,
      bool isAddingNew,
      bool isButtonAddVisible});
}

/// @nodoc
class _$LoadSuccessCopyWithImpl<$Res>
    extends _$AccountsPanelStateCopyWithImpl<$Res>
    implements $LoadSuccessCopyWith<$Res> {
  _$LoadSuccessCopyWithImpl(
      LoadSuccess _value, $Res Function(LoadSuccess) _then)
      : super(_value, (v) => _then(v as LoadSuccess));

  @override
  LoadSuccess get _value => super._value as LoadSuccess;

  @override
  $Res call({
    Object? data = freezed,
    Object? editing = freezed,
    Object? isAddingNew = freezed,
    Object? isButtonAddVisible = freezed,
  }) {
    return _then(LoadSuccess(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<AccountBalance>,
      editing: editing == freezed
          ? _value.editing
          : editing // ignore: cast_nullable_to_non_nullable
              as Account?,
      isAddingNew: isAddingNew == freezed
          ? _value.isAddingNew
          : isAddingNew // ignore: cast_nullable_to_non_nullable
              as bool,
      isButtonAddVisible: isButtonAddVisible == freezed
          ? _value.isButtonAddVisible
          : isButtonAddVisible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.data,
      {required this.editing,
      required this.isAddingNew,
      required this.isButtonAddVisible});

  @override
  final List<AccountBalance> data;
  @override
  final Account? editing;
  @override
  final bool isAddingNew;
  @override
  final bool isButtonAddVisible;

  @override
  String toString() {
    return 'AccountsPanelState.loadSuccess(data: $data, editing: $editing, isAddingNew: $isAddingNew, isButtonAddVisible: $isButtonAddVisible)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadSuccess &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.editing, editing) ||
                const DeepCollectionEquality()
                    .equals(other.editing, editing)) &&
            (identical(other.isAddingNew, isAddingNew) ||
                const DeepCollectionEquality()
                    .equals(other.isAddingNew, isAddingNew)) &&
            (identical(other.isButtonAddVisible, isButtonAddVisible) ||
                const DeepCollectionEquality()
                    .equals(other.isButtonAddVisible, isButtonAddVisible)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(editing) ^
      const DeepCollectionEquality().hash(isAddingNew) ^
      const DeepCollectionEquality().hash(isButtonAddVisible);

  @JsonKey(ignore: true)
  @override
  $LoadSuccessCopyWith<LoadSuccess> get copyWith =>
      _$LoadSuccessCopyWithImpl<LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadInProgress,
    required TResult Function(List<AccountBalance> data, Account? editing,
            bool isAddingNew, bool isButtonAddVisible)
        loadSuccess,
  }) {
    return loadSuccess(data, editing, isAddingNew, isButtonAddVisible);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(List<AccountBalance> data, Account? editing,
            bool isAddingNew, bool isButtonAddVisible)?
        loadSuccess,
  }) {
    return loadSuccess?.call(data, editing, isAddingNew, isButtonAddVisible);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadInProgress,
    TResult Function(List<AccountBalance> data, Account? editing,
            bool isAddingNew, bool isButtonAddVisible)?
        loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(data, editing, isAddingNew, isButtonAddVisible);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements AccountsPanelState {
  const factory LoadSuccess(List<AccountBalance> data,
      {required Account? editing,
      required bool isAddingNew,
      required bool isButtonAddVisible}) = _$LoadSuccess;

  List<AccountBalance> get data => throw _privateConstructorUsedError;
  Account? get editing => throw _privateConstructorUsedError;
  bool get isAddingNew => throw _privateConstructorUsedError;
  bool get isButtonAddVisible => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadSuccessCopyWith<LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}
