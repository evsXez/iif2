import 'package:iif/domain/include.dart';
import 'package:iif/presentation/blocs/node_selector_bloc/node_selector_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/category_chip.dart';
import 'package:iif/presentation/pages/main/widgets/account_item.dart';

class NodeSelector<T extends NodeValue> extends StatefulWidget {
  final dynamic Function(String text, Node<NodeValue> parent) valueBuilder;
  const NodeSelector({
    Key? key,
    required this.valueBuilder,
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
                        onTap: () {
                          bloc.tap(ref.node);
                        },
                        onSave: (text) {
                          bloc.save(ref.node, widget.valueBuilder, text);
                        },
                        onDelete: () {
                          bloc.delete(ref.node);
                        },
                        onLongPress: () {
                          bloc.edit(ref.node);
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
