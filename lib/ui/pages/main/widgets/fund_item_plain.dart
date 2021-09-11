import 'package:iif/data/include/data_include.dart';
import 'package:iif/ui/include/ui_include.dart';

class FundItemPlain extends StatelessWidget {
  final Fund fund;
  final Money money;
  final bool isHighlighed;
  const FundItemPlain({
    required this.fund,
    required this.money,
    required this.isHighlighed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        color: isHighlighed ? Style.highlightColor : null,
        padding: const EdgeInsets.only(left: 12 + 20.0, top: 8, right: 20, bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                fund.name,
              ),
            ),
            MoneyText(
              money: money,
              currency: fund.currency,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            const SizedBox(width: 45),
          ],
        ),
      ),
    );
  }
}
