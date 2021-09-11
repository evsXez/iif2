import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/data/include/data_include.dart';
import 'package:iif/data/models/fund_with_money.dart';
import 'package:iif/domain/blocs/funds_panel_bloc/funds_panel_bloc.dart';
import 'package:iif/ui/include/ui_include.dart';
import 'package:iif/ui/pages/main/widgets/small_button.dart';
import 'package:iif/ui/widgets/money_field.dart';

class FundEditItem extends StatefulWidget {
  final FundWithMoney? fundWithMoneyToEdit;

  const FundEditItem({
    required this.fundWithMoneyToEdit,
    Key? key,
  }) : super(key: key);

  @override
  State<FundEditItem> createState() => _FundEditItemState();
}

class _FundEditItemState extends State<FundEditItem> {
  late StringField nameField = StringField(
    hint: Strings.label_title,
    initialValue: widget.fundWithMoneyToEdit?.fund.name ?? "",
    onChanged: _onChanged,
  );

  late MoneyField moneyField = MoneyField(
    initialValue: widget.fundWithMoneyToEdit?.money,
    onChanged: _onChanged,
  );

  bool _isInputCompletedAndSmthChanged = false;

  void _onChanged(_) {
    setState(() {
      _isInputCompletedAndSmthChanged = (nameField.isValueEntered && moneyField.isValueEntered) &&
          ((nameField.value != widget.fundWithMoneyToEdit?.fund.name) ||
              (moneyField.toString() != widget.fundWithMoneyToEdit?.money.toString()));
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
    BlocProvider.of<FundsPanelBloc>(context).saveFund(
      fundToEdit: widget.fundWithMoneyToEdit?.fund,
      name: nameField.value,
      money: moneyField.value,
    );
  }

  void _onCancel(BuildContext context) {
    BlocProvider.of<FundsPanelBloc>(context).cancelEdit();
  }
}
