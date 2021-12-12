import 'package:iif/domain/include.dart';

abstract class CategoriesRepository {
  Node<Category> getCategories();
  Category saveCategory(Category categoryTemplate, Category parent);
}
