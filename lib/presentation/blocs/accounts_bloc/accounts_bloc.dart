import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';

part 'accounts_state.dart';
part 'accounts_bloc.freezed.dart';

class AccountsBloc extends Cubit<AccountsState> {
  int? _expandedIndex;
  List<MapEntry<AccountType, Money?>> _data = [];

  AccountsBloc() : super(const _Loaded(null, [])) {
    _data = GetAccountTypesOnMainPageUseCase().execute().map((it) => MapEntry(it, null)).toList();
    emit(_Loaded(null, _data));

    // repository.getMoneyForAccountTypes().then((data) {
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
