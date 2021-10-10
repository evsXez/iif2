import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class OperationsRepositoryImpl extends OperationsRepository {
  @override
  Future<Money> calculateMoney(Fund fund) async {
    return Money(100 + fund.name.length);
  }

  @override
  void initialInput(Fund fund, Money money) {
    //TODO
  }
}
