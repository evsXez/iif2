import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';

abstract class DataSource {
  //accounts
  Account addAcount(Account accountTemplate, Subject? subject);
  void updateAcount(Account account, Subject? subject);
  void deleteAcount(Account account);
  List<AccountModel> getAccounts();

  //operations
  void addOperation(LogicOperation operation);
  List<LogicOperationModel> getOperations();

  //categories
  CategoryModel addCategory(Category template, Category parent);
  void updateCategory(Category category);
  List<CategoryModel> getCategories();

  //subjects
  SubjectModel addSubject(Subject template, Subject parent);
  void updateSubject(Subject subject);
  List<SubjectModel> getSubjects();
}
