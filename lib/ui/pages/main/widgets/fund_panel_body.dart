import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/data/include/data_include.dart';
import 'package:iif/data/repositories/funds_repository.dart';
import 'package:iif/domain/blocs/funds_panel_bloc/funds_panel_bloc.dart';
import 'package:iif/ui/include/ui_include.dart';
import 'package:iif/ui/pages/main/widgets/fund_item.dart';
import 'package:iif/ui/pages/main/widgets/fund_item_add_edit.dart';
import 'package:iif/ui/pages/main/widgets/top_divider.dart';

class FundPanelBody extends StatelessWidget {
  final FundType type;
  late final FundsPanelBloc bloc = FundsPanelBloc(repository: const FundsRepository(), type: type);

  FundPanelBody({
    required this.type,
    Key? key,
  }) : super(key: key);

  // int highlightedLocationId = null;
  // int editLocationId = null;
  // List<Location> locations;

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
    return BlocBuilder<FundsPanelBloc, FundsPanelState>(
      bloc: bloc,
      builder: (context, state) => state.map(
          loadInProgress: (_) => const CircularProgressIndicator(),
          loadSuccess: (state) {
            final List<Widget> items = state.funds.isNotEmpty ? [const TopDivider()] : [];
            items.addAll(state.funds
                .map(
                  (fund) => FundItem(
                    fund: fund,
                    isHighlighted: fund == state.highlighted,
                    isEditing: fund == state.editing,
                  ),
                )
                .toList());
            // items.add(FundItemAddEdit(widget.type,
            //     key: ObjectKey(funds),);

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: items,
            );
          }),
    );
  }

  // void _getData() {
  //   locations = LocalCache.locations.dataFiltered([LocationFilter(type: widget.type, isArchived: false)]);
  // }

}
