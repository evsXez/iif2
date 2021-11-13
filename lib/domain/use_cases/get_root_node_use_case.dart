import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/categories_repository.dart';

class GetRootNodeUseCase {
  final CategoriesRepository categoriesRepository;
  GetRootNodeUseCase({required this.categoriesRepository});

  Node<NodeValue> execute(Type type) {
    switch (type) {
      case Category:
        return categoriesRepository.getCategories();
    }

    throw UnimplementedError();
  }
}
