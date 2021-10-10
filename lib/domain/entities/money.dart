class Money {
  final int coins;

  const Money(this.coins);

  static const Money zero = Money(0);

  Money add(Money operand) => Money(coins + operand.coins);
}
