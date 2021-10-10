import 'package:iif/presentation/include.dart';

class LabelButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const LabelButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: 40,
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        Strings.button_add_account,
        style: const TextStyle(
          color: Style.accentColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
