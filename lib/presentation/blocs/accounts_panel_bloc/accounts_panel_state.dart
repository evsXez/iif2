part of 'accounts_panel_bloc.dart';

@freezed
abstract class AccountsPanelState with _$AccountsPanelState {
  const factory AccountsPanelState.loadInProgress() = _LoadInProgress;
  const factory AccountsPanelState.loadSuccess(
    List<AccountBalance> data, {
    required Account? editing,
    required bool isAddingNew,
  }) = _LoadSuccess;
}
