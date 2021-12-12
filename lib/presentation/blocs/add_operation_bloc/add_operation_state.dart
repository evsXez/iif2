import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';

part 'add_operation_state.freezed.dart';

@freezed
abstract class AddOperationState with _$AddOperationState {
  const factory AddOperationState.idle() = Idle;
  const factory AddOperationState.visibility({
    required bool subject,
    required bool locationFrom,
    required bool locationTo,
    required bool money,
    required bool comment,
    required List<AccountBalance> accountsBalance,
    String? errorMessage,
  }) = VisibilityState;
  const factory AddOperationState.saved() = Saved;
}
