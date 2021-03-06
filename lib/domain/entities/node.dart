import 'package:equatable/equatable.dart';
import 'package:iif/domain/entities/enums/node_type.dart';
import 'package:iif/domain/include.dart';

class Node<T> with EquatableMixin {
  T? value;
  final List<Node<T>> children;
  final bool canHaveMoreChildren;
  bool isSelected;
  bool isEditing;
  final bool isLocked;
  final NodeType type;

  Node({
    required this.value,
    required this.children,
    this.canHaveMoreChildren = true,
    this.isSelected = false,
    this.isEditing = false,
    this.isLocked = false,
    this.type = NodeType.value,
  });

  factory Node.composer() => Node(value: null, children: [], type: NodeType.composer);
  factory Node.root({required bool canHaveMoreChildren}) => Node(
        value: null,
        children: [],
        type: NodeType.root,
        canHaveMoreChildren: canHaveMoreChildren,
      );

  @override
  List<Object?> get props => [value, isSelected, isEditing];
}
