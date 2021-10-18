part of 'operations_list_bloc.dart';

@freezed
abstract class OperationsListState with _$OperationsListState {
  const factory OperationsListState.loading() = _Loading;
  const factory OperationsListState.loaded(List<LogicOperation> data) = _Loaded;
}
