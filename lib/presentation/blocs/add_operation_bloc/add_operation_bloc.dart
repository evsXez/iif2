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

  final _fields = _SelectedFields();

  AddOperationBloc(
    this._context, {
    required this.categorySelectorBloc,
  }) : super(const _Idle()) {
    _obs.add(categorySelectorBloc.stream.listen(_onCategoriesChanged));

    //TODO: think what types allowed
    getAccountsBalanceUseCase.of(_context).execute(AccountType.money).then((value) {
      _accountsBalance = value;
      final defaultAccount = _accountsBalance.first.account;
      _fields.accountFrom = defaultAccount;
      _fields.accountTo = defaultAccount;
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
        final baseCategory = data.categories.where((ref) => ref.node.isSelected).firstOrNull?.node.value;
        _fields.baseCategory = baseCategory;
        print("Base category: $baseCategory, accounts count: ${_accountsBalance.length}");

        final isIncome = baseCategory?.type == CategoryType.income;
        final isExpense = baseCategory?.type == CategoryType.expense;
        final isTransfer = baseCategory?.type == CategoryType.transfer;

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
    _fields.comment = text;
  }

  void moneyChanged(Money money) {
    _fields.money = money;
  }

  void accountFromChanged(Account account) {
    _fields.accountFrom = account;
  }

  void accountToChanged(account) {
    _fields.accountTo = account;
  }

  void trySave() {
    try {
      _fields.validate();
      addExpenseUseCase.of(_context).execute(_fields.accountFrom!, _fields.money!);
      emit(const _Saved());
    } on _BaseCategoryNotSelectedException catch (e) {
      //TODO: emit validation error
      print(e);
    } catch (e) {
      print(e);
    }
  }
}

class _SelectedFields {
  Category? baseCategory;
  Account? accountFrom;
  Account? accountTo;
  Money? money;
  String? comment;

  void validate() {
    if (baseCategory == null) {
      throw _BaseCategoryNotSelectedException();
    }
    if (baseCategory == Strings.category_income && accountTo == null) {
      throw _AccountToNotSelectedException();
    }
    if (baseCategory == Strings.category_expense && accountFrom == null) {
      throw _AccountFromNotSelectedException();
    }
    if (baseCategory == Strings.category_transfer && (accountFrom == accountTo)) {
      throw _TransferAccountsMustBeDifferentException();
    }
    if (money == null) {
      throw _MoneyNotSelectedException();
    }
  }
}

class _BaseCategoryNotSelectedException {}

class _MoneyNotSelectedException {}

class _AccountFromNotSelectedException {}

class _AccountToNotSelectedException {}

class _TransferAccountsMustBeDifferentException {}

class _UndefinedOperationException {}
