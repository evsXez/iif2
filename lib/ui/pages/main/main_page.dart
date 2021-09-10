import 'package:iif/ui/include/ui_include.dart';
import 'package:iif/ui/pages/main/widgets/funds.dart';
import 'package:iif/ui/pages/main/widgets/header.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings.init(context);

    return Scaffold(
      appBar: Header(),
      backgroundColor: Style.lightGrayColor,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Funds(),
        ],
      ),
    );
  }
}
