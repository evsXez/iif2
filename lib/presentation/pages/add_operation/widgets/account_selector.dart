import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

class AccountSelector extends StatefulWidget {
  final Alignment alignment;
  final Account initialAccount;
  final List<AccountBalance> accountsBalance;
  final Function(Account) onAccountChanged;

  const AccountSelector({
    key,
    required this.alignment,
    required this.initialAccount,
    required this.onAccountChanged,
    required this.accountsBalance,
  }) : super(key: key);

  @override
  _AccountSelectorState createState() => _AccountSelectorState();
}

class _AccountSelectorState extends State<AccountSelector> {
  late AccountBalance selectedAccountBalance;

  @override
  void initState() {
    super.initState();
    selectedAccountBalance = widget.accountsBalance.firstWhere((it) => it.account == widget.initialAccount);
  }

  void update(AccountBalance? balance) {
    if (balance == null) {
      return;
    }
    selectedAccountBalance = balance;
    widget.onAccountChanged(balance.account);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     // color: StyleColors.red,
      //     // borderRadius: BorderRadius.all(Radius.circular(8)),
      //     // border: Border.all(color: StyleColors.accent, width: 2),
      //     ),
      // color: Colors.blue,
      // height: 40,
      child: DropdownButton<AccountBalance>(
        underline: SizedBox.shrink(),
        value: selectedAccountBalance,
        selectedItemBuilder: (context) => widget.accountsBalance.map((it) => selectedItem(it)).toList(),
        items: widget.accountsBalance.map((it) => item(it)).toList(),
        onChanged: (value) {
          setState(() {
            update(value);
          });
        },
        icon: SizedBox.shrink(),
        isExpanded: true,
        // selectedItemBuilder: (_) => [Row(
        //   children: [
        //     Expanded(child: Text("123", textAlign: TextAlign.left,)),
        //   ],
        // )],
      ),
    );
  }

  DropdownMenuItem<AccountBalance> item(AccountBalance balance) => DropdownMenuItem(
        value: balance,
        child: Padding(
          padding: const EdgeInsets.only(right: 0), //TODO: remove
          child: Align(
            alignment: widget.alignment,
            child: Text(
              balance.account.name,
              maxLines: 1,
            ),
          ),
        ),
      );

  DropdownMenuItem selectedItem(AccountBalance balance) => DropdownMenuItem(
      value: balance,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          // color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: widget.alignment,
                child: Text(
                  balance.account.name,
                  maxLines: 1,
                ),
              ),
              Align(
                alignment: widget.alignment,
                child: Text(
                  "${balance.money.toStringAsPrice(fractionalRequired: true)} ${balance.account.currency.symbol}",
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ));
}
