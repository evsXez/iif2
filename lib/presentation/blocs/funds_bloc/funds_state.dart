part of 'funds_bloc.dart';

@freezed
abstract class FundsState with _$FundsState {
  const factory FundsState.loadInProgress(int? expandedIndex) = _LoadInProgress;
  const factory FundsState.loadSuccess(Map<FundType, Money> data, int? expandedIndex) = _LoadSuccess;
}
