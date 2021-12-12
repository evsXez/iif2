import 'package:bloc/bloc.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

import 'main_page_fab_state.dart';

class MainPageFabBloc extends Cubit<MainPageFabState> {
  final BuildContext _context;

  MainPageFabBloc(this._context) : super(const Hidden()) {
    accountsRepository.of(_context).addListener(_updateData);
    uiNotifierAccountEditorOpened.addListener(_updateData);
    _updateData();
  }

  @override
  Future<void> close() {
    accountsRepository.of(_context).removeListener(_updateData);
    uiNotifierAccountEditorOpened.removeListener(_updateData);
    return super.close();
  }

  void _updateData() async {
    final hasAtLeastOneAccount = getAccountsCountUseCase.of(_context).execute() > 0;
    final isAccountEditorOpened = uiNotifierAccountEditorOpened.isAccountEditorOpened;
    emit(hasAtLeastOneAccount && !isAccountEditorOpened ? const Shown() : const Hidden());
  }
}
