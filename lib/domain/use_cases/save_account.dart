import 'package:iif/domain/entities/account.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class SaveAccountUseCase {
  final AccountsRepository accountsRepository;
  final OperationsRepository operationsRepository;
  SaveAccountUseCase({
    required this.accountsRepository,
    required this.operationsRepository,
  });

  void execute(Account account, Money money) {
    accountsRepository.saveAccount(account);
    operationsRepository.addOperationInitialInput(account, money);
  }
}
