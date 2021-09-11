import 'package:iif/data/include/data_include.dart';
import 'package:iif/ui/include/ui_include.dart';

class FundItemAddEdit extends StatelessWidget {
  final Fund fund;
  final Function onEditDone;

  const FundItemAddEdit({
    required this.fund,
    required this.onEditDone,
    Key? key,
  }) : super(key: key);

  // String _initialLocationName;
  // Money _initialLocationMoney;

  // LocationAddEditInline(
  //   this.type,
  //   {
  //     key,
  //     this.fund,
  //     this.onEditDone,
  //     this.streamCloseLocationInputs,
  //   }) : super(key: key) {
  //     _initialLocationName = fund?.name;
  //     _initialLocationMoney = fund?.money;
  //   }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 24,
    );
  }

  // bool isEditMode = false;
  // bool isInputCompleted = false;
  // StringField nameField;
  // MoneyField moneyField;
  // Widget currencySelector;

  // String get name => nameField.value;
  // Money get money => moneyField.value;
  // Currency get currency =>
  //     (currencySelector is CurrencySelector) ? (currencySelector as CurrencySelector).value : widget.fund.currency;

  // @override
  // void initState() {
  //   super.initState();
  //   final bool isCurrencyChangeAvailable = widget.fund?.hasNoOperationsExceptInitialInput() ?? true;

  //   nameField = StringField(Strings.label_title,
  //       onValueChanged: onValueChanged, initialValue: widget._initialLocationName, maxLines: 1);
  //   moneyField = MoneyField(
  //     onValueChanged: onValueChanged,
  //     initialValue: widget._initialLocationMoney,
  //   );
  //   currencySelector = isCurrencyChangeAvailable ? CurrencySelector() : StyleCurrencyNoSelector(widget.fund.currency);
  //   edit(widget.fund != null);
  //   // obs += widget.streamCloseLocationInputs.listen((_) {
  //   //   setState(() { isEditMode = false; });
  //   // });
  // }

  // void edit(bool value) {
  //   isEditMode = value;
  //   Streams.locationAddEditInlineOpenedState.add(value);
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return isEditMode ? widgetEdit : widgetAdd;
  // }

  // Widget get widgetEdit => Container(
  //     height: 86,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.end,
  //       children: [
  //         Container(
  //           height: 38,
  //           color: StyleColors.highlight,
  //           child: Row(
  //             children: <Widget>[
  //               spaceh(8),
  //               Expanded(child: nameField),
  //               spaceh(4),
  //               Expanded(child: moneyField),
  //               spaceh(4),
  //               currencySelector,
  //             ],
  //           ),
  //         ),
  //         Padding(padding: EdgeInsets.only(right: 12), child: buttonSave),
  //       ],
  //     ));

  // Widget get widgetAdd => Container(
  //       height: 30,
  //       padding: const EdgeInsets.only(right: 16),
  //       child: Align(
  //         alignment: Alignment.centerRight,
  //         child: buttonAdd,
  //       ),
  //     );

  // void onValueChanged(dynamic d) {
  //   setState(() {
  //     isInputCompleted = nameField.isValueEntered && moneyField.isValueEntered;
  //   });
  // }

  // Widget get buttonAdd => optionalNotReady(ButtonAddLocation(clickAdd));
  // Widget get buttonSave =>
  //     ButtonSaveLocation(clickSave, isInputCompleted && somethingChanged ? Strings.save : Strings.cancel);

  // Widget optionalNotReady(Widget child) {
  //   if (widget.type != LocationType.MONEY) return notReady(child);
  //   return child;
  // }

  // void clickAdd() {
  //   if (widget.type != LocationType.MONEY) return;
  //   setState(() {
  //     edit(true);
  //   });
  // }

  // void clickSave() {
  //   if (isInputCompleted && somethingChanged)
  //     saveData().then((value) => editDone());
  //   else
  //     editDone();
  // }

  // void editDone() {
  //   setState(() {
  //     edit(false);
  //     widget.onEditDone?.call();
  //   });
  // }

  // bool get somethingChanged =>
  //     (name != widget._initialLocationName) || (money.toString() != widget._initialLocationMoney.toString());

  // Future<void> saveData() async {
  //   Location location;
  //   if (widget.fund == null) {
  //     location = await Location.create(name, widget.type, currency);
  //     await LogicOperation.createInitialInput(context, location, money);
  //   } else {
  //     location = await Location.update(widget.fund, name, currency);
  //     if (money.toString() != widget._initialLocationMoney.toString())
  //       await LogicOperation.createInitialInput(context, location, money);
  //   }

  //   await LocalCache.update();
  // }
}
