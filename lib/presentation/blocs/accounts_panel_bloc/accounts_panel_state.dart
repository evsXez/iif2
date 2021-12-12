import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';

part 'accounts_panel_state.freezed.dart';

@freezed
abstract class AccountsPanelState with _$AccountsPanelState {
  const factory AccountsPanelState.loadInProgress() = LoadInProgress;
  const factory AccountsPanelState.loadSuccess(
    List<AccountBalance> data, {
    required Account? editing,
    required bool isAddingNew,
    required bool isButtonAddVisible,
  }) = LoadSuccess;
}
