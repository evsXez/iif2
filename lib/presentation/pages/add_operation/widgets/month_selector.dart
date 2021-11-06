import 'package:flutter/material.dart';
import 'package:iif/presentation/include.dart';
import 'package:intl/intl.dart';

class MonthSelector extends StatefulWidget {
  final int initialMonth;
  final Function(int) onMonthChanged;

  const MonthSelector({
    Key? key,
    required this.initialMonth,
    required this.onMonthChanged,
  }) : super(key: key);

  @override
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  late int selected;

  void initState() {
    super.initState();
    selected = widget.initialMonth - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      // color: Colors.green,
      child: DropdownButton<int>(
        value: selected,
        onChanged: update,
        underline: SizedBox.shrink(),
        icon: SizedBox.shrink(),
        isExpanded: true,
        selectedItemBuilder: (context) => List.generate(12,
            (idx) => Center(child: monthOf(idx, color: Style.blackColor, fontWeight: FontWeight.normal, fontSize: 12))),
        items: List.generate(
            12,
            (idx) => DropdownMenuItem(
                  value: idx,
                  child: monthOf(idx),
                )),
      ),
    );
  }

  Widget monthOf(int idx,
      {Color color = Style.blackColor, FontWeight fontWeight = FontWeight.normal, double? fontSize}) {
    final formatted = DateFormat.MMMM("ru").format(DateTime(0, idx + 1));
    return Text(
      formatted,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }

  void update(int? month) {
    if (month == null) {
      return;
    }

    widget.onMonthChanged(month + 1);
    setState(() {
      selected = month;
    });
  }
}
