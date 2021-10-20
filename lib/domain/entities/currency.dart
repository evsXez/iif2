import 'package:equatable/equatable.dart';

class Currency with EquatableMixin {
  final String code;
  final String symbol;

  const Currency({
    required this.code,
    required this.symbol,
  });

  static const debugDefault = Currency(code: "RUB", symbol: "₽");

  @override
  List<Object?> get props => [code, symbol];
}
