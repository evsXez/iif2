import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';

part 'operations_list_state.freezed.dart';

@freezed
abstract class OperationsListState with _$OperationsListState {
  const factory OperationsListState.loading() = Loading;
  const factory OperationsListState.loaded(List<LogicOperation> data) = Loaded;
}
