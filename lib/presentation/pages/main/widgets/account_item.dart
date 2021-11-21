export 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/account_edit_item.dart';
import 'package:iif/presentation/pages/main/widgets/account_plain_item.dart';

class AccountItem extends StatefulWidget {
  final AccountBalance accountBalance;
  final bool isEditing;
  const AccountItem({
    required this.accountBalance,
    required this.isEditing,
    Key? key,
  }) : super(key: key);

  @override
  State<AccountItem> createState() => _AccountItemState();
}

class _AccountItemState extends State<AccountItem> {
  bool isHighlighted = false;
  LongPressStartDetails? details;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountOptionsBloc(context),
      child: BlocConsumer<AccountOptionsBloc, AccountOptionsState>(
        listener: (context, state) {
          state.maybeMap(
            options: (state) {
              final options = state.options;
              if (options != null) {
                _showContextMenu(context, options, details?.globalPosition.dx ?? 0, details?.globalPosition.dy ?? 0);
              }
            },
            orElse: () {},
          );
        },
        builder: (context, state) => GestureDetector(
          onLongPressStart: (details) {
            this.details = details;
            BlocProvider.of<AccountOptionsBloc>(context).showMenu(widget.accountBalance);
          },
          child: widget.isEditing
              ? AccountEditItem(
                  accountType: widget.accountBalance.account.type,
                  accountBalanceToEdit: widget.accountBalance,
                  key: ObjectKey(widget.accountBalance.account),
                )
              : AccountPlainItem(
                  account: widget.accountBalance.account,
                  money: widget.accountBalance.money,
                  isHighlighed: isHighlighted,
                ),
        ),
      ),
    );
  }

  void _showContextMenu(BuildContext context, AccountOptions options, double x, double y) async {
    final List<PopupMenuEntry> items = [
      MenuItem(Strings.option_edit, () {
        BlocProvider.of<AccountsPanelBloc>(context).editAccount(widget.accountBalance.account);
      }),
      MenuItem(Strings.option_archive, () {
        Dialogs(context).showArchiveLocationDialog(
          accountName: widget.accountBalance.account.name,
          isArchiveAvailable: options.isArchiveAvailable,
          onArchivePressed: () {
            BlocProvider.of<AccountOptionsBloc>(context).archive(widget.accountBalance.account);
          },
        );
      }, color: _colorOption(options.isArchiveAvailable)),
      MenuItem(Strings.option_delete, () {
        Dialogs(context).showDeleteLocationDialog(
          account: widget.accountBalance.account,
          isDeleteAvailable: options.isDeleteAvailable,
          onDeletePressed: () {
            BlocProvider.of<AccountOptionsBloc>(context).delete(widget.accountBalance.account);
          },
        );
      }, color: _colorOption(options.isDeleteAvailable)),
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

  Color _colorOption(bool isAvailable) => isAvailable ? Style.blackColor : Style.lightGrayColor;
}
