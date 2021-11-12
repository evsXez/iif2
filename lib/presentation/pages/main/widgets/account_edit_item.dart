import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/blocs/accounts_panel_bloc/accounts_panel_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/node_selector.dart';
import 'package:iif/presentation/pages/main/widgets/small_button.dart';

class AccountEditItem extends StatefulWidget {
  final AccountBalance? accountBalanceToEdit;

  const AccountEditItem({
    required this.accountBalanceToEdit,
    Key? key,
  }) : super(key: key);

  @override
  State<AccountEditItem> createState() => _AccountEditItemState();
}

class _AccountEditItemState extends State<AccountEditItem> {
  late StringField nameField = StringField(
    hint: Strings.label_title,
    initialValue: widget.accountBalanceToEdit?.account.name ?? "",
    onChanged: _onChanged,
  );

  late MoneyField moneyField = MoneyField(
    initialValue: widget.accountBalanceToEdit?.money,
    onChanged: _onChanged,
  );

  bool _isInputCompletedAndSmthChanged = false;

  void _onChanged(_) {
    setState(() {
      _isInputCompletedAndSmthChanged = (nameField.isValueEntered && moneyField.isValueEntered) &&
          ((nameField.value != widget.accountBalanceToEdit?.account.name) ||
              (moneyField.value != widget.accountBalanceToEdit?.money));
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (false) {
    //   //TODO: refactor to object(debts for now) editor
    //   return BlocProvider<CategorySelectorBloc>(
    //     create: (context) => CategorySelectorBloc(context),
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Align(
    //         alignment: Alignment.centerLeft,
    //         child: CategorySelector(),
    //       ),
    //     ),
    //   );
    // }

    return Container(
      height: 86,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 38,
            color: Style.highlightColor,
            child: Row(
              children: <Widget>[
                const SizedBox(width: 8),
                Expanded(child: nameField),
                const SizedBox(width: 4),
                Expanded(child: moneyField),
                const SizedBox(width: 4),
                // currencySelector,
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _isInputCompletedAndSmthChanged
                ? SmallButton(
                    label: Strings.save,
                    onPressed: () => _onSave(context),
                  )
                : SmallButton(
                    label: Strings.cancel,
                    onPressed: () => _onCancel(context),
                  ),
          ),
        ],
      ),
    );
  }

  void _onSave(BuildContext context) {
    BlocProvider.of<AccountsPanelBloc>(context).saveAccount(
      accountToEdit: widget.accountBalanceToEdit?.account,
      name: nameField.value,
      money: moneyField.value,
    );
  }

  void _onCancel(BuildContext context) {
    BlocProvider.of<AccountsPanelBloc>(context).cancelEdit();
  }
}
