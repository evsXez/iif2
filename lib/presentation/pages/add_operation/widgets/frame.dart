import 'package:iif/presentation/include.dart';

class Frame extends StatelessWidget {
  final Widget child;
  const Frame({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 80,
        child: child,
      ),
    );
  }
}
