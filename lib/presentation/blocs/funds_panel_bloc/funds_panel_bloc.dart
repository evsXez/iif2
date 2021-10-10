import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/data/include.dart';
import 'package:iif/data/models/fund_with_money.dart';
import 'package:iif/data/repositories/funds_repository.dart';
import 'package:iif/data/repositories/operations_repository.dart';

part 'funds_panel_state.dart';
part 'funds_panel_bloc.freezed.dart';

class FundsPanelBloc extends Cubit<FundsPanelState> {
  final FundsRepository fundsRepository;
  final OperationsRepository operationsRepository;
  final FundType type;

  final List<FundWithMoney> _data = [];

  FundsPanelBloc({
    required this.fundsRepository,
    required this.operationsRepository,
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

  void saveFund({
    required Fund? fundToEdit,
    required String name,
    required Money money,
  }) async {
    final fund = await fundsRepository.saveFund(fundToEdit, name, type);
    operationsRepository.initialInput(fund, money);
    _updateData();
  }

  void addFundClicked() {
    emit(
      _LoadSuccess(
        _data,
        editing: null,
        isAddingNew: true,
      ),
    );
  }

  void _updateData() {
    fundsRepository.getFundsOfType(type).then((funds) async {
      _data.clear();
      await Future.forEach<Fund>(funds, (fund) async {
        final money = await operationsRepository.calculateMoney(fund);
        _data.add(FundWithMoney(fund, money));
      });
      emit(
        _LoadSuccess(
          _data,
          editing: null,
          isAddingNew: false,
        ),
      );
    });
  }
}
