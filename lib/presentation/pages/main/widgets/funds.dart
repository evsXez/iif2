import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/data/repositories/funds_repository_impl.dart';
import 'package:iif/presentation/blocs/funds_bloc/funds_bloc.dart';
import 'package:iif/presentation/extensions/fund_type_x.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/fund_panel_body.dart';
import 'package:iif/presentation/pages/main/widgets/fund_panel_header.dart';

class Funds extends StatelessWidget {
  Funds({Key? key}) : super(key: key);

  // final List<StreamController> streamCloseLocationInputs = List.generate(5, (idx) => StreamController.broadcast());

  final bloc = FundsBloc(FundsRepositoryImpl());

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
                body: FundPanelBody(type: type),
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
