import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/blocs/node_selector_bloc/node_selector_state.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/presentation/pages/add_operation/widgets/node_selector.dart';

class AccountDebtEditItem extends StatefulWidget {
  final AccountBalance? accountBalanceToEdit;
  final Function(Subject?) onSubjectChanged;
  final Function(String) onMoneyChanged;
  const AccountDebtEditItem({
    Key? key,
    required this.accountBalanceToEdit,
    required this.onSubjectChanged,
    required this.onMoneyChanged,
  }) : super(key: key);

  @override
  _AccountDebtEditItemState createState() => _AccountDebtEditItemState();
}

class _AccountDebtEditItemState extends State<AccountDebtEditItem> {
  late final debtSubjectSelectorBloc = NodeSelectorBloc<Subject>(context);
  late final debtSubjectSelector = BlocProvider<NodeSelectorBloc<Subject>>(
    create: (context) => debtSubjectSelectorBloc,
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: BlocListener<NodeSelectorBloc<Subject>, NodeSelectorState<Subject>>(
          listener: (context, state) {
            state.maybeMap(
              loaded: (state) {
                Subject? subject;
                try {
                  subject = state.refs.lastWhere((it) => it.node.isSelected).node.value;
                } finally {
                  widget.onSubjectChanged(subject);
                }
              },
              orElse: () {},
            );
          },
          child: NodeSelector<Subject>(
            colorScheme: StyleNodeColorSheme.subjectsHighlighted(),
            reference: Subject(-1, "", SubjectType.debts),
          ),
        ),
      ),
    ),
  );

  late MoneyField moneyField = MoneyField(
    initialValue: widget.accountBalanceToEdit?.money,
    onChanged: widget.onMoneyChanged,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.highlightColor,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: debtSubjectSelector,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: moneyField,
          ),
          const SizedBox(width: 4),
          // currencySelector,
        ],
      ),
    );
  }
}
