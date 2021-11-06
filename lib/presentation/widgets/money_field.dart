import 'dart:math';

import 'package:flutter/services.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/extensions/money_x.dart';
import 'package:iif/presentation/include.dart';

class MoneyField extends StatelessWidget {
  final _controller = TextEditingController();
  final Money? initialValue;
  final void Function(String) onChanged;
  final double fontSize;
  MoneyField({
    required this.initialValue,
    required this.onChanged,
    key,
    this.fontSize = 14,
  }) : super(key: key) {
    _controller.text = initialValue?.toStringAsPrice() ?? "";
  }

  Money get value => MoneyX.fromString(_controller.text);
  bool get isValueEntered => _controller.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 0, 4, 8),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: _controller,
        onChanged: onChanged,
        style: TextStyle(fontSize: fontSize),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: Strings.hint_sum,
          contentPadding: const EdgeInsets.only(bottom: 12),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [MoneyFormatter()],
      ),
    );
  }
}

class MoneyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    debugPrint("old: ${oldValue.text}");
    debugPrint("new: ${newValue.text}");

    // int selectionShift = 3;
    String s = newValue.text;
    if (s.length >= "100 000 000 0000.00".length) return oldValue;

    final isDotEntered = s.contains("..") || s.contains(",.");
    if (isDotEntered) {
      // selectionShift = 2;
      s = s.replaceAll("..", ".");
      s = s.replaceAll(",.", ".");
    }
    debugPrint("s == $s");
    final isFirstDigitAfterDotEntered = s.indexOf(".") == s.length - 4;
    if (isFirstDigitAfterDotEntered) {
      print("first digit entered!");
      // selectionShift = 1;
    }

    final Money money;
    try {
      money = MoneyX.fromString(s);
    } on ExceptionMoneyNotParsed catch (_) {
      return newValue.copyWith(text: "");
    }

    final newText = money.toStringAsPrice();
    final spacesAdded = _spaceCount(newText) - _spaceCount(oldValue.text);

    return newValue.copyWith(
      text: newText,
      // selection: TextSelection.collapsed(offset: newText.length - selectionShift),
      selection:
          TextSelection.collapsed(offset: min(newText.length, max(0, newValue.selection.baseOffset + spacesAdded))),
    );
  }

  int _spaceCount(String s) => s.characters.where((it) => it == " ").length;
}
