import 'package:iif/main.dart';
import 'package:iif/presentation/include.dart';

class Navigation {
  static void pop() => globalNavigatorKey.currentState?.pop();

  static void push(Widget page) => globalNavigatorKey.currentState
      ?.push(MaterialPageRoute(builder: (ctx) => page, settings: RouteSettings(name: _name(page))));

  static void replace(Widget page) => globalNavigatorKey.currentState
      ?.pushReplacement(MaterialPageRoute(builder: (ctx) => page, settings: RouteSettings(name: _name(page))));

  static void navigationPushAsRoot(Widget page) => globalNavigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => page, settings: RouteSettings(name: _name(page))), (_) => false);

  static String _name(Widget page) => page.runtimeType.toString();
}
