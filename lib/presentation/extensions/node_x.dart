import 'package:iif/domain/include.dart';

extension NodeX<T> on Node<T> {
  Node<T> deepSelected() {
    Node<T> node = this;
    while (node.children.isNotEmpty) {
      try {
        final selectedChild = node.children.firstWhere((it) => it.isSelected);
        node = selectedChild;
      } catch (_) {
        break;
      }
    }

    return node;
  }
}
