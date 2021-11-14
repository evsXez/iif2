import 'package:flutter_test/flutter_test.dart';
import 'package:iif/data/include.dart';
import 'package:iif/data/repositories/categories_repository_impl.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/categories_repository.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main() {
  late CategoriesRepository categoriesRepository;
  late MockDataSource mockDataSource;
  late List<CategoryModel> categoryModelsList;

  late CategoryModel model0;
  late CategoryModel model3;

  CategoryModel modelOf(int id, int parentId) =>
      CategoryModel(parentId: parentId, id: id, name: "modelOf", type: CategoryType.undefined);

  setUp(() {
    mockDataSource = MockDataSource();
    categoriesRepository = CategoriesRepositoryImpl(mockDataSource);

    categoryModelsList = [
      model0 = modelOf(0, 0),
      modelOf(1, 0),
      modelOf(2, 0),
      model3 = modelOf(3, 0),
      modelOf(4, 0),
      modelOf(5, 4),
      modelOf(6, 4),
      modelOf(7, 4),
      modelOf(8, 4),
      modelOf(9, 1),
      modelOf(10, 9),
      modelOf(11, 2),
      modelOf(12, 2),
      modelOf(13, 2),
    ];

    when(mockDataSource.getCategories()).thenAnswer((_) => categoryModelsList);
    when(mockDataSource.addCategory(any, any)).thenAnswer((realInvocation) {
      final Category categoryToAdd = realInvocation.positionalArguments[0];
      final Category categoryParent = realInvocation.positionalArguments[1];

      final result = CategoryModel(
        id: categoryToAdd.id,
        name: categoryToAdd.name,
        type: categoryToAdd.type,
        parentId: categoryParent.id,
      );
      categoryModelsList.add(result);

      return result;
    });
    when(mockDataSource.updateCategory(any)).thenAnswer((realInvocation) {
      final Category category = realInvocation.positionalArguments[0];

      final model = categoryModelsList.firstWhere((it) => it.id == category.id);
      final result = CategoryModel(
        id: category.id,
        name: category.name,
        type: category.type,
        parentId: model.parentId,
      );
      categoryModelsList.remove(model);
      categoryModelsList.add(result);
    });
  });

  test('get categories initially returns predefined data', () {
    final root = categoriesRepository.getCategories();

    expect(root.type, NodeType.root);
    expect(root.canHaveMoreChildren, false);
    expect(root.children.length, 4);
  });

  test('save new category', () {
    final name = "new category name";
    final type = CategoryType.debtDecrease;
    categoriesRepository.saveCategory(Category.template(name: name, type: type), model3);
    final root = categoriesRepository.getCategories();

    final node3 = root.children.firstWhere((it) => it.value == model3);
    expect(node3.children.length, 1);
    final saved = node3.children.first;
    expect(saved.canHaveMoreChildren, true);
    expect(saved.children, isEmpty);
    expect(saved.type, NodeType.value);
    expect(saved.value?.name, name);
    expect(saved.value?.type, type);
  });

  test('update category', () {
    final name = "updated category name";
    final type = CategoryType.debtDecrease;
    final idToUpdate = 1;
    categoriesRepository.saveCategory(Category(idToUpdate, name, type), model0);
    final root = categoriesRepository.getCategories();

    final node1 = root.children.firstWhere((it) => it.value?.id == idToUpdate);
    expect(node1.value?.name, name);
    expect(node1.value?.type, type);
  });
}
