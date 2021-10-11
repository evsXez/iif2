import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/funds_repository.dart';
import 'package:iif/domain/use_cases/get_fund_types_on_main_page.dart';

part 'funds_state.dart';
part 'funds_bloc.freezed.dart';

class FundsBloc extends Cubit<FundsState> {
  final FundsRepository repository;

  int? _expandedIndex;
  List<MapEntry<FundType, Money?>> _data = [];

  FundsBloc(this.repository) : super(const _Loaded(null, [])) {
    _data = GetFundTypesOnMainPage().execute().map((it) => MapEntry(it, null)).toList();
    emit(_Loaded(null, _data));

    // repository.getMoneyForFundTypes().then((data) {
    //   _data = data;
    //   _emitData();
    // });
  }

  void setExpanded(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = null;
    } else {
      _expandedIndex = index;
    }
    emit(_Loaded(_expandedIndex, _data));
  }

  void _emitData() {
    // if (_data == null) {
    //   emit(_LoadInProgress(_expandedIndex));
    // } else {
    //   emit(_LoadSuccess(_data!, _expandedIndex));
    // }
  }
}
