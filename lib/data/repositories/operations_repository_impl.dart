import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class OperationsRepositoryImpl extends OperationsRepository {
  final DataSource _dataSource;

  OperationsRepositoryImpl(this._dataSource);

  @override
  Future<Money> calculateBalance(Account account) async {
    int coinsResult = 0;
    _dataSource.getOperations().forEach((logic) {
      for (var atomic in logic.atomics) {
        if (atomic.account.id == account.id) {
          switch (atomic.type) {
            case AtomicOperationType.initialInput:
              coinsResult = atomic.money.coins;
              break;
            case AtomicOperationType.income:
              coinsResult += atomic.money.coins;
              break;
            case AtomicOperationType.expense:
              coinsResult -= atomic.money.coins;
              break;
          }
        }
      }
    });

    return Money(coins: coinsResult);
  }

  @override
  void addOperationInitialInput(Account account, Money money) {
    throw UnimplementedError();
  }

  @override
  Future<List<LogicOperation>> getOperations(Account account) {
    throw UnimplementedError();
  }
}
