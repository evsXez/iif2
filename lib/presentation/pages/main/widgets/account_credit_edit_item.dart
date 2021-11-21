import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/style.dart';

class AccountCreditEditItem extends StatefulWidget {
  final AccountBalance? accountBalanceToEdit;
  final Function(String) onNameChanged;
  final Function(String) onMoneyChanged;
  final Function(String) onLimitChanged;
  const AccountCreditEditItem({
    Key? key,
    required this.accountBalanceToEdit,
    required this.onNameChanged,
    required this.onMoneyChanged,
    required this.onLimitChanged,
  }) : super(key: key);

  @override
  _AccountCreditEditItemState createState() => _AccountCreditEditItemState();
}

class _AccountCreditEditItemState extends State<AccountCreditEditItem> {
  late StringField nameField = StringField(
    hint: Strings.label_title,
    initialValue: widget.accountBalanceToEdit?.account.name ?? "",
    onChanged: widget.onNameChanged,
  );

  late MoneyField moneyField = MoneyField(
    initialValue: widget.accountBalanceToEdit?.money,
    onChanged: widget.onMoneyChanged,
    hintText: Strings.hint_credit_balance,
  );

  late MoneyField limitField = MoneyField(
    initialValue: (widget.accountBalanceToEdit?.account as CreditCardAccount?)?.limit,
    onChanged: widget.onLimitChanged,
    hintText: Strings.hint_credit_limit,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.highlightColor,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: nameField,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 38,
                  child: moneyField,
                ),
                SizedBox(
                  height: 38,
                  child: limitField,
                ),
              ],
            ),
          ),
          const SizedBox(width: 4),
          // currencySelector,
        ],
      ),
    );
  }
}
