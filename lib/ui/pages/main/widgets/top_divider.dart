import 'package:iif/ui/include.dart';

class TopDivider extends StatelessWidget {
  const TopDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      color: Colors.grey,
      height: 0.5,
    );
  }
}
