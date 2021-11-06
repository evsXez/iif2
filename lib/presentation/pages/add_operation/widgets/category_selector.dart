import 'package:iif/presentation/blocs/category_selector_bloc/category_selector_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/category_chip.dart';
import 'package:iif/presentation/pages/main/widgets/account_item.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorySelectorBloc, CategorySelectorState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<CategorySelectorBloc>(context);
        return state.map(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) => Wrap(
            children: state.categories
                .map(
                  (ref) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CategoryChip(
                        node: ref.node,
                        onTap: () {
                          bloc.tap(ref.node);
                        },
                        onSave: (text) {
                          bloc.save(ref.node, text);
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
