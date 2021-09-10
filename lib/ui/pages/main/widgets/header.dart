import 'package:iif/ui/include/ui_include.dart';

class SliverHeader extends StatelessWidget {
  const SliverHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: true,
      snap: true,
      forceElevated: true,
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
          onPressed: _navigateToSettings,
        ),
      ],
    );
  }

  void _navigateToSettings() {
    Navigation.push(const SettingsPage());
  }
}
