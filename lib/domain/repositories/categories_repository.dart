import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

abstract class CategoriesRepository {
  Node<Category> getCategories();
  Category saveCategory(Category categoryTemplate, Category parent);
}
