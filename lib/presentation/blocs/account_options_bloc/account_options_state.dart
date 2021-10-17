import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';

part 'account_options_state.freezed.dart';

@freezed
class AccountOptionsState with _$AccountOptionsState {
  const factory AccountOptionsState.idle() = Idle;
  const factory AccountOptionsState.options(AccountOptions options) = Options;
}
