import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/data/repositories/accounts_repository_impl.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/presentation/blocs/accounts_panel_bloc/accounts_panel_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/button_add_account.dart';
import 'package:iif/presentation/pages/main/widgets/account_edit_item.dart';
import 'package:iif/presentation/pages/main/widgets/account_item.dart';
import 'package:iif/presentation/pages/main/widgets/top_divider.dart';

class AccountPanelBody extends StatelessWidget {
  final AccountType type;

  AccountPanelBody({
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
    return BlocProvider<AccountsPanelBloc>(
      create: (_) => AccountsPanelBloc(
        context,
        type: type,
      ),
      child: BlocBuilder<AccountsPanelBloc, AccountsPanelState>(
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
                  (accountWithMoney) => AccountItem(
                    accountWithMoney: accountWithMoney,
                    isEditing: accountWithMoney.key == state.editing,
                  ),
                )
                .toList());

            if (state.isAddingNew) {
              items.add(
                AccountEditItem(
                  // accountWithMoneyToEdit: null,
                  key: ObjectKey(state.data),
                ),
              );
            } else {
              items.add(const ButtonAddAccount());
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
