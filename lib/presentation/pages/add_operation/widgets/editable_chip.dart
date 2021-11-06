import 'package:iif/presentation/include.dart';

class EditableChip extends StatefulWidget {
  final Function(String text) doneEditing;
  final String? initialText;

  const EditableChip({
    key,
    required this.doneEditing,
    this.initialText,
  }) : super(key: key);

  @override
  _EditableChipState createState() => _EditableChipState();
}

class _EditableChipState extends State<EditableChip> {
  bool get isDoneIcon => controller.text.isNotEmpty;
  final controller = TextEditingController();

  @override
  void initState() {
    controller.addListener(() {
      setState(() {});
    });
    super.initState();

    controller.text = widget.initialText ?? "";
  }

  final backgroundColor = Style.highlightColor;
  final textColor = Style.blackColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        width: 150,
        child: Chip(
          label: TextField(
            maxLength: 30,
            //focusNode: focus,
            // enabled: !isDeleteModeOnly,
            decoration: null,
            scrollPadding: EdgeInsets.zero,
            autofocus: true,
            controller: controller,
            cursorColor: textColor,
            style: TextStyle(color: textColor, fontSize: 14),
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.top,
            onSubmitted: (s) {
              widget.doneEditing(s);
            },
          ),
          backgroundColor: backgroundColor,
          onDeleted: () {
            // widget.doneEditing(isDeleteModeOnly ? "" : controller.text);
            widget.doneEditing(controller.text);
          },
          deleteButtonTooltipMessage: isDoneIcon ? "Done" : "Delete",
          deleteIcon: CircleAvatar(
            backgroundColor: Colors.white.withAlpha(80),
            child: isDoneIcon
                ? Icon(
                    Icons.done,
                    color: textColor,
                    size: 16,
                  )
                : Icon(
                    Icons.clear,
                    color: textColor,
                    size: 16,
                  ),
          ),
        ),
      ),
    );
  }
}
