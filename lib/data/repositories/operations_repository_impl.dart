import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class OperationsRepositoryImpl extends OperationsRepository {
  @override
  Future<Money> calculateBalance(Account account) async {
    return Money(100 + account.name.length);
  }

  @override
  void addOperationInitialInput(Account account, Money money) {
    //TODO
  }

  @override
  Future<List<Operation>> getOperations(Account account) {
    // TODO: implement getOperations
    throw UnimplementedError();
  }
}
