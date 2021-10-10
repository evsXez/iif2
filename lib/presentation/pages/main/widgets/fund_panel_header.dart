import 'package:iif/data/include.dart';
import 'package:iif/presentation/include.dart';

class FundPanelHeader extends StatelessWidget {
  final Money? money;
  final String label;
  final VoidCallback onPressed;

  const FundPanelHeader({
    required this.label,
    required this.money,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ),
            money == null
                ? const SizedBox.shrink()
                : MoneyText(
                    money: money!,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
          ],
        ),
      ),
    );
  }
}
