import 'package:iif/data/include/data_include.dart';

class FundsRepository {
  Future<Map<FundType, Money>> getFunds() async {
    await Future.delayed(const Duration(seconds: 1));
    return Map.fromIterables(FundType.values, FundType.values.map((e) => Money(1230 + e.index)));
  }
}
