import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';

part 'accounts_state.freezed.dart';

@freezed
abstract class AccountsState with _$AccountsState {
  const factory AccountsState.loaded(int? expandedIndex, List<MapEntry<AccountType, Money?>> data) = Loaded;
}
