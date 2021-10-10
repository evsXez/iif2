import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'presentation/include.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final theme = ThemeData();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorKey: globalNavigatorKey,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          secondary: Style.accentColor,
          primary: Colors.grey,
        ),
        primaryColor: Style.blackColor,
        primaryColorDark: Style.whiteColor,
      ),
      home: const MainPage(),
    ),
  );
}
