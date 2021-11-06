import 'package:flutter/material.dart';
import 'package:iif/domain/entities/enums/category_type.dart';
import 'package:iif/presentation/blocs/add_operation_bloc/add_operation_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/account_selector.dart';
import 'package:iif/presentation/pages/add_operation/widgets/category_selector.dart';
import 'package:iif/presentation/pages/add_operation/widgets/date_selector.dart';
import 'package:iif/presentation/pages/add_operation/widgets/frame.dart';
import 'package:iif/presentation/pages/add_operation/widgets/month_selector.dart';
import 'package:iif/presentation/pages/add_operation/widgets/operation_money.dart';
import 'package:iif/presentation/pages/add_operation/widgets/year_selector.dart';
import 'package:iif/presentation/pages/main/widgets/account_item.dart';

class AddOperationPage extends StatefulWidget {
  const AddOperationPage({Key? key}) : super(key: key);

  @override
  _AddOperationPageState createState() => _AddOperationPageState();
}

class _AddOperationPageState extends State<AddOperationPage> with TickerProviderStateMixin {
  bool isObjectsBlockVisible = false;
  bool get isLocationsBlockVisible => isLocationFromVisible || isLocationToVisible;
  bool get isLocationsArrowVisible => operationCategory == CategoryType.transfer;
  bool isLocationFromVisible = false;
  bool isLocationToVisible = false;
  bool isCommentVisible = false;

  CategoryType? operationCategory;
  AccountSelector? accountSelectorFrom;
  AccountSelector? accountSelectorTo;
  // OperationMoney? opMoney;
  late CategorySelector categorySelector;
  DateSelector? statsDateSelector;
  MonthSelector? statsMonthSelector;
  YearSelector? statsYearSelector;
  StringField? commentInput;

  // Animation<double> animationSum;
  // AnimationController animationControllerSum;
  // Animation<double> animationLocations;
  // AnimationController animationControllerLocations;

  late CategorySelectorBloc _categorySelectorBloc;
  late AddOperationBloc _addOperationBloc;

  void initState() {
    super.initState();
    categorySelector = CategorySelector(
        // isObject: false,
        // onCategoryChanged: onCategoryChanged,
        );

    _categorySelectorBloc = CategorySelectorBloc(context);
    _addOperationBloc = AddOperationBloc(context, categorySelectorBloc: _categorySelectorBloc);

    // animationControllerSum = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    // animationSum = CurvedAnimation(
    //     parent: Tween<double>(begin: 1, end: 0).animate(animationControllerSum), curve: Curves.fastOutSlowIn);

    // animationControllerLocations = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    // animationLocations = CurvedAnimation(
    //     parent: Tween<double>(begin: 1, end: 0).animate(animationControllerLocations), curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocProvider<CategorySelectorBloc>(
        create: (_) => _categorySelectorBloc,
        child: BlocBuilder<AddOperationBloc, AddOperationState>(
          bloc: _addOperationBloc,
          builder: (context, state) {
            // items.add(
            //   Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 4),
            //     child: Column(
            //       children: [
            //         /*highlightable(*/ Frame(child: locations),
            //         /* animationLocations),*/
            //         Row(children: [
            //           Expanded(
            //             flex: 5,
            //             child: /*highlightable(*/ Frame(
            //                 child: Visibility(
            //                     visible: isMoneyBlockVisible, child: opMoney = OperationMoney())), /*animationSum)*/
            //           ),
            //           Expanded(flex: 4, child: Frame(child: dates)),
            //         ]),
            //         Frame(child: commentField),
            //       ],
            //     ),
            //   ),
            // );

            return state.map(
              visibility: (visibility) => ListView(
                children: [
                  const SizedBox(height: 8),
                  categorySelector,
                  objectSelector,
                  const SizedBox(height: 16),
                  Visibility(
                    visible: visibility.money,
                    child: Frame(
                      child: OperationMoney(
                        onMoneyChanged: (money) {},
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
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
          // isObject: true,
          // onCategoryChanged: (_) {},
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
                visible: isLocationFromVisible && operationCategory != CategoryType.transfer,
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
                        operationCategory == CategoryType.transfer ? Alignment.centerRight : Alignment.centerLeft,
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

  void onCategoryChanged(CategoryType? category) {
    if (operationCategory == category) return;

    operationCategory = category;
    if (category == null) {
      setVisibility(false, false, false, false, false);
      return;
    }
    switch (category) {
      case CategoryType.expense:
        {
          setVisibility(false, true, true, false, true);
          break;
        }
      case CategoryType.income:
        {
          setVisibility(false, true, false, true, true);
          break;
        }
      case CategoryType.transfer:
        {
          setVisibility(false, true, true, true, true);
          break;
        }
      case CategoryType.debtNew:
        {
          setVisibility(true, true, false, true, true);
          break;
        }
      case CategoryType.debtReturn:
        {
          setVisibility(true, true, true, false, true);
          break;
        }
      case CategoryType.debtToMe:
        {
          setVisibility(true, true, true, false, true);
          break;
        }
      case CategoryType.debtReturnedToMe:
        {
          setVisibility(true, true, false, true, true);
          break;
        }
    }
  }

  void setVisibility(bool objects, bool money, bool locationFrom, bool locationTo, bool comment) {
    setState(() {
      isObjectsBlockVisible = objects;
      // isMoneyBlockVisible = money;
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
        (operationCategory == CategoryType.transfer && accountSelectorFrom?.value != accountSelectorTo?.value) ||
            operationCategory != CategoryType.transfer;
    final bool sumIsEmpty = true; //opMoney?.sum == null;

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
