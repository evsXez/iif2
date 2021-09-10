import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/data/include/data_include.dart';
import 'package:iif/data/repositories/funds_repository.dart';
import 'package:iif/domain/blocs/funds_bloc/funds_bloc.dart';
import 'package:iif/ui/include/ui_include.dart';
import 'package:iif/ui/pages/main/widgets/fund_panel_header.dart';

class Funds extends StatelessWidget {
  Funds({Key? key}) : super(key: key);

  final List<bool> expandedState = List.generate(FundType.values.length, (idx) => false);
  // final List<StreamController> streamCloseLocationInputs = List.generate(5, (idx) => StreamController.broadcast());

  final bloc = FundsBloc(FundsRepository());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
      child: BlocBuilder<FundsBloc, FundsState>(
        bloc: bloc,
        builder: (context, state) => ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (pos, isExpanded) => _changeExpanded(pos),
          children: List.generate(
            FundType.values.length,
            (idx) {
              final type = FundType.values[idx];
              final Money? money = state.map(
                loadInProgress: (_) => null,
                loadSuccess: (state) => state.data[type],
              );
              return ExpansionPanel(
                isExpanded: expandedState[idx],
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) => FundPanelHeader(
                  label: type.name(context),
                  money: money,
                  onPressed: () => _changeExpanded(idx),
                ),
                body: const SizedBox(height: 24),
                // body: LocationsListOfType(type),
              );
            },
          ),
        ),
      ),
    );
  }

  void _changeExpanded(int pos) {
    // final value = !expandedState[pos];
    // setState(() {
    //   expandedState[pos] = value;
    // });
    // if (!value) {
    //   streamCloseLocationInputs[pos].add(null);
    //   Streams.locationAddEditInlineOpenedState.add(false);
    // }
  }
}
