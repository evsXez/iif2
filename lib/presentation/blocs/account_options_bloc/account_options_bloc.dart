import 'package:bloc/bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/blocs/accounts_panel_bloc/accounts_panel_bloc.dart';
import 'package:iif/presentation/include.dart';

import 'account_options_state.dart';

class AccountOptionsBloc extends Cubit<AccountOptionsState> {
  final BuildContext _context;
  final AccountsPanelBloc accountsPanelBloc;

  AccountOptionsBloc(this._context, {required this.accountsPanelBloc}) : super(const Idle());

  void showMenu(AccountBalance accountBalance) async {
    final options = await getAccountOptionsUseCase.of(_context).execute(accountBalance);
    emit(Options(options));
  }

  void archive(Account account) {
    archiveAccountUseCase.of(_context).execute(account);
    accountsPanelBloc.updateData();
  }
}
