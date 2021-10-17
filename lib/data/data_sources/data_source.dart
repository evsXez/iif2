import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';

abstract class DataSource {
  //accounts
  Account addAcount(Account accountTemplate);
  void updateAcount(Account account);
  List<AccountModel> getAcounts();

  //operations
  void addOperation(LogicOperation operation);
  List<LogicOperationModel> getOperations();
}
