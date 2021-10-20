import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';

class AccountSelector extends StatelessWidget {
  final Alignment alignment;

  Account get value => Account(id: -1, name: "name", type: AccountType.money, currency: Currency.debugDefault);

  const AccountSelector({
    Key? key,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
