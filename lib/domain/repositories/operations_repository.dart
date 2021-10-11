import 'package:iif/domain/include.dart';

abstract class OperationsRepository {
  Future<Money> calculateMoney(Account account);
  void addOperationInitialInput(Account account, Money money);
  Future<List<Operation>> getOperations(Account account);
}
