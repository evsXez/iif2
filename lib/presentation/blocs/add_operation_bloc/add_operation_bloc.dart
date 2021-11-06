import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/blocs/category_selector_bloc/category_selector_bloc.dart';
import 'package:iif/presentation/include.dart';

part 'add_operation_state.dart';
part 'add_operation_bloc.freezed.dart';

class AddOperationBloc extends Cubit<AddOperationState> {
  final BuildContext _context;
  final CategorySelectorBloc categorySelectorBloc;

  List<StreamSubscription> _obs = [];
  List<AccountBalance> _accountsBalance = [];

  AddOperationBloc(
    this._context, {
    required this.categorySelectorBloc,
  }) : super(const _Idle()) {
    _obs.add(categorySelectorBloc.stream.listen(_onCategoriesChanged));

    //TODO: think what types allowed
    getAccountsBalanceUseCase.of(_context).execute(AccountType.money).then((value) {
      _accountsBalance = value;
    });
  }

  @override
  Future<void> close() {
    for (var it in _obs) {
      it.cancel();
    }
    return super.close();
  }

  void _onCategoriesChanged(CategorySelectorState state) {
    state.maybeMap(
      loaded: (data) {
        final baseCategoryName = data.categories.where((ref) => ref.node.isSelected).firstOrNull?.node.category.name;
        print("Base category: $baseCategoryName, accounts count: ${_accountsBalance.length}");

        final isIncome = baseCategoryName == Strings.category_income;
        final isExpense = baseCategoryName == Strings.category_expense;
        final isTransfer = baseCategoryName == Strings.category_transfer;

        emit(
          _Visibility(
            objects: false,
            locationFrom: isExpense || isTransfer,
            locationTo: isIncome || isTransfer,
            money: isIncome || isExpense || isTransfer,
            comment: isIncome || isExpense || isTransfer,
            accountsBalance: _accountsBalance,
          ),
        );
      },
      orElse: () {},
    );
  }

  void commentChanged(String text) {
    print("comment: $text");
  }

  void moneyChanged(Money money) {
    print("money: $money");
  }

  void accountFromChanged(Account account) {
    print("from: $account");
  }

  void accountToChanged(account) {
    print("to: $account");
  }
}
