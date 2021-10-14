import 'package:iif/domain/include.dart';

abstract class AccountsRepository {
  List<Account> getAccountsOfType(AccountType type);
  Account saveAccount(Account accountTemplate);
}
