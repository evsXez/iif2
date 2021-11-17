import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

abstract class AccountsRepository extends ChangeNotifier {
  List<Account> getAccountsOfType(AccountType type);
  Account getAccountForSubject(Subject subject);
  Account saveAccount(Account accountTemplate, {Subject? subject});
}
