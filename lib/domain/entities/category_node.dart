import 'package:equatable/equatable.dart';

class Node<T> with EquatableMixin {
  T value;
  final List<Node<T>> children;
  final bool canHaveMoreChildren;
  bool isSelected;
  bool isEditing;
  final bool isLocked;

  ///disabled for editing, unable to remove

  Node({
    required this.value,
    required this.children,
    this.canHaveMoreChildren = true,
    this.isSelected = false,
    this.isEditing = false,
    this.isLocked = false,
  });

  @override
  List<Object?> get props => [value, isSelected, isEditing];

  // factory Node.clone(Node of, T value) => Node(
  //       value: value, // Category(of.value.name)
  //       children: of.children.map((it) => Node.clone(it)).toList(),
  //       canHaveMoreChildren: of.canHaveMoreChildren,
  //       isSelected: of.isSelected,
  //       isEditing: of.isEditing,
  //     );
}
