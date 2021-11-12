part of 'add_operation_bloc.dart';

@freezed
abstract class AddOperationState with _$AddOperationState {
  const factory AddOperationState.idle() = _Idle;
  const factory AddOperationState.visibility({
    required bool objects,
    required bool locationFrom,
    required bool locationTo,
    required bool money,
    required bool comment,
    required List<AccountBalance> accountsBalance,
    String? errorMessage,
  }) = _Visibility;
  const factory AddOperationState.saved() = _Saved;
}
