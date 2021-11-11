part of 'category_selector_bloc.dart';

@freezed
abstract class CategorySelectorState with _$CategorySelectorState {
  const factory CategorySelectorState.loading() = _Loading;
  const factory CategorySelectorState.loaded(List<CategoryNodeRef> categories) = _Loaded;
}

class CategoryNodeRef {
  final Node<Category> node;
  CategoryNodeRef(this.node);
}
