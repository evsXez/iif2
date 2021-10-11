import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/presentation/blocs/accounts_panel_bloc/accounts_panel_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/small_button.dart';

class AccountEditItem extends StatefulWidget {
  // final AccountWithMoney? accountWithMoneyToEdit;

  const AccountEditItem({
    // required this.accountWithMoneyToEdit,
    Key? key,
  }) : super(key: key);

  @override
  State<AccountEditItem> createState() => _AccountEditItemState();
}

class _AccountEditItemState extends State<AccountEditItem> {
  late StringField nameField = StringField(
    hint: Strings.label_title,
    initialValue: "", //widget.accountWithMoneyToEdit?.account.name ?? "",
    onChanged: _onChanged,
  );

  late MoneyField moneyField = MoneyField(
    initialValue: null, //widget.accountWithMoneyToEdit?.money,
    onChanged: _onChanged,
  );

  bool _isInputCompletedAndSmthChanged = false;

  void _onChanged(_) {
    setState(() {
      _isInputCompletedAndSmthChanged = (nameField.isValueEntered && moneyField.isValueEntered);
      // && ((nameField.value != widget.accountWithMoneyToEdit?.account.name) ||
      //     (moneyField.toString() != widget.accountWithMoneyToEdit?.money.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
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
      // accountToEdit: widget.accountWithMoneyToEdit?.account,
      name: nameField.value,
      money: moneyField.value,
    );
  }

  void _onCancel(BuildContext context) {
    BlocProvider.of<AccountsPanelBloc>(context).cancelEdit();
  }
}
