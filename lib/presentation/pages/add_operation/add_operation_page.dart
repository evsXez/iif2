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

class _AddOperationPageState extends State<AddOperationPage> {
  late CategorySelector categorySelector;

  late CategorySelectorBloc _categorySelectorBloc;
  late AddOperationBloc _addOperationBloc;

  void initState() {
    super.initState();
    categorySelector = const CategorySelector();

    _categorySelectorBloc = CategorySelectorBloc(context);
    _addOperationBloc = AddOperationBloc(context, categorySelectorBloc: _categorySelectorBloc);
  }

  final transferArrowColor = Style.whiteColor;

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
        child: BlocConsumer<AddOperationBloc, AddOperationState>(
          bloc: _addOperationBloc,
          listener: (context, state) {
            state.maybeMap(
              visibility: (state) {
                if (state.errorMessage != null) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
                }
              },
              saved: (_) {
                Navigation.pop();
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.map(
              idle: (_) => Container(
                // color: Style.accentColor,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: categorySelector,
              ),
              visibility: (visibility) => ListView(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                children: [
                  const SizedBox(height: 8),
                  categorySelector,
                  Visibility(
                    visibile: visibility.objects,
                    child: objectSelector,
                  ),
                  const SizedBox(height: 16),
                  Visibility(
                    visible: visibility.locationFrom || visibility.locationTo,
                    child: Frame(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SizedBox(width: 24),
                          Visibility(
                            visible: visibility.locationFrom,
                            child: Expanded(
                              child: AccountSelector(
                                alignment: visibility.locationFrom && visibility.locationTo
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                initialAccount: visibility.accountsBalance.first.account,
                                onAccountChanged: (account) {
                                  _addOperationBloc.accountFromChanged(account);
                                },
                                accountsBalance: visibility.accountsBalance,
                              ),
                            ),
                          ),
                          Visibility(
                              visible: visibility.locationTo,
                              child: Container(
                                height: double.infinity,
                                color: Style.highlightColor,
                                child: TransferArrow(
                                  right: true,
                                  isSmall: false,
                                  color: transferArrowColor,
                                ),
                              )),
                          Visibility(
                            visible: visibility.locationTo,
                            child: Expanded(
                              child: AccountSelector(
                                alignment: Alignment.centerLeft,
                                initialAccount: visibility.accountsBalance.first.account,
                                onAccountChanged: (account) {
                                  _addOperationBloc.accountToChanged(account);
                                },
                                accountsBalance: visibility.accountsBalance,
                              ),
                            ),
                          ),
                          // selectedCategory == OperationCategory.transfer ? SizedBox.shrink() : Expanded(flex: 1, child: SizedBox.shrink()),
                          Visibility(
                            visible: visibility.locationFrom && !visibility.locationTo,
                            child: Container(
                              height: double.infinity,
                              color: Style.highlightColor,
                              child: TransferArrow(
                                right: true,
                                isSmall: false,
                                color: transferArrowColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: visibility.money,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Frame(
                            child: OperationMoney(
                              onMoneyChanged: (money) {
                                _addOperationBloc.moneyChanged(money);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Frame(child: dates),
                        ),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: visibility.comment,
                    child: Frame(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StringField(
                          hint: Strings.hint_comment,
                          initialValue: "",
                          onChanged: (text) {
                            _addOperationBloc.commentChanged(text);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              saved: (_) => const SizedBox.shrink(),
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

  Widget get dates => Column(
        children: [
          DateSelector(
            initialDate: DateTime.now(),
            onDateChanged: (_) {},
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: MonthSelector(
                  initialMonth: DateTime.now().month,
                  onMonthChanged: (_) {},
                ),
              ),
              Expanded(
                child: YearSelector(
                  initialYear: DateTime.now().year,
                  onYearChanged: (_) {},
                ),
              )
            ],
          ))
        ],
      );

  void save() {
    _addOperationBloc.trySave();
  }
}
