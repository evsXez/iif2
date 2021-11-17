import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/categories_repository.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final DataSource _dataSource;

  CategoriesRepositoryImpl(this._dataSource);

  Node<Category> _withChildren(List<CategoryModel> list, Node<Category> parent) {
    final nodes = list.where((model) => model.id != model.parentId && model.parentId == parent.value?.id).map(
          (it) => _withChildren(
            list,
            Node<Category>(value: it, children: []),
          ),
        );
    if (nodes.isNotEmpty) {
      parent.children.addAll(nodes);
    }
    return parent;
  }

  @override
  Node<Category> getCategories() {
    final List<CategoryModel> list = _dataSource.getCategories();

    final rootModel = list.firstWhere((it) => it.id == it.parentId);
    final result = _withChildren(
      list,
      Node<Category>(
        value: rootModel,
        children: [],
        type: NodeType.root,
        canHaveMoreChildren: false,
      ),
    );

    return result;
  }

  @override
  Category saveCategory(Category categoryTemplate, Category parent) {
    if (categoryTemplate.id >= 0) {
      final categories = _dataSource.getCategories();
      if (categories.any((it) => it.id == categoryTemplate.id)) {
        _dataSource.updateCategory(categoryTemplate);
        return categoryTemplate;
      }
    }

    return _dataSource.addCategory(categoryTemplate, parent);
  }
}
