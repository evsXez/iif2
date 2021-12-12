import 'package:bloc/bloc.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

import 'operations_list_state.dart';

class OperationsListBloc extends Cubit<OperationsListState> {
  final BuildContext _context;

  OperationsListBloc(this._context) : super(const Loading()) {
    operationsRepository.of(_context).addListener(_updateData);
    accountsRepository.of(_context).addListener(_updateData);
    _updateData();
  }

  @override
  Future<void> close() {
    operationsRepository.of(_context).removeListener(_updateData);
    accountsRepository.of(_context).removeListener(_updateData);
    return super.close();
  }

  void _updateData() async {
    final data = await getAllOperationsUseCase.of(_context).execute();
    data.sort((l1, l2) => -l1.created.compareTo(l2.created));
    emit(Loaded(data));
  }
}
