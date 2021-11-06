part of 'add_operation_bloc.dart';

@freezed
abstract class AddOperationState with _$AddOperationState {
  const factory AddOperationState.visibility({
    required bool objects,
    required bool locationFrom,
    required bool locationTo,
    required bool money,
    required bool comment,
  }) = _Visibility;
}
