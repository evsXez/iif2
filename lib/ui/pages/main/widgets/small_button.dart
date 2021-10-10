import 'package:iif/ui/include.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const SmallButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Style.accentColor,
      minWidth: 40,
      height: 25,
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        label,
        style: const TextStyle(
          color: Style.whiteColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
