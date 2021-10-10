part of 'funds_panel_bloc.dart';

@freezed
abstract class FundsPanelState with _$FundsPanelState {
  const factory FundsPanelState.loadInProgress() = _LoadInProgress;
  const factory FundsPanelState.loadSuccess(
    List<FundWithMoney> data, {
    required Fund? editing,
    required bool isAddingNew,
  }) = _LoadSuccess;
}
