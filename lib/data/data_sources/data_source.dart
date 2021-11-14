import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';

abstract class DataSource {
  //accounts
  Account addAcount(Account accountTemplate);
  void updateAcount(Account account);
  void deleteAcount(Account account);
  List<AccountModel> getAcounts();

  //operations
  void addOperation(LogicOperation operation);
  List<LogicOperationModel> getOperations();

  //categories
  CategoryModel addCategory(Category categoryTemplate, Category parent);
  void updateCategory(Category category);
  List<CategoryModel> getCategories();
}
