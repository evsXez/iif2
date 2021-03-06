import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';

class GetAccountsCountUseCase {
  final AccountsRepository accountsRepository;
  GetAccountsCountUseCase({required this.accountsRepository});

  int execute(List<AccountType> types) {
    int counter = 0;
    for (var type in types) {
      counter += accountsRepository.getAccountsOfType(type).length;
    }
    return counter;
  }
}
