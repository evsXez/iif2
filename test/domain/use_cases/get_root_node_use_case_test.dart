import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main() {
  late GetRootNodeUseCase getRootNodeUseCase;
  late MockCategoriesRepository mockCategoriesRepository;
  late MockSubjectsRepository mockSubjectsRepository;

  setUp(() {
    mockCategoriesRepository = MockCategoriesRepository();
    mockSubjectsRepository = MockSubjectsRepository();

    getRootNodeUseCase = GetRootNodeUseCase(
      categoriesRepository: mockCategoriesRepository,
      subjectsRepository: mockSubjectsRepository,
    );

    when(mockCategoriesRepository.getCategories()).thenReturn(Node.root(canHaveMoreChildren: false)
      ..children.addAll([
        Node(value: null, children: []),
        Node(value: null, children: []),
      ]));
  });

  test('get data from categories repository', () {
    final root = getRootNodeUseCase.execute(Category);

    expect(root.canHaveMoreChildren, false);
    expect(root.type, NodeType.root);
    expect(root.children.length, 2);
  });
}
