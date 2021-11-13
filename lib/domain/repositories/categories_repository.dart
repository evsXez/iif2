import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

abstract class CategoriesRepository {
  List<Category> getCategoriesOfType(CategoryType type);
  Category saveCategory(Category categoryTemplate, Category parent);
}
