import 'package:iif/domain/include.dart';

abstract class OperationsRepository {
  Future<Money> calculateMoney(Fund fund);
  void addOperationInitialInput(Fund fund, Money money);
  Future<List<Operation>> getOperations(Fund fund);
}
