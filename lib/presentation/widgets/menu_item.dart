import 'package:iif/presentation/include.dart';

class MenuItem extends PopupMenuEntry<String> {
  final String title;
  final void Function() onPressed;
  final H = 48.0;
  final Color color;

  MenuItem(this.title, this.onPressed, {this.color = Style.blackColor});

  @override
  State<StatefulWidget> createState() => _MenuItemState();

  @override
  double get height => H;

  @override
  bool represents(String? value) => value == title;
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pop(context);
          widget.onPressed();
        },
        child: option);
  }

  Widget get option => Container(
        height: widget.H,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 16,
              color: widget.color,
            ),
          ),
        ),
      );
}
