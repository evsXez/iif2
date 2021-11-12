import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/editable_chip.dart';
import 'package:iif/presentation/pages/add_operation/widgets/node_selector.dart';

class NodeChip extends StatelessWidget {
  final Node node;
  final VoidCallback onTap;
  final Function(String text) onSave;
  final VoidCallback onDelete;
  final VoidCallback onLongPress;
  final StyleNodeColorSheme colorScheme;
  const NodeChip({
    Key? key,
    required this.node,
    required this.onTap,
    required this.onSave,
    required this.onDelete,
    required this.onLongPress,
    required this.colorScheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (node.isEditing) {
      return EditableChip(
        initialText: node.type == NodeType.value ? node.value.name : null,
        colorScheme: colorScheme,
        doneEditing: (text) {
          if (text.isEmpty) {
            onDelete();
          } else {
            onSave(text);
          }
        },
      );
    }

    // if (node.type == NodeType.root) {
    //   return const SizedBox.shrink();
    // }

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
          node.type == NodeType.value
              ? node.value.name
              : node.type == NodeType.composer
                  ? "+"
                  : "",
          style: TextStyle(
            color: node.isSelected ? colorScheme.selectedTextColor : colorScheme.textColor,
          ),
        ),
        selected: node.isSelected,
        backgroundColor: colorScheme.backgroundColor,
        selectedColor: colorScheme.selectedBackgroundColor,
        // shadowColor: Style.blackColor,
        onSelected: (_) => onTap(),
      ),
    );
  }
}
