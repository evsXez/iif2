part of 'funds_bloc.dart';

@freezed
abstract class FundsState with _$FundsState {
  const factory FundsState.loaded(int? expandedIndex, List<MapEntry<FundType, Money?>> data) = _Loaded;
}
