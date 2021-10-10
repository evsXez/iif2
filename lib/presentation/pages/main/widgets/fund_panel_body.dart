import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/data/repositories/funds_repository_impl.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/presentation/blocs/funds_panel_bloc/funds_panel_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/button_add_fund.dart';
import 'package:iif/presentation/pages/main/widgets/fund_edit_item.dart';
import 'package:iif/presentation/pages/main/widgets/fund_item.dart';
import 'package:iif/presentation/pages/main/widgets/top_divider.dart';

class FundPanelBody extends StatelessWidget {
  final FundType type;
  late final FundsPanelBloc bloc = FundsPanelBloc(
    fundsRepository: FundsRepositoryImpl(),
    operationsRepository: OperationsRepositoryImpl(),
    type: type,
  );

  FundPanelBody({
    required this.type,
    Key? key,
  }) : super(key: key);

  // @override
  // void initState() {
  //   super.initState();
  //   _getData();
  //   obs += LocalCache.locations.updateStream.stream.listen((_) {
  //     setState(() {
  //       _getData();
  //       editLocationId = null;
  //       highlightedLocationId = null;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FundsPanelBloc>(
      create: (_) => bloc,
      child: BlocBuilder<FundsPanelBloc, FundsPanelState>(
        builder: (context, state) => state.map(
          loadInProgress: (_) => const Center(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: CircularProgressIndicator(),
            ),
          ),
          loadSuccess: (state) {
            final List<Widget> items = state.data.isNotEmpty ? [const TopDivider()] : [];
            items.addAll(state.data
                .map(
                  (fundWithMoney) => FundItem(
                    fundWithMoney: fundWithMoney,
                    isEditing: fundWithMoney.fund == state.editing,
                  ),
                )
                .toList());

            if (state.isAddingNew) {
              items.add(
                FundEditItem(
                  fundWithMoneyToEdit: null,
                  key: ObjectKey(state.data),
                ),
              );
            } else {
              items.add(const ButtonAddFund());
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: items,
            );
          },
        ),
      ),
    );
  }
}
