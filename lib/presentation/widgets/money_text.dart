import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

class MoneyText extends StatelessWidget {
  final Money money;
  final Currency? currency;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const MoneyText({
    required this.money,
    this.currency,
    this.color = Style.blackColor,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String full = money.toStringAsPrice(fractionalRequired: true);
    String big = full.substring(0, full.length - 3);
    String small = full.substring(full.length - 2);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          big,
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
        const SizedBox(width: 2),
        Text(
          small,
          style: TextStyle(
            fontSize: fontSize - 6,
            color: color,
            fontWeight: fontWeight,
          ),
        ),
        if (currency != null)
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              currency!.symbol,
              style: TextStyle(
                fontSize: fontSize,
                color: color,
                fontWeight: fontWeight,
              ),
            ),
          ),
      ],
    );
  }
}
