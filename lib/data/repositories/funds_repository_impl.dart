import 'package:iif/domain/include.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/domain/repositories/funds_repository.dart';

class FundsRepositoryImpl extends FundsRepository {
  final List<Fund> _data = [
    // Fund(
    //   name: "My old location",
    //   type: FundType.money,
    //   currency: const Currency(
    //     code: "USD",
    //     symbol: "\$",
    //   ),
    // ),
    // Fund(
    //   name: "Cashhhh...",
    //   type: FundType.money,
    //   currency: const Currency(
    //     code: "USD",
    //     symbol: "\$",
    //   ),
    // ),
  ];

  @override
  List<Fund> getFundsOfType(FundType type) {
    // await Future.delayed(const Duration(seconds: 1));
    return _data.where((it) => it.type == type).toList();
  }

  @override
  void saveFund(Fund fund) {
    _data.add(fund);
  }

  @override
  Future<Map<FundType, Money>> getMoneyForFundTypes() async {
    void addMoney(Map<FundType, Money> data, FundType type, Money money) {
      Money accumulator = data[type] ?? Money.zero;
      data[type] = accumulator.add(money);
    }

    final Map<FundType, Money> result = {};
    final funds = _data;
    final operationsRepository = OperationsRepositoryImpl();

    Future.forEach<Fund>(funds, (fund) async {
      addMoney(result, fund.type, await operationsRepository.calculateMoney(fund));
    });

    return result;
  }
}
