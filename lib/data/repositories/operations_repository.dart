import 'package:iif/data/include.dart';

class OperationsRepository {
  Future<Money> calculateMoney(Fund fund) async {
    return Money(100 + fund.name.length);
  }

  void initialInput(Fund fund, Money money) {
    //TODO
  }
}
