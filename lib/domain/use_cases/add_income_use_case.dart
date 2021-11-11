import 'package:iif/domain/entities/account.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class AddIncomeUseCase {
  final OperationsRepository operationsRepository;
  AddIncomeUseCase({
    required this.operationsRepository,
  });

  void execute(Account account, Money money) {
    operationsRepository.addOperationIncome(account, money);
  }
}
