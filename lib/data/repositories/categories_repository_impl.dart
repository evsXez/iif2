import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final DataSource _dataSource;

  CategoriesRepositoryImpl(this._dataSource);

  @override
  List<Category> getCategoriesOfType(CategoryType type) {
    throw UnimplementedError();
  }

  @override
  Category saveCategory(Category categoryTemplate, Category parent) {
    throw UnimplementedError();
  }
}
