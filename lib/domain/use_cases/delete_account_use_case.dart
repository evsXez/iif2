import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';

class DeleteAccountUseCase {
  final AccountsRepository accountsRepository;

  DeleteAccountUseCase({required this.accountsRepository});

  void execute(Account account) {
    //TODO: generate 'copyWith'
    final Account accountToDelete = Account(
      id: account.id,
      name: account.name,
      type: account.type,
      currency: account.currency,
      isArchived: account.isArchived,
      isDeleted: true,
    );
    accountsRepository.saveAccount(accountToDelete);
  }
}
