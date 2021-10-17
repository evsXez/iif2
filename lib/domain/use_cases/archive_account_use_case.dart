import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';

class ArchiveAccountUseCase {
  final AccountsRepository accountsRepository;

  ArchiveAccountUseCase({required this.accountsRepository});

  Account execute(Account account) {
    final result = Account(
      id: account.id,
      name: account.name,
      type: account.type,
      currency: account.currency,
      isArchived: true,
    );

    accountsRepository.saveAccount(result);

    return result;
  }
}
