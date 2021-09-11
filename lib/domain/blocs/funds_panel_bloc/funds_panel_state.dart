part of 'funds_panel_bloc.dart';

@freezed
abstract class FundsPanelState with _$FundsPanelState {
  const factory FundsPanelState.loadInProgress() = _LoadInProgress;
  const factory FundsPanelState.loadSuccess(
    List<Fund> funds, {
    required Fund? highlighted,
    required Fund? editing,
  }) = _LoadSuccess;
}
