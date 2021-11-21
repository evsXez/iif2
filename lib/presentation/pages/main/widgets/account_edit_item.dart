import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/blocs/accounts_panel_bloc/accounts_panel_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/node_selector.dart';
import 'package:iif/presentation/pages/main/widgets/small_button.dart';

class AccountEditItem extends StatefulWidget {
  final AccountType accountType;
  final AccountBalance? accountBalanceToEdit;

  const AccountEditItem({
    required this.accountType,
    required this.accountBalanceToEdit,
    Key? key,
  }) : super(key: key);

  @override
  State<AccountEditItem> createState() => _AccountEditItemState();
}

class _AccountEditItemState extends State<AccountEditItem> {
  bool get isDebts => widget.accountType == AccountType.debts || widget.accountType == AccountType.loans;

  late StringField nameField = StringField(
    hint: Strings.label_title,
    initialValue: widget.accountBalanceToEdit?.account.name ?? "",
    onChanged: _onChanged,
  );

  late MoneyField moneyField = MoneyField(
    initialValue: widget.accountBalanceToEdit?.money,
    onChanged: _onChanged,
  );

  Subject? _selectedDebtSubject;
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
                try {
                  _selectedDebtSubject = state.refs.lastWhere((it) => it.node.isSelected).node.value;
                } catch (_) {
                  _selectedDebtSubject = null;
                } finally {
                  print("_selectedDebtSubject: $_selectedDebtSubject");
                  _onChanged(null);
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

  bool _isInputCompletedAndSmthChanged = false;

  void _onChanged(_) {
    bool nameEntered = nameField.isValueEntered;
    bool nameChanged = nameField.value != widget.accountBalanceToEdit?.account.name;

    bool moneyEntered = moneyField.isValueEntered;
    bool moneyChanged = moneyField.value != widget.accountBalanceToEdit?.money;

    bool subjectDebtEntered = _selectedDebtSubject != null;
    bool subjectDebtChanged = subjectDebtEntered; //no edit for now

    setState(() {
      _isInputCompletedAndSmthChanged = isDebts
          ? (subjectDebtEntered && moneyEntered && (subjectDebtChanged || moneyChanged))
          : (nameEntered && moneyEntered && (nameChanged || moneyChanged));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: isDebts ? null : 38,
          color: Style.highlightColor,
          child: Row(
            children: <Widget>[
              const SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: isDebts ? debtSubjectSelector : nameField,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: moneyField,
              ),
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
    );
  }

  void _onSave(BuildContext context) {
    BlocProvider.of<AccountsPanelBloc>(context).saveAccount(
      accountToEdit: widget.accountBalanceToEdit?.account,
      name: nameField.value,
      money: moneyField.value,
      debtSubject: _selectedDebtSubject,
    );
  }

  void _onCancel(BuildContext context) {
    BlocProvider.of<AccountsPanelBloc>(context).cancelEdit();
  }
}
