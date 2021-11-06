import 'package:flutter/material.dart';
import 'package:iif/presentation/include.dart';

class YearSelector extends StatefulWidget {
  final int initialYear;
  final Function(int) onYearChanged;

  const YearSelector({
    Key? key,
    required this.initialYear,
    required this.onYearChanged,
  }) : super(key: key);

  @override
  _YearSelectorState createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector> {
  late int selected;
  final currentYear = DateTime.now().year;

  void initState() {
    super.initState();
    selected = widget.initialYear;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      // color: Colors.yellow,
      child: DropdownButton<int>(
        value: selected,
        onChanged: update,
        underline: SizedBox.shrink(),
        icon: SizedBox.shrink(),
        isExpanded: true,
        selectedItemBuilder: (context) => List.generate(3,
            (idx) => Center(child: yearOf(idx, color: Style.blackColor, fontWeight: FontWeight.normal, fontSize: 12))),
        items: List.generate(
            3,
            (idx) => DropdownMenuItem(
                  value: valueOf(idx),
                  child: yearOf(idx),
                )),
      ),
    );
  }

  int valueOf(int idx) => currentYear - 1 + idx;

  Widget yearOf(int idx,
      {Color color = Style.blackColor, FontWeight fontWeight = FontWeight.normal, double? fontSize}) {
    final formatted = "${valueOf(idx)}";
    return Text(
      formatted,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }

  void update(int? year) {
    if (year == null) {
      return;
    }

    widget.onYearChanged(year);
    setState(() {
      selected = year;
    });
  }
}
