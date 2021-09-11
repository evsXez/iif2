import 'package:iif/data/include/data_include.dart';
import 'package:iif/ui/include/ui_include.dart';
import 'package:iif/ui/pages/main/widgets/fund_item_add_edit.dart';
import 'package:iif/ui/pages/main/widgets/fund_item_plain.dart';

class FundItem extends StatelessWidget {
  final Fund fund;
  final bool isEditing;
  final bool isHighlighted;
  final bool isArchiveAvailable = true; //fund.hasNoMoney();
  final bool isDeleteAvailable = true; //fund.hasNoOperationsExceptInitialInput();

  const FundItem({
    required this.fund,
    required this.isEditing,
    required this.isHighlighted,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _showContextMenu(context, details.globalPosition.dx, details.globalPosition.dy);
      },
      child: isEditing
          ? FundItemAddEdit(
              fund: fund,
              key: ObjectKey(fund),
              onEditDone: _onEditDone,
            )
          : FundItemPlain(
              fund: fund,
              money: money,
              isHighlighed: isHighlighted,
            ),
    );
  }

  void _showContextMenu(BuildContext context, double x, double y) async {
    final List<PopupMenuEntry> items = [
      MenuItem(Strings.option_edit, () {
        _actionEdit();
      }),
      MenuItem(Strings.option_archive, () {
        _actionArchive(isArchiveAvailable);
      }, color: _colorOption(isArchiveAvailable)),
      MenuItem(Strings.option_delete, () {
        _actionDelete(isDeleteAvailable);
      }, color: _colorOption(isDeleteAvailable)),
    ];
    showMenu(context: context, position: RelativeRect.fromLTRB(x, y, x, y), items: items).then((value) {
      // setState(() {
      //   highlightedLocationId = null;
      // });
    });
    // setState(() {
    //   highlightedLocationId = fund.id;
    // });
  }

  void _actionEdit() {
    // setState(() {
    //   editLocationId = location.id;
    // });
  }

  void _actionArchive(bool isArchiveAvailable) {
    // Dialogs(context).showArchiveLocationDialog(location, isArchiveAvailable);
  }

  void _actionDelete(bool isDeleteAvailable) {
    // Dialogs(context).showDeleteLocationDialog(location, isDeleteAvailable);
  }

  void _onEditDone() {
    // setState(() {
    //   editLocationId = null;
    // });
  }

  Color _colorOption(bool isAvailable) => isAvailable ? Style.blackColor : Style.lightGrayColor;
}
