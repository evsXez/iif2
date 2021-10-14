import 'package:equatable/equatable.dart';

class Money with EquatableMixin {
  final int coins;

  const Money({required this.coins});

  static const Money zero = Money(coins: 0);

  Money add(Money operand) => Money(coins: coins + operand.coins);

  @override
  List<Object?> get props => [coins];
}
