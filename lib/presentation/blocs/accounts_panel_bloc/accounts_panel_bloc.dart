import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

part 'accounts_panel_state.dart';
part 'accounts_panel_bloc.freezed.dart';

class AccountsPanelBloc extends Cubit<AccountsPanelState> {
  final AccountType type;

  final BuildContext _context;
  final List<AccountBalance> _data = [];

  AccountsPanelBloc(
    this._context, {
    required this.type,
  }) : super(const _LoadInProgress()) {
    _updateData();
  }

  void cancelEdit() {
    emit(
      _LoadSuccess(
        _data,
        editing: null,
        isAddingNew: false,
      ),
    );
  }

  void saveAccount({
    required String name,
    required Money money,
  }) async {
    final account = Account(
      currency: Currency.debugDefault,
      name: name,
      type: type,
    );
    saveAccountUseCase.of(_context).execute(account, money);
    _updateData();
  }

  void addAccountClicked() {
    emit(
      _LoadSuccess(
        _data,
        editing: null,
        isAddingNew: true,
      ),
    );
  }

  void _updateData() async {
    //   final accounts = accountsRepository.getAccountsOfType(type);
    //   _data.clear();
    //   await Future.forEach<Account>(accounts, (account) async {
    //     final money = await operationsRepository.calculateMoney(account);
    //     _data.add(AccountWithMoney(account, money));
    //   });
    //   emit(
    //     _LoadSuccess(
    //       _data,
    //       editing: null,
    //       isAddingNew: false,
    //     ),
    //   );
  }
}
