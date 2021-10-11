part of 'accounts_bloc.dart';

@freezed
abstract class AccountsState with _$AccountsState {
  const factory AccountsState.loaded(int? expandedIndex, List<MapEntry<AccountType, Money?>> data) = _Loaded;
}
