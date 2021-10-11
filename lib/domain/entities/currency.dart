class Currency {
  final String code;
  final String symbol;

  const Currency({
    required this.code,
    required this.symbol,
  });

  static const debugDefault = Currency(code: "USD", symbol: "\$");
}
