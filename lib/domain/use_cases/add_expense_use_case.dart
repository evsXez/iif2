import 'package:iif/domain/entities/account.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class AddExpenseUseCase {
  final OperationsRepository operationsRepository;
  AddExpenseUseCase({
    required this.operationsRepository,
  });

  void execute(Account account, Money money) {
    operationsRepository.addOperationExpense(account, money);
  }
}
