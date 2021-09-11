import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/domain/blocs/funds_panel_bloc/funds_panel_bloc.dart';
import 'package:iif/ui/include/ui_include.dart';
import 'package:iif/ui/pages/main/widgets/label_button.dart';

class ButtonAddFund extends StatelessWidget {
  const ButtonAddFund({Key? key}) : super(key: key);

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
            BlocProvider.of<FundsPanelBloc>(context).addFundClicked();
          },
        ),
      ),
    );
  }
}
