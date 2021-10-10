import 'package:iif/presentation/include.dart';

class StringField extends StatelessWidget {
  final _controller = TextEditingController();
  final String hint;
  final void Function(String) onChanged;
  final String initialValue;
  final int maxLines;

  StringField({
    required this.hint,
    required this.initialValue,
    required this.onChanged,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key) {
    _controller.text = initialValue;
  }

  String get value => _controller.text;
  bool get isValueEntered => value.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: const TextStyle(fontSize: 14),
      onChanged: onChanged,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.only(bottom: 12),
        border: InputBorder.none,
      ),
      maxLines: maxLines,
    );
  }
}
