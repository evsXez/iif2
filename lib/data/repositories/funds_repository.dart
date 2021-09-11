import 'package:iif/data/include/data_include.dart';

class FundsRepository {
  const FundsRepository();

  Future<Map<FundType, Money>> getFunds() async {
    await Future.delayed(const Duration(seconds: 1));
    return Map.fromIterables(FundType.values, FundType.values.map((e) => Money(1230 + e.index)));
  }

  Future<List<Fund>> getFundsOfType(FundType type) async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Fund(
        name: "My old location",
        type: FundType.money,
        currency: const Currency(
          code: "USD",
          symbol: "\$",
        ),
      ),
      Fund(
        name: "Cachhh",
        type: FundType.money,
        currency: const Currency(
          code: "USD",
          symbol: "\$",
        ),
      )
    ];
  }
}
