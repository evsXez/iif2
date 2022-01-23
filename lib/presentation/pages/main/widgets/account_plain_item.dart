import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

class AccountPlainItem extends StatelessWidget {
  final Account account;
  final Money money;
  final bool isHighlighed;
  const AccountPlainItem({
    required this.account,
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
                account.name,
              ),
            ),
            MoneyText(
              money: money.abs(),
              currency: account.currency,
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
