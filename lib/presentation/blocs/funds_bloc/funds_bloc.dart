import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/data/include.dart';
import 'package:iif/data/repositories/funds_repository.dart';

part 'funds_state.dart';
part 'funds_bloc.freezed.dart';

class FundsBloc extends Cubit<FundsState> {
  final FundsRepository repository;

  int? _expandedIndex;
  Map<FundType, Money>? _data;

  FundsBloc(this.repository) : super(const _LoadInProgress(null)) {
    repository.getMoneyForFundTypes().then((data) {
      _data = data;
      _emitData();
    });
  }

  void setExpanded(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = null;
    } else {
      _expandedIndex = index;
    }
    _emitData();
  }

  void _emitData() {
    if (_data == null) {
      emit(_LoadInProgress(_expandedIndex));
    } else {
      emit(_LoadSuccess(_data!, _expandedIndex));
    }
  }
}
