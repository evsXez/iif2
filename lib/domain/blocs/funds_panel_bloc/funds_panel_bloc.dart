import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/data/include/data_include.dart';
import 'package:iif/data/repositories/funds_repository.dart';

part 'funds_panel_state.dart';
part 'funds_panel_bloc.freezed.dart';

class FundsPanelBloc extends Cubit<FundsPanelState> {
  final FundsRepository repository;
  final FundType type;

  FundsPanelBloc({
    required this.repository,
    required this.type,
  }) : super(const _LoadInProgress()) {
    repository.getFundsOfType(type).then((data) {
      emit(_LoadSuccess(
        data,
        highlighted: null,
        editing: null,
      ));
    });
  }
}
