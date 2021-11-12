import 'package:equatable/equatable.dart';

class Node<T> with EquatableMixin {
  T value;
  final List<Node<T>> children;
  final bool canHaveMoreChildren;
  bool isSelected;
  bool isEditing;
  final bool isLocked;

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
}
