import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/editable_chip.dart';

class NodeChip extends StatelessWidget {
  final Node node;
  final VoidCallback onTap;
  final Function(String text) onSave;
  final VoidCallback onDelete;
  final VoidCallback onLongPress;
  const NodeChip({
    Key? key,
    required this.node,
    required this.onTap,
    required this.onSave,
    required this.onDelete,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (node.isEditing) {
      return EditableChip(
        initialText: node.type == NodeType.value ? node.value.name : null,
        doneEditing: (text) {
          if (text.isEmpty) {
            onDelete();
          } else {
            onSave(text);
          }
        },
      );
    }

    if (node.type != NodeType.value) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onLongPress: () {
        if (!node.isLocked) {
          onLongPress();
        } else {
          print("locked: $node");
        }
      },
      child: ChoiceChip(
        label: Text(
          node.value.name,
          style: TextStyle(
            color: node.isSelected ? Style.blackColor : Style.blackColor,
          ),
        ),
        selected: node.isSelected,
        backgroundColor: Style.grayColor.withAlpha(25),
        selectedColor: Style.highlightColor,
        shadowColor: Style.blackColor,
        onSelected: (_) => onTap(),
      ),
    );
  }
}
