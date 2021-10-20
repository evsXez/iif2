import 'package:flutter/material.dart';
import 'package:iif/domain/entities/enums/operation_category.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/account_selector.dart';
import 'package:iif/presentation/pages/add_operation/widgets/category_selector.dart';
import 'package:iif/presentation/pages/add_operation/widgets/date_selector.dart';
import 'package:iif/presentation/pages/add_operation/widgets/month_selector.dart';
import 'package:iif/presentation/pages/add_operation/widgets/operation_money.dart';
import 'package:iif/presentation/pages/add_operation/widgets/year_selector.dart';

class AddOperationPage extends StatefulWidget {
  const AddOperationPage({Key? key}) : super(key: key);

  @override
  _AddOperationPageState createState() => _AddOperationPageState();
}

class _AddOperationPageState extends State<AddOperationPage> with TickerProviderStateMixin {
  bool isObjectsBlockVisible = false;
  bool isMoneyBlockVisible = false;
  bool get isLocationsBlockVisible => isLocationFromVisible || isLocationToVisible;
  bool get isLocationsArrowVisible => operationCategory == OperationCategory.transfer;
  bool isLocationFromVisible = false;
  bool isLocationToVisible = false;
  bool isCommentVisible = false;

  OperationCategory? operationCategory;
  AccountSelector? accountSelectorFrom;
  AccountSelector? accountSelectorTo;
  OperationMoney? opMoney;
  late CategorySelector categorySelector;
  DateSelector? statsDateSelector;
  MonthSelector? statsMonthSelector;
  YearSelector? statsYearSelector;
  StringField? commentInput;

  // Animation<double> animationSum;
  // AnimationController animationControllerSum;
  // Animation<double> animationLocations;
  // AnimationController animationControllerLocations;

  void initState() {
    super.initState();
    categorySelector = CategorySelector(
      onCategoryChanged: onCategoryChanged,
    );

    // animationControllerSum = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    // animationSum = CurvedAnimation(
    //     parent: Tween<double>(begin: 1, end: 0).animate(animationControllerSum), curve: Curves.fastOutSlowIn);

    // animationControllerLocations = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    // animationLocations = CurvedAnimation(
    //     parent: Tween<double>(begin: 1, end: 0).animate(animationControllerLocations), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [
      const SizedBox(height: 8),
      categorySelector,
      objectSelector,
      const SizedBox(height: 16),
    ];

    if (operationCategory != null) {
      items.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Column(children: [
            /*highlightable(*/ frame(locations, B: false),
            /* animationLocations),*/
            Row(children: [
              Expanded(
                flex: 5,
                child: /*highlightable(*/ frame(money, R: false), /*animationSum)*/
              ),
              Expanded(flex: 4, child: frame(dates)),
            ]),
            frame(commentField, T: false),
          ])));
    }

    return Scaffold(
        backgroundColor: Style.lightGrayColor,
        appBar: AppBar(
          primary: true,
          backgroundColor: Style.accentColor,
          centerTitle: false,
          leading: null,
          automaticallyImplyLeading: true,
          title: Text(Strings.title_new_operation,
              style: const TextStyle(
                color: Style.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              )),
          actions: [
            IconButton(
              icon: const Icon(Icons.done),
              color: Style.whiteColor,
              onPressed: save,
            )
          ],
        ),
        body: ListView(
          children: items,
        ));
  }

  Widget highlightable(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  Widget get objectSelector => Visibility(
      visible: isObjectsBlockVisible,
      child: CategorySelector(
        isObject: true,
      ));
  Widget get commentField => Visibility(
      visible: isCommentVisible,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: commentInput = StringField(
          hint: Strings.hint_comment,
          initialValue: "",
          onChanged: (_) {},
        ),
      ));

  Widget get money => Visibility(visible: isMoneyBlockVisible, child: opMoney = OperationMoney());
  Widget get dates => Column(
        children: [
          statsDateSelector = DateSelector(),
          Expanded(
              child: Row(
            children: [
              Expanded(child: statsMonthSelector = MonthSelector()),
              Expanded(child: statsYearSelector = YearSelector())
            ],
          ))
        ],
      );
  Widget get locations => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Visibility(
          visible: isLocationsBlockVisible,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: isLocationFromVisible && operationCategory != OperationCategory.transfer,
                child: const TransferArrow(
                  right: false,
                  isSmall: false,
                ),
              ),
              Visibility(
                visible: isLocationFromVisible,
                child: Expanded(
                  child: accountSelectorFrom = AccountSelector(
                    alignment:
                        operationCategory == OperationCategory.transfer ? Alignment.centerRight : Alignment.centerLeft,
                  ),
                ),
              ),
              Visibility(
                  visible: isLocationToVisible,
                  child: const TransferArrow(
                    right: true,
                    isSmall: false,
                  )),
              Visibility(
                visible: isLocationToVisible,
                child: Expanded(
                  child: accountSelectorTo = const AccountSelector(alignment: Alignment.centerLeft),
                ),
              ),
              // selectedCategory == OperationCategory.transfer ? SizedBox.shrink() : Expanded(flex: 1, child: SizedBox.shrink()),
            ],
          ),
        ),
      );

  Widget frame(Widget child, {bool L = true, bool T = true, bool R = true, bool B = true}) {
    const border = BorderSide(color: Style.lightGrayColor, width: 8);
    return Card(
      color: Colors.white,
      child: Container(
        height: 80,
        // decoration: BoxDecoration(
        //   // color: StyleColors.gray,
        //   border: Border(
        //     left: L ? border : BorderSide.none,
        //     top: T ? border : BorderSide.none,
        //     right: R ? border : BorderSide.none,
        //     bottom: B ? border : BorderSide.none,
        //   ),
        // ),
        child: child,
      ),
    );
  }

  void onCategoryChanged(OperationCategory category) {
    if (operationCategory == category) return;

    operationCategory = category;
    if (category == null) {
      setVisibility(false, false, false, false, false);
      return;
    }
    switch (category) {
      case OperationCategory.expense:
        {
          setVisibility(false, true, true, false, true);
          break;
        }
      case OperationCategory.income:
        {
          setVisibility(false, true, false, true, true);
          break;
        }
      case OperationCategory.transfer:
        {
          setVisibility(false, true, true, true, true);
          break;
        }
      case OperationCategory.debtNew:
        {
          setVisibility(true, true, false, true, true);
          break;
        }
      case OperationCategory.debtReturn:
        {
          setVisibility(true, true, true, false, true);
          break;
        }
      case OperationCategory.debtToMe:
        {
          setVisibility(true, true, true, false, true);
          break;
        }
      case OperationCategory.debtReturnedToMe:
        {
          setVisibility(true, true, false, true, true);
          break;
        }
    }
  }

  void setVisibility(bool objects, bool money, bool locationFrom, bool locationTo, bool comment) {
    setState(() {
      isObjectsBlockVisible = objects;
      isMoneyBlockVisible = money;
      isLocationFromVisible = locationFrom;
      isLocationToVisible = locationTo;
      isCommentVisible = comment;
    });
  }

  bool get isAllDataEntered {
    final bool fromSelectedOrSkipped =
        (isLocationFromVisible && accountSelectorFrom?.value != null) || !isLocationFromVisible;
    final bool toSelectedOrSkipped = (isLocationToVisible && accountSelectorTo?.value != null) || !isLocationToVisible;
    final bool transferLocationsAreDifferent =
        (operationCategory == OperationCategory.transfer && accountSelectorFrom?.value != accountSelectorTo?.value) ||
            operationCategory != OperationCategory.transfer;
    final bool sumIsEmpty = opMoney?.sum == null;

    if (!transferLocationsAreDifferent) {
      // highlightLocations();
      return false;
    }
    if (sumIsEmpty) {
      // highlightSum();
      return false;
    }

    return !sumIsEmpty && fromSelectedOrSkipped && toSelectedOrSkipped && transferLocationsAreDifferent;
  }

  // void highlightSum() {
  //   animationControllerSum.reset();
  //   animationControllerSum.forward().then((value) => animationControllerSum.reverse());
  // }

  // void highlightLocations() {
  //   animationControllerLocations.reset();
  //   animationControllerLocations.forward().then((value) => animationControllerLocations.reverse());
  // }

  void save() {
    if (!isAllDataEntered) return;

    // final sum = opMoney?.sum;
    // final currency = opMoney?.currency;
    // final statsTime = LogicOperationTime(
    //     statsTs: statsDateSelector.value.millisecondsSinceEpoch,
    //     statsMonth: statsMonthSelector.value,
    //     statsYear: statsYearSelector.value);
    // final comment = commentInput.value;

    // switch (operationCategory) {
    //   case OperationCategory.expense:
    //     final location = accountSelectorFrom.value;
    //     LogicOperation.createExpense(location, AtomicOperationMoney(currency, sum, sum, 1),
    //         categories: categorySelector.returnValue, statsTime: statsTime, comment: comment);
    //     break;
    //   case OperationCategory.INCOME:
    //     final location = accountSelectorTo.value;
    //     LogicOperation.createIncome(location, AtomicOperationMoney(currency, sum, sum, 1),
    //         categories: categorySelector.returnValue, statsTime: statsTime, comment: comment);
    //     break;
    //   case OperationCategory.transfer:
    //     final locationFrom = accountSelectorFrom.value;
    //     final locationTo = accountSelectorTo.value;
    //     LogicOperation.createTransfer(locationFrom, locationTo, AtomicOperationMoney(currency, sum, sum, 1),
    //         categories: categorySelector.returnValue, statsTime: statsTime, comment: comment);
    //     break;
    //   case OperationCategory.DEBT_NEW:
    //     // TODO: Handle this case.
    //     return;
    //     break;
    //   case OperationCategory.DEBT_RETURN:
    //     // TODO: Handle this case.
    //     return;
    //     break;
    //   case OperationCategory.DEBT_TO_ME:
    //     // TODO: Handle this case.
    //     return;
    //     break;
    //   case OperationCategory.DEBT_RETURNED_TO_ME:
    //     // TODO: Handle this case.
    //     return;
    //     break;
    // }

    // LocalCache.update();
    // context.navigationPop();
  }
}
