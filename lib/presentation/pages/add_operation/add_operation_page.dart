import 'package:flutter/material.dart';
import 'package:iif/domain/entities/enums/category_type.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/predefined.dart';
import 'package:iif/presentation/blocs/add_operation_bloc/add_operation_bloc.dart';
import 'package:iif/presentation/blocs/add_operation_bloc/add_operation_state.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/account_selector.dart';
import 'package:iif/presentation/pages/add_operation/widgets/node_selector.dart';
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
  late NodeSelector<Category> _categorySelector;
  late NodeSelector<Subject> _subjectSelector;
  late OperationMoney _operationMoney;

  late NodeSelectorBloc<Category> _categorySelectorBloc;
  late NodeSelectorBloc<Subject> _subjectSelectorBloc;
  late AddOperationBloc _addOperationBloc;

  void initState() {
    super.initState();
    _categorySelector = NodeSelector(
      colorScheme: StyleNodeColorSheme.categories(),
      reference: Category.undefined(),
    );
    _subjectSelector = NodeSelector(
      colorScheme: StyleNodeColorSheme.subjects(),
      reference: Subject(-1, "", SubjectType.debts),
    );

    _categorySelectorBloc = NodeSelectorBloc(context);
    _subjectSelectorBloc = NodeSelectorBloc(context);
    _addOperationBloc = AddOperationBloc(
      context,
      categorySelectorBloc: _categorySelectorBloc,
      subjectSelectorBloc: _subjectSelectorBloc,
    );

    _operationMoney = OperationMoney(
      onMoneyChanged: (money) {
        _addOperationBloc.moneyChanged(money);
      },
    );
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
      body: MultiBlocProvider(
        providers: [
          BlocProvider<NodeSelectorBloc<Category>>(create: (_) => _categorySelectorBloc),
          BlocProvider<NodeSelectorBloc<Subject>>(create: (_) => _subjectSelectorBloc),
        ],
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
                child: _categorySelector,
                // child: _subjectSelector,
              ),
              visibility: (visibility) {
                final transferBackgroundColor = visibility.subject
                    ? StyleNodeColorSheme.subjects().selectedBackgroundColor
                    : StyleNodeColorSheme.categories().selectedBackgroundColor;
                final transferArrowColor = Style.whiteColor;
                // visibility.subject
                //     ? StyleNodeColorSheme.subjects().selectedTextColor
                //     : StyleNodeColorSheme.categories().selectedTextColor;

                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  children: [
                    const SizedBox(height: 8),
                    _categorySelector,
                    Visibility(
                      visible: visibility.subject,
                      child: _subjectSelector,
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
                                  color: transferBackgroundColor,
                                  child: TransferArrow(
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
                                color: transferBackgroundColor,
                                child: TransferArrow(
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
                              child: _operationMoney,
                            ),
                          ),
                          const Expanded(
                            flex: 4,
                            child: Frame(child: _Dates()),
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
                );
              },
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

  void save() {
    _addOperationBloc.trySave();
  }
}

class _Dates extends StatelessWidget {
  const _Dates({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}
