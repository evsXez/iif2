import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/categories_repository.dart';
import 'package:iif/domain/repositories/subjects_repository.dart';

class GetRootNodeUseCase {
  final CategoriesRepository categoriesRepository;
  final SubjectsRepository subjectsRepository;
  GetRootNodeUseCase({
    required this.categoriesRepository,
    required this.subjectsRepository,
  });

  Node<NodeValue> execute(Type type, SubjectType? subjectType) {
    switch (type) {
      case Category:
        return categoriesRepository.getCategories();
      case Subject:
        return subjectsRepository.getSubjects(subjectType!);
    }

    throw UnimplementedError();
  }
}
