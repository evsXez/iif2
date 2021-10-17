import 'package:bloc/bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

import 'account_options_state.dart';

class AccountOptionsBloc extends Cubit<AccountOptionsState> {
  final BuildContext _context;

  AccountOptionsBloc(this._context) : super(const Idle());

  void showMenu(AccountBalance accountBalance) async {
    final options = await getAccountOptionsUseCase.of(_context).execute(accountBalance);
    emit(Options(options));
  }
}
