import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/blocs/accounts_bloc/accounts_bloc.dart';
import 'package:iif/presentation/extensions/account_type_x.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/account_panel_body.dart';
import 'package:iif/presentation/pages/main/widgets/account_panel_header.dart';

class Accounts extends StatelessWidget {
  // final List<StreamController> streamCloseLocationInputs = List.generate(5, (idx) => StreamController.broadcast());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
      child: BlocBuilder<AccountsBloc, AccountsState>(
        builder: (context, state) => ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (index, isExpanded) => _expand(context, index),
          children: List.generate(
            state.data.length,
            (index) {
              final type = state.data[index].key;
              final Money? money = state.data[index].value;
              return ExpansionPanel(
                isExpanded: state.expandedIndex == index,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) => AccountPanelHeader(
                  label: type.name(),
                  money: money,
                  onPressed: () => _expand(context, index),
                ),
                body: AccountPanelBody(type: type),
                // body: LocationsListOfType(type),
              );
            },
          ),
        ),
      ),
    );
  }

  void _expand(BuildContext context, int index) {
    BlocProvider.of<AccountsBloc>(context).setExpanded(index);
  }
}
