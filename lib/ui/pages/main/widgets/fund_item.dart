import 'package:iif/data/models/fund_with_money.dart';
import 'package:iif/ui/include.dart';
import 'package:iif/ui/pages/main/widgets/fund_edit_item.dart';
import 'package:iif/ui/pages/main/widgets/fund_plain_item.dart';

class FundItem extends StatefulWidget {
  final FundWithMoney fundWithMoney;
  final bool isEditing;

  const FundItem({
    required this.fundWithMoney,
    required this.isEditing,
    Key? key,
  }) : super(key: key);

  @override
  State<FundItem> createState() => _FundItemState();
}

class _FundItemState extends State<FundItem> {
  final bool isArchiveAvailable = true;
  final bool isDeleteAvailable = true;
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _showContextMenu(context, details.globalPosition.dx, details.globalPosition.dy);
      },
      child: widget.isEditing
          ? FundEditItem(
              fundWithMoneyToEdit: widget.fundWithMoney,
              key: ObjectKey(widget.fundWithMoney.fund),
            )
          : FundPlainItem(
              fund: widget.fundWithMoney.fund,
              money: widget.fundWithMoney.money,
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
      setState(() {
        isHighlighted = false;
      });
    });
    setState(() {
      isHighlighted = true;
    });
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
