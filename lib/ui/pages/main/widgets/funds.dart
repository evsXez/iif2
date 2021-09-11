import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/data/include/data_include.dart';
import 'package:iif/data/repositories/funds_repository.dart';
import 'package:iif/domain/blocs/funds_bloc/funds_bloc.dart';
import 'package:iif/ui/include/ui_include.dart';
import 'package:iif/ui/pages/main/widgets/fund_panel_header.dart';

class Funds extends StatelessWidget {
  Funds({Key? key}) : super(key: key);

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
          expansionCallback: (index, isExpanded) => _expand(index),
          children: List.generate(
            FundType.values.length,
            (index) {
              final type = FundType.values[index];
              final Money? money = state.map(
                loadInProgress: (_) => null,
                loadSuccess: (state) => state.data[type],
              );
              return ExpansionPanel(
                isExpanded: state.expandedIndex == index,
                canTapOnHeader: true,
                headerBuilder: (context, isExpanded) => FundPanelHeader(
                  label: type.name(context),
                  money: money,
                  onPressed: () => _expand(index),
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

  void _expand(int index) {
    bloc.setExpanded(index);
  }
}
