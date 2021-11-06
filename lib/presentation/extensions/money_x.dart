import 'package:iif/domain/entities/money.dart';

const _badPartSeparator = ',';
const _okPartSeparator = '.';
const _groupsSeparator = ' ';

extension MoneyX on Money {
  String toStringAsPrice({bool fractionalRequired = false}) {
    int part1 = (coins / 100.0).floor();
    int part2 = coins % 100;
    String p1 = "$part1";
    List<String> chars = List.generate(p1.length, (idx) => p1[idx]);
    if (p1.length > 12) {
      chars.insert(p1.length - 3, _groupsSeparator);
      chars.insert(p1.length - 6, _groupsSeparator);
      chars.insert(p1.length - 9, _groupsSeparator);
      chars.insert(p1.length - 12, _groupsSeparator);
    } else if (p1.length > 9) {
      chars.insert(p1.length - 3, _groupsSeparator);
      chars.insert(p1.length - 6, _groupsSeparator);
      chars.insert(p1.length - 9, _groupsSeparator);
    } else if (p1.length > 6) {
      chars.insert(p1.length - 3, _groupsSeparator);
      chars.insert(p1.length - 6, _groupsSeparator);
    } else if (p1.length > 3) {
      chars.insert(p1.length - 3, _groupsSeparator);
    }

    String p2 = "$part2";
    if (p2.length < 2) p2 = "0$p2";

    return chars.fold("", (s, tail) => "$s$tail") + (fractionalRequired ? _okPartSeparator + p2 : "");
  }

  static Money fromString(String _s) {
    String s = _s.replaceAll(" ", "");
    String withCoins = s;
    withCoins = withCoins.replaceAll(_badPartSeparator, _okPartSeparator);

    double? value = double.tryParse(withCoins);
    if (value == null) throw ExceptionMoneyNotParsed();

    return Money(coins: (value * 100).floor());
  }
}

class ExceptionMoneyNotParsed {}
