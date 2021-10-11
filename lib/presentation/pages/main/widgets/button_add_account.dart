import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/presentation/blocs/accounts_panel_bloc/accounts_panel_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/label_button.dart';

class ButtonAddAccount extends StatelessWidget {
  const ButtonAddAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.only(right: 16),
      child: Align(
        alignment: Alignment.centerRight,
        child: LabelButton(
          label: Strings.button_add_account,
          onPressed: () {
            BlocProvider.of<AccountsPanelBloc>(context).addAccountClicked();
          },
        ),
      ),
    );
  }
}
