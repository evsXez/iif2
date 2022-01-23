import 'package:flutter/foundation.dart';
import 'package:iif/domain/include.dart';

abstract class AccountsRepository extends ChangeNotifier {
  List<Account> getAccountsOfType(AccountType type);
  Account getAccountForSubjectAndType(Subject subject, AccountType type);
  Account saveAccount(
    Account accountTemplate, {
    Subject? subject,
    Money? creditLimit,
  });
}
