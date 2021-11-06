import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class CategoryNode with EquatableMixin {
  Category category;
  final List<CategoryNode> children;
  final bool canHaveMoreChildren;
  bool isSelected;
  bool isEditing;
  final bool isLocked;

  ///disabled for editing, unable to remove

  CategoryNode({
    required this.category,
    required this.children,
    this.canHaveMoreChildren = true,
    this.isSelected = false,
    this.isEditing = false,
    this.isLocked = false,
  });

  @override
  List<Object?> get props => [category, isSelected, isEditing];

  factory CategoryNode.clone(CategoryNode of) => CategoryNode(
        category: Category(of.category.name),
        children: of.children.map((it) => CategoryNode.clone(it)).toList(),
        canHaveMoreChildren: of.canHaveMoreChildren,
        isSelected: of.isSelected,
        isEditing: of.isEditing,
      );
}
