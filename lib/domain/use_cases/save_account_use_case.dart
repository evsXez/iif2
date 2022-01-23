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

  void execute({
    required Account accountTemplate,
    required Money money,
    required Subject? debtSubject,
    required Money? creditLimit,
  }) {
    final Account account;
    if (debtSubject != null) {
      account = accountsRepository.getAccountForSubjectAndType(debtSubject, accountTemplate.type);
    } else {
      account = accountsRepository.saveAccount(accountTemplate, creditLimit: creditLimit);
    }
    operationsRepository.addOperationInitialInput(account, money);
  }
}
