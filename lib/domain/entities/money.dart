import 'package:equatable/equatable.dart';

class Money with EquatableMixin {
  final int coins;

  const Money(this.coins);

  static const Money zero = Money(0);

  Money add(Money operand) => Money(coins + operand.coins);

  @override
  List<Object?> get props => [coins];
}
