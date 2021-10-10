import 'package:iif/data/include/data_include.dart';
import 'package:iif/data/repositories/operations_repository.dart';

class FundsRepository {
  FundsRepository();

  final List<Fund> _data = [
    Fund(
      name: "My old location",
      type: FundType.money,
      currency: const Currency(
        code: "USD",
        symbol: "\$",
      ),
    ),
    Fund(
      name: "Cashhhh...",
      type: FundType.money,
      currency: const Currency(
        code: "USD",
        symbol: "\$",
      ),
    ),
  ];

  Future<List<Fund>> getFundsOfType(FundType type) async {
    // await Future.delayed(const Duration(seconds: 1));
    return _data.where((it) => it.type == type).toList();
  }

  Future<Fund> saveFund(Fund? fundToEdit, String name, FundType type) async {
    final result = Fund(
      name: name,
      type: type,
      currency: const Currency(
        code: "USD",
        symbol: "\$",
      ),
    );
    _data.add(result);

    return result;
  }

  Future<Map<FundType, Money>> getMoneyForFundTypes() async {
    void addMoney(Map<FundType, Money> data, FundType type, Money money) {
      Money accumulator = data[type] ?? Money.zero;
      data[type] = accumulator.add(money);
    }

    final Map<FundType, Money> result = {};
    final funds = _data;
    final operationsRepository = OperationsRepository();

    Future.forEach<Fund>(funds, (fund) async {
      addMoney(result, fund.type, await operationsRepository.calculateMoney(fund));
    });

    return result;
  }
}
