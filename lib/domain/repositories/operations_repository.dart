import 'package:iif/domain/include.dart';

abstract class OperationsRepository {
  Future<Money> calculateMoney(Fund fund);
  initialInput(Fund fund, Money money);
}
