import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/account_edit_item.dart';
import 'package:iif/presentation/pages/main/widgets/account_plain_item.dart';

class AccountItem extends StatefulWidget {
  final MapEntry<Account, Money> accountWithMoney;
  final bool isEditing;

  const AccountItem({
    required this.accountWithMoney,
    required this.isEditing,
    Key? key,
  }) : super(key: key);

  @override
  State<AccountItem> createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> {
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
          ? AccountEditItem(
              // accountWithMoneyToEdit: widget.accountWithMoney,
              key: ObjectKey(widget.accountWithMoney.key),
            )
          : AccountPlainItem(
              account: widget.accountWithMoney.key,
              money: widget.accountWithMoney.value,
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
