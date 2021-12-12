import 'dart:math';

import 'package:flutter/services.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

class MoneyField extends StatelessWidget {
  final _controller = TextEditingController();
  final Money? initialValue;
  final void Function(String) onChanged;
  final double fontSize;
  final String? hintText;
  MoneyField({
    required this.initialValue,
    required this.onChanged,
    key,
    this.hintText,
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
        style: TextStyle(
          fontSize: fontSize,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText ?? Strings.hint_sum,
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
    String newValueText = newValue.text.replaceAll(",", ".");
    if (newValueText.length >= "100 000 000 0000.00".length) return oldValue;

    if (newValueText.characters.where((it) => it == ".").length > 1) return oldValue;

    final Money money;
    try {
      money = MoneyX.fromString("0" + newValueText);
    } on ExceptionMoneyNotParsed catch (_) {
      return newValue.copyWith(text: "");
    }

    final newText = money.toStringAsPrice(fractionalRequired: newValueText.contains("."));
    final spacesAdded = _spaceCount(newText) - _spaceCount(oldValue.text);

    return newValue.copyWith(
      text: newText,
      selection: (newText == "0.00" && !(oldValue.selection.baseOffset == 2 && newValue.selection.baseOffset == 3))
          ? const TextSelection.collapsed(offset: 2)
          : TextSelection.collapsed(offset: min(newText.length, max(0, newValue.selection.baseOffset + spacesAdded))),
    );
  }

  int _spaceCount(String s) => s.characters.where((it) => it == " ").length;
}
