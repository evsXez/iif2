part of 'node_selector_bloc.dart';

@freezed
abstract class NodeSelectorState<T> with _$NodeSelectorState<T> {
  const factory NodeSelectorState.loading() = _Loading;
  const factory NodeSelectorState.loaded(List<NodeRef<T>> refs) = _Loaded;
}

class NodeRef<T> {
  final Node<T> node;
  NodeRef(this.node);
}
