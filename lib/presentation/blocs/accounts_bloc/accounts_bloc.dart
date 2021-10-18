import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/include.dart';

part 'accounts_state.dart';
part 'accounts_bloc.freezed.dart';

class AccountsBloc extends Cubit<AccountsState> {
  int? _expandedIndex;
  List<MapEntry<AccountType, Money?>> _data = [];
  final BuildContext _context;

  AccountsBloc(this._context) : super(const _Loaded(null, [])) {
    operationsRepository.of(_context).addListener(_updateData); //add operations
    accountsRepository.of(_context).addListener(_updateData); //delete, archive - don't count
    _data = getAccountTypesOnMainPageUseCase.of(_context).execute().map((it) => MapEntry(it, null)).toList();
    emit(_Loaded(_expandedIndex, _data));
    _updateData();
  }

  @override
  Future<void> close() {
    operationsRepository.of(_context).removeListener(_updateData);
    accountsRepository.of(_context).removeListener(_updateData);
    return super.close();
  }

  void setExpanded(int index) {
    if (_expandedIndex == index) {
      _expandedIndex = null;
    } else {
      _expandedIndex = index;
    }
    emit(_Loaded(_expandedIndex, _data));
  }

  void _updateData() async {
    _data = await getAllMoneyForAccountTypesUseCase.of(_context).execute();
    emit(_Loaded(_expandedIndex, _data));
  }
}
