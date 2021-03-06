import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/blocs/accounts_panel_bloc/accounts_panel_bloc.dart';
import 'package:iif/presentation/blocs/accounts_panel_bloc/accounts_panel_state.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/button_add_account.dart';
import 'package:iif/presentation/pages/main/widgets/account_edit_item.dart';
import 'package:iif/presentation/pages/main/widgets/account_item.dart';
import 'package:iif/presentation/pages/main/widgets/top_divider.dart';

class AccountPanelBody extends StatelessWidget {
  final AccountType type;

  const AccountPanelBody({
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountsPanelBloc>(
          create: (_) => AccountsPanelBloc(context, type: type),
        ),
      ],
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
                  (balance) => AccountItem(
                    accountBalance: balance,
                    isEditing: balance.account == state.editing,
                  ),
                )
                .toList());

            if (state.isAddingNew) {
              items.add(
                AccountEditItem(
                  accountType: type,
                  accountBalanceToEdit: null,
                  key: ObjectKey(state.data),
                ),
              );
            } else {
              if (state.isButtonAddVisible) {
                items.add(const ButtonAddAccount());
              }
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
