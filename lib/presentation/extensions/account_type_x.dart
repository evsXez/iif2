import 'package:iif/domain/entities/enums/account_type.dart';
import 'package:iif/misc/resources/strings.dart';

extension AccountTypeX on AccountType {
  String name() {
    switch (this) {
      case AccountType.money:
        return Strings.type_all_money;
      case AccountType.creditCards:
        return Strings.type_credit_cards;
      case AccountType.debtsAndLoans:
      case AccountType.debts:
        return Strings.type_my_debts;
      case AccountType.loans:
        return Strings.type_debts_to_me;
      case AccountType.investments:
        return Strings.type_investments;
    }
  }
}
