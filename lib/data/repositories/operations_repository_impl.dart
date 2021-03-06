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
  void addOperationInitialInput(
    Account account,
    Money money,
  ) {
    try {
      _dataSource.addOperation(
        LogicOperation.initialInput(
          account: account,
          money: money,
        ),
      );
    } finally {
      notifyListeners();
    }
  }

  @override
  Future<List<LogicOperation>> getOperations(Account account) async {
    return _dataSource
        .getOperations()
        .where((it) => it.atomics.any((atomic) => atomic.account.id == account.id))
        .toList();
  }

  @override
  Future<List<LogicOperation>> getAllOperations() async {
    return _dataSource.getOperations();
  }

  @override
  void addOperationExpense(
    Account account,
    Money money, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  }) {
    try {
      _dataSource.addOperation(
        LogicOperation.expense(
          account,
          money,
          comment: comment,
          categoriesStamp: categoriesStamp,
          subjectsStamp: subjectsStamp,
        ),
      );
    } finally {
      notifyListeners();
    }
  }

  @override
  void addOperationIncome(
    Account account,
    Money money, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  }) {
    try {
      _dataSource.addOperation(
        LogicOperation.income(
          account,
          money,
          comment: comment,
          categoriesStamp: categoriesStamp,
          subjectsStamp: subjectsStamp,
        ),
      );
    } finally {
      notifyListeners();
    }
  }

  @override
  void addOperationTransfer(
    Account accountFrom,
    Account accountTo,
    Money money, {
    String? comment,
    String? categoriesStamp,
  }) {
    try {
      _dataSource.addOperation(
        LogicOperation.transfer(
          accountFrom,
          accountTo,
          money,
          comment: comment,
          categoriesStamp: categoriesStamp,
        ),
      );
    } finally {
      notifyListeners();
    }
  }

  @override
  void addOperationDebtIncrease(
    Account account,
    Money money,
    Account debtAccount, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  }) {
    try {
      _dataSource.addOperation(
        LogicOperation.debtIncrease(
          account,
          money,
          debtAccount,
          comment: comment,
          categoriesStamp: categoriesStamp,
          subjectsStamp: subjectsStamp,
        ),
      );
    } finally {
      notifyListeners();
    }
  }

  @override
  void addOperationDebtDecrease(
    Account account,
    Money money,
    Account debtAccount, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  }) {
    try {
      _dataSource.addOperation(
        LogicOperation.debtDecrease(
          account,
          money,
          debtAccount,
          comment: comment,
          categoriesStamp: categoriesStamp,
          subjectsStamp: subjectsStamp,
        ),
      );
    } finally {
      notifyListeners();
    }
  }

  @override
  void addOperationLoanDecrease(
    Account account,
    Money money,
    Account debtAccount, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  }) {
    try {
      _dataSource.addOperation(
        LogicOperation.loanDecrease(
          account,
          money,
          debtAccount,
          comment: comment,
          categoriesStamp: categoriesStamp,
          subjectsStamp: subjectsStamp,
        ),
      );
    } finally {
      notifyListeners();
    }
  }

  @override
  void addOperationLoanIncrease(
    Account account,
    Money money,
    Account debtAccount, {
    String? comment,
    String? categoriesStamp,
    String? subjectsStamp,
  }) {
    try {
      _dataSource.addOperation(
        LogicOperation.loanIncrease(
          account,
          money,
          debtAccount,
          comment: comment,
          categoriesStamp: categoriesStamp,
          subjectsStamp: subjectsStamp,
        ),
      );
    } finally {
      notifyListeners();
    }
  }
}
