import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/blocs/node_selector_bloc/node_selector_bloc.dart';
import 'package:iif/presentation/blocs/node_selector_bloc/node_selector_state.dart';
import 'package:iif/presentation/include.dart';

import 'add_operation_state.dart';

class AddOperationBloc extends Cubit<AddOperationState> {
  final BuildContext _context;
  final NodeSelectorBloc<Category> categorySelectorBloc;
  final NodeSelectorBloc<Subject> debtSubjectSelectorBloc;
  final NodeSelectorBloc<Subject> generalSubjectSelectorBloc;

  List<StreamSubscription> _obs = [];
  List<AccountBalance> _accountsBalance = [];

  final _fields = _SelectedFields();

  AddOperationBloc(
    this._context, {
    required this.categorySelectorBloc,
    required this.debtSubjectSelectorBloc,
    required this.generalSubjectSelectorBloc,
  }) : super(const Idle()) {
    _obs.add(categorySelectorBloc.stream.listen(_onCategoriesChanged));
    _obs.add(debtSubjectSelectorBloc.stream.listen(_onSubjectsChanged));
    _obs.add(generalSubjectSelectorBloc.stream.listen(_onSubjectsChanged));

    _getAccounts();
  }

  void _getAccounts() async {
    final moneyAccountsBalance = await getAccountsBalanceUseCase.of(_context).execute(AccountType.money);
    final creditCardsAccountsBalance = await getAccountsBalanceUseCase.of(_context).execute(AccountType.creditCards);

    _accountsBalance = [...moneyAccountsBalance, ...creditCardsAccountsBalance];
    final defaultAccount = _accountsBalance.first.account;
    _fields.accountFrom = defaultAccount;
    _fields.accountTo = defaultAccount;
  }

  @override
  Future<void> close() {
    for (var it in _obs) {
      it.cancel();
    }
    return super.close();
  }

  void _onCategoriesChanged(NodeSelectorState<Category> state) {
    state.maybeMap(
      loaded: (data) {
        final refs = data.refs.where((ref) => ref.node.isSelected).toList();
        final baseCategory = refs.firstOrNull?.node.value;

        _fields.baseCategory = baseCategory;
        if (baseCategory?.type == CategoryType.debtsAndLoans && refs.length > 1) {
          _fields.baseCategory = refs[1].node.value;
        }
        _fields.categoriesStamp = refs.map((it) => (it.node.value?.name) ?? "").join("/");

        _emitVisibility();
      },
      orElse: () {},
    );
  }

  void _onSubjectsChanged(NodeSelectorState<Subject> state) {
    state.maybeMap(
      loaded: (data) {
        final selectedRefs = data.refs.where((ref) => ref.node.isSelected).toList();
        final selectedSubject = selectedRefs.lastOrNull?.node.value;

        _fields.subject = selectedSubject;
        _fields.subjectsStamp = selectedRefs.map((it) => (it.node.value?.name) ?? "").join("/");
      },
      orElse: () {},
    );
  }

  void _emitVisibility({String? errorMessage}) {
    final isIncome = _fields.baseCategory?.type == CategoryType.income;
    final isExpense = _fields.baseCategory?.type == CategoryType.expense;
    final isTransfer = _fields.baseCategory?.type == CategoryType.transfer;
    final isDebtIncrease = _fields.baseCategory?.type == CategoryType.debtIncrease;
    final isDebtDecrease = _fields.baseCategory?.type == CategoryType.debtDecrease;
    final isLoanIncrease = _fields.baseCategory?.type == CategoryType.loanIncrease;
    final isLoanDecrease = _fields.baseCategory?.type == CategoryType.loanDecrease;
    final isDebts = isDebtIncrease || isDebtDecrease || isLoanIncrease || isLoanDecrease;
    emit(
      VisibilityState(
        debtSubject: isDebts,
        generalSubject: isIncome || isExpense,
        locationFrom: isExpense || isTransfer || isDebtDecrease || isLoanIncrease,
        locationTo: isIncome || isTransfer || isDebtIncrease || isLoanDecrease,
        money: isIncome || isExpense || isTransfer || isDebts,
        comment: isIncome || isExpense || isTransfer || isDebts,
        accountsBalance: _accountsBalance,
        errorMessage: errorMessage,
      ),
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
      switch (_fields.baseCategory!.type) {
        case CategoryType.expense:
          addExpenseUseCase.of(_context).execute(
                _fields.accountFrom!,
                _fields.money!,
                comment: _fields.comment,
                categoriesStamp: _fields.categoriesStamp,
                subjectsStamp: _fields.subjectsStamp,
              );
          break;
        case CategoryType.income:
          addIncomeUseCase.of(_context).execute(
                _fields.accountTo!,
                _fields.money!,
                comment: _fields.comment,
                categoriesStamp: _fields.categoriesStamp,
                subjectsStamp: _fields.subjectsStamp,
              );
          break;
        case CategoryType.transfer:
          addTransferUseCase.of(_context).execute(
                _fields.accountFrom!,
                _fields.accountTo!,
                _fields.money!,
                comment: _fields.comment,
                categoriesStamp: _fields.categoriesStamp,
              );
          break;
        case CategoryType.debtIncrease:
          debtIncreaseUseCase.of(_context).execute(
                _fields.accountTo!,
                _fields.money!,
                comment: _fields.comment,
                categoriesStamp: _fields.categoriesStamp,
                subjectsStamp: _fields.subjectsStamp,
                subject: _fields.subject!,
                debtType: AccountType.debts,
              );
          break;
        case CategoryType.debtDecrease:
          debtDecreaseUseCase.of(_context).execute(
                _fields.accountFrom!,
                _fields.money!,
                comment: _fields.comment,
                categoriesStamp: _fields.categoriesStamp,
                subjectsStamp: _fields.subjectsStamp,
                subject: _fields.subject!,
                debtType: AccountType.debts,
              );
          break;
        case CategoryType.loanIncrease:
          loanIncreaseUseCase.of(_context).execute(
                _fields.accountFrom!,
                _fields.money!,
                comment: _fields.comment,
                categoriesStamp: _fields.categoriesStamp,
                subjectsStamp: _fields.subjectsStamp,
                subject: _fields.subject!,
                debtType: AccountType.loans,
              );
          break;
        case CategoryType.loanDecrease:
          loanDecreaseUseCase.of(_context).execute(
                _fields.accountTo!,
                _fields.money!,
                comment: _fields.comment,
                categoriesStamp: _fields.categoriesStamp,
                subjectsStamp: _fields.subjectsStamp,
                subject: _fields.subject!,
                debtType: AccountType.loans,
              );
          break;
        default:
          throw _UndefinedOperationException();
      }
      emit(const Saved());
      // } on _BaseCategoryNotSelectedException catch (e) {
      //   //TODO: emit validation error
      //   print(e);
    } catch (e) {
      print(e);
      _emitVisibility(errorMessage: e.runtimeType.toString() + "${DateTime.now().millisecond}");
    }
  }
}

class _SelectedFields {
  Category? baseCategory;
  Account? accountFrom;
  Account? accountTo;
  Money? money;
  String? comment;
  String? categoriesStamp;
  String? subjectsStamp;
  Subject? subject;

  void validate() {
    if (baseCategory == null) {
      throw _BaseCategoryNotSelectedException();
    }
    if ((baseCategory?.type == CategoryType.income ||
            baseCategory?.type == CategoryType.debtIncrease ||
            baseCategory?.type == CategoryType.loanDecrease) &&
        accountTo == null) {
      throw _AccountToNotSelectedException();
    }
    if ((baseCategory?.type == CategoryType.expense ||
            baseCategory?.type == CategoryType.debtDecrease ||
            baseCategory?.type == CategoryType.loanIncrease) &&
        accountFrom == null) {
      throw _AccountFromNotSelectedException();
    }
    if (baseCategory?.type == CategoryType.transfer && (accountFrom == accountTo)) {
      throw _TransferAccountsMustBeDifferentException();
    }
    if (money == null) {
      throw _MoneyNotSelectedException();
    }
    if (subject == null &&
        (baseCategory?.type == CategoryType.debtIncrease ||
            baseCategory?.type == CategoryType.debtDecrease ||
            baseCategory?.type == CategoryType.loanIncrease ||
            baseCategory?.type == CategoryType.loanDecrease)) {
      throw _SubjectNotSelectedException();
    }
  }
}

class _BaseCategoryNotSelectedException {}

class _SubjectNotSelectedException {}

class _MoneyNotSelectedException {}

class _AccountFromNotSelectedException {}

class _AccountToNotSelectedException {}

class _TransferAccountsMustBeDifferentException {}

class _UndefinedOperationException {}
