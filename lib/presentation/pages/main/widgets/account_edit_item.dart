import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/data/models/account_model.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/misc/di/providers.dart';
import 'package:iif/presentation/blocs/accounts_panel_bloc/accounts_panel_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/account_credit_edit_item.dart';
import 'package:iif/presentation/pages/main/widgets/account_debt_edit_item.dart';
import 'package:iif/presentation/pages/main/widgets/account_money_edit_item.dart';
import 'package:iif/presentation/pages/main/widgets/small_button.dart';

class AccountEditItem extends StatefulWidget {
  final AccountType accountType;
  final AccountBalance? accountBalanceToEdit;

  const AccountEditItem({
    required this.accountType,
    required this.accountBalanceToEdit,
    Key? key,
  }) : super(key: key);

  @override
  State<AccountEditItem> createState() => _AccountEditItemState();
}

class _AccountEditItemState extends State<AccountEditItem> {
  bool get isDebts =>
      widget.accountType == AccountType.debts ||
      widget.accountType == AccountType.loans ||
      widget.accountType == AccountType.debtsAndLoans;
  bool get isCredit => widget.accountType == AccountType.creditCards;

  bool _isInputCompletedAndSmthChanged = false;

  late String _name = widget.accountBalanceToEdit?.account.name ?? "";
  late String _money = widget.accountBalanceToEdit?.money.toStringAsPrice() ?? "";
  late String _limit = widget.accountBalanceToEdit?.account.type == AccountType.creditCards
      ? ((widget.accountBalanceToEdit?.account as CreditCardAccount?)?.limit.toStringAsPrice() ?? "")
      : "";
  Subject? _selectedDebtSubject;
  Subject? _initialDebtSubject;

  void _somethingChanged() {
    bool nameEntered = _name.isNotEmpty;
    bool nameChanged = _name != widget.accountBalanceToEdit?.account.name;

    bool moneyEntered = _money.isNotEmpty;
    bool moneyChanged = _money != widget.accountBalanceToEdit?.money.toStringAsPrice();

    bool limitEntered = _limit.isNotEmpty;
    bool limitChanged = widget.accountBalanceToEdit?.account is CreditCardAccount
        ? _limit != (widget.accountBalanceToEdit?.account as CreditCardAccount).limit.toStringAsPrice()
        : false;

    bool subjectDebtEntered = _selectedDebtSubject != null;
    bool subjectDebtChanged =
        _initialDebtSubject != null ? (_initialDebtSubject != _selectedDebtSubject) : subjectDebtEntered;

    setState(() {
      if (isDebts) {
        _isInputCompletedAndSmthChanged = (subjectDebtEntered && moneyEntered && (subjectDebtChanged || moneyChanged));
      } else if (isCredit) {
        _isInputCompletedAndSmthChanged =
            (nameEntered && moneyEntered && limitEntered && (nameChanged || moneyChanged || limitChanged));
      } else {
        _isInputCompletedAndSmthChanged = (nameEntered && moneyEntered && (nameChanged || moneyChanged));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    final account = widget.accountBalanceToEdit?.account;
    if (account is AccountModel && account.subjectId != null) {
      final subject = subjectsRepository.of(context).getSubjectForId(account.subjectId);
      _initialDebtSubject = subject;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        isDebts
            ? AccountDebtEditItem(
                accountBalanceToEdit: widget.accountBalanceToEdit,
                onSubjectChanged: _subjectChanged,
                onMoneyChanged: _moneyChanged,
              )
            : isCredit
                ? AccountCreditEditItem(
                    accountBalanceToEdit: widget.accountBalanceToEdit,
                    onNameChanged: _nameChanged,
                    onMoneyChanged: _moneyChanged,
                    onLimitChanged: _limitChanged,
                  )
                : AccountMoneyEditItem(
                    accountBalanceToEdit: widget.accountBalanceToEdit,
                    onNameChanged: _nameChanged,
                    onMoneyChanged: _moneyChanged,
                  ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: _isInputCompletedAndSmthChanged
              ? SmallButton(
                  label: Strings.save,
                  onPressed: () => _onSave(context),
                )
              : SmallButton(
                  label: Strings.cancel,
                  onPressed: () => _onCancel(context),
                ),
        ),
      ],
    );
  }

  void _subjectChanged(Subject? value) {
    _selectedDebtSubject = value;
    _somethingChanged();
  }

  void _nameChanged(String value) {
    _name = value;
    _somethingChanged();
  }

  void _moneyChanged(String value) {
    _money = value;
    _somethingChanged();
  }

  void _limitChanged(String value) {
    _limit = value;
    _somethingChanged();
  }

  void _onSave(BuildContext context) {
    BlocProvider.of<AccountsPanelBloc>(context).saveAccount(
      accountToEdit: widget.accountBalanceToEdit?.account,
      name: _name,
      money: MoneyX.fromString(_money),
      debtSubject: _selectedDebtSubject,
      creditLimit: _limit.isNotEmpty ? MoneyX.fromString(_limit) : null,
    );
  }

  void _onCancel(BuildContext context) {
    BlocProvider.of<AccountsPanelBloc>(context).cancelEdit();
  }
}
