class Money {
  final int coins;

  const Money(this.coins);
}

extension MoneyExtension on Money {
  // static const _badPartSeparator = ',';
  static const _okPartSeparator = '.';
  static const _groupsSeparator = ' ';

  String toStringAsPrice() {
    int part1 = (coins / 100.0).floor();
    int part2 = coins % 100;
    String p1 = "$part1";
    List<String> chars = List.generate(p1.length, (idx) => p1[idx]);
    if (p1.length > 9) {
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

    return chars.fold("", (s, tail) => "$s$tail") + _okPartSeparator + p2;
  }
}
