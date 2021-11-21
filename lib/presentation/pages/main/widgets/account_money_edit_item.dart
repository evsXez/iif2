import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/style.dart';

class AccountMoneyEditItem extends StatefulWidget {
  final AccountBalance? accountBalanceToEdit;
  final Function(String) onNameChanged;
  final Function(String) onMoneyChanged;
  const AccountMoneyEditItem({
    Key? key,
    required this.accountBalanceToEdit,
    required this.onNameChanged,
    required this.onMoneyChanged,
  }) : super(key: key);

  @override
  _AccountMoneyEditItemState createState() => _AccountMoneyEditItemState();
}

class _AccountMoneyEditItemState extends State<AccountMoneyEditItem> {
  late StringField nameField = StringField(
    hint: Strings.label_title,
    initialValue: widget.accountBalanceToEdit?.account.name ?? "",
    onChanged: widget.onNameChanged,
  );

  late MoneyField moneyField = MoneyField(
    initialValue: widget.accountBalanceToEdit?.money,
    onChanged: widget.onMoneyChanged,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
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
            child: moneyField,
          ),
          const SizedBox(width: 4),
          // currencySelector,
        ],
      ),
    );
  }
}
