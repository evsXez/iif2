import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';

part 'node_selector_state.freezed.dart';

@freezed
abstract class NodeSelectorState<T> with _$NodeSelectorState<T> {
  const factory NodeSelectorState.loading() = Loading;
  const factory NodeSelectorState.loaded(List<NodeRef<T>> refs) = Loaded;
}

class NodeRef<T> {
  final Node<T> node;
  final Node<T> parent;
  NodeRef({
    required this.node,
    required this.parent,
  });
}
