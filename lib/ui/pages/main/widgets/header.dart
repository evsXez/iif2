import 'package:iif/ui/include.dart';

class Header extends AppBar {
  Header({Key? key})
      : super(
          key: key,
          backgroundColor: Style.whiteColor,
          title: Text(
            Strings.title_accounts,
            style: const TextStyle(
              color: Style.blackColor,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.black,
              onPressed: () {
                Navigation.push(const SettingsPage());
              },
            ),
          ],
        );
}
