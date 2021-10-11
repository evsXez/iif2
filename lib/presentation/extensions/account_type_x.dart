import 'package:flutter/material.dart';
import 'package:iif/domain/entities/enums/account_type.dart';
import 'package:iif/misc/resources/strings.dart';

extension AccountTypeX on AccountType {
  String name(BuildContext context) {
    switch (this) {
      case AccountType.money:
        return Strings.type_all_money;
      case AccountType.creditCards:
        return Strings.type_credit_cards;
      case AccountType.myDebts:
        return Strings.type_my_debts;
      case AccountType.debtsToMe:
        return Strings.type_debts_to_me;
      case AccountType.investments:
        return Strings.type_investments;
    }
  }
}
