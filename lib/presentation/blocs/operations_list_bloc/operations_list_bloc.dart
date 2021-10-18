import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

part 'operations_list_state.dart';
part 'operations_list_bloc.freezed.dart';

class OperationsListBloc extends Cubit<OperationsListState> {
  final BuildContext _context;

  OperationsListBloc(this._context) : super(const _Loading()) {
    operationsRepository.of(_context).addListener(_updateData);
    _updateData();
  }

  @override
  Future<void> close() {
    operationsRepository.of(_context).removeListener(_updateData);
    return super.close();
  }

  void _updateData() async {
    final data = await getAllOperationsUseCase.of(_context).execute();
    data.sort((l1, l2) => -l1.created.compareTo(l2.created));
    emit(_Loaded(data));
  }
}
