import 'package:iif/ui/include/ui_include.dart';

enum FundType {
  money,
  creditCards,
  myDebts,
  debtsToMe,
  investments,
}

extension FundTypeExt on FundType {
  String name(BuildContext context) {
    switch (this) {
      case FundType.money:
        return Strings.type_all_money;
      case FundType.creditCards:
        return Strings.type_credit_cards;
      case FundType.myDebts:
        return Strings.type_my_debts;
      case FundType.debtsToMe:
        return Strings.type_debts_to_me;
      case FundType.investments:
        return Strings.type_investments;
    }
  }
}
