import 'package:flutter/material.dart';
import 'package:iif/presentation/include.dart';

class DateSelector extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  final DateTime initialDate;

  const DateSelector({
    Key? key,
    required this.initialDate,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    _date = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selectDate,
      child: Container(
        padding: const EdgeInsets.all(8),
        // color: Colors.red,
        child: Text(
          _date.toIso8601String().substring(0, 10),
          style: const TextStyle(
            color: Style.blackColor,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  void selectDate() {
    final now = DateTime.now();
    showDatePicker(
            context: context,
            initialDate: _date,
            firstDate: now.subtract(const Duration(days: 365)),
            lastDate: now.add(const Duration(days: 365)))
        .then((d) {
      if (d != null) update(d);
    });
  }

  void update(DateTime date) {
    widget.onDateChanged(date);
    setState(() {
      this._date = date;
    });
  }
}
