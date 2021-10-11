import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/accounts.dart';
import 'package:iif/presentation/pages/main/widgets/header.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings.init(context);

    return Scaffold(
      appBar: Header(),
      backgroundColor: Style.lightGrayColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Accounts(),
          ],
        ),
      ),
    );
  }
}
