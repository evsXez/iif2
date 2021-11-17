import 'package:iif/domain/include.dart';
import 'package:iif/presentation/blocs/node_selector_bloc/node_selector_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/node_chip.dart';
import 'package:iif/presentation/pages/main/widgets/account_item.dart';

class NodeSelector<T extends NodeValue> extends StatefulWidget {
  // final dynamic Function(String text, Node<NodeValue> parent) valueBuilder;
  final StyleNodeColorSheme colorScheme;
  final T reference;

  const NodeSelector({
    Key? key,
    // required this.valueBuilder,
    required this.reference,
    required this.colorScheme,
  }) : super(key: key);

  @override
  _NodeSelectorState createState() => _NodeSelectorState<T>();
}

class _NodeSelectorState<T extends NodeValue> extends State<NodeSelector> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NodeSelectorBloc<T>, NodeSelectorState<T>>(
      builder: (context, state) {
        final bloc = BlocProvider.of<NodeSelectorBloc<T>>(context);
        return state.map(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) => Wrap(
            children: state.refs
                .map(
                  (ref) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: NodeChip(
                        node: ref.node,
                        colorScheme: widget.colorScheme,
                        onTap: () {
                          bloc.tap(ref);
                        },
                        onSave: (text) {
                          bloc.save(ref, text, widget.reference);
                          // bloc.save(ref.node, widget.valueBuilder, text);
                        },
                        onDelete: () {
                          bloc.delete(ref);
                        },
                        onLongPress: () {
                          bloc.edit(ref);
                        }),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
