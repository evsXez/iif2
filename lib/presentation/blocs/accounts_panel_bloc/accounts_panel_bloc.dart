import 'dart:async';

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
  List<AccountBalance> _data = [];
  late StreamSubscription _uiNotifierSubscription;

  AccountsPanelBloc(
    this._context, {
    required this.type,
  }) : super(const _LoadInProgress()) {
    accountsRepository.of(_context).addListener(_updateData);
    operationsRepository.of(_context).addListener(_updateData); //add operations
    _updateData();

    _uiNotifierSubscription = stream.listen((event) {
      event.maybeWhen(
        loadSuccess: (_, editing, isAddingNew) {
          if (editing != null || isAddingNew) {
            uiNotifierAccountEditorOpened.editorOpened();
          } else {
            uiNotifierAccountEditorOpened.editorClosed();
          }
        },
        orElse: () {},
      );
    });
  }

  @override
  Future<void> close() {
    accountsRepository.of(_context).removeListener(_updateData);
    operationsRepository.of(_context).removeListener(_updateData);
    _uiNotifierSubscription.cancel();
    return super.close();
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
    Account? accountToEdit,
    required String name,
    required Money money,
  }) async {
    final accountTemplate = Account(
      id: accountToEdit?.id ?? -1,
      name: name,
      type: type,
      currency: Currency.debugDefault,
    );
    saveAccountUseCase.of(_context).execute(accountTemplate, money);
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
    _data = await getAccountsBalanceUseCase.of(_context).execute(type);
    emit(
      _LoadSuccess(
        _data,
        editing: null,
        isAddingNew: false,
      ),
    );
  }

  void editAccount(Account account) {
    emit(
      _LoadSuccess(
        _data,
        editing: account,
        isAddingNew: false,
      ),
    );
  }
}
