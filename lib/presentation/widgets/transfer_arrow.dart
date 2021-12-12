import 'package:iif/presentation/include.dart';

class TransferArrow extends StatelessWidget {
  final bool isSmall;
  final Color? color;

  const TransferArrow({
    Key? key,
    required this.isSmall,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? (isSmall ? Style.grayColor : Style.accentColor);

    if (isSmall) {
      return const Icon(
        Icons.arrow_right_alt_outlined,
        size: 20,
      );
    }

    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 20,
            left: 2,
            right: 2,
          ),
          child: Text(
            "⇢",
            style: TextStyle(
              color: color,
              fontSize: 46,
              letterSpacing: -14,
            ),
          ),
        ),
      ],
    );
  }
}
