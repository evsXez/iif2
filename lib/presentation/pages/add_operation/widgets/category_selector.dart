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
  late CategorySelectorBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = CategorySelectorBloc(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategorySelectorBloc, CategorySelectorState>(
      bloc: _bloc,
      builder: (context, state) {
        return state.map(
          loading: (_) => const Center(child: CircularProgressIndicator()),
          loaded: (state) => Wrap(
            children: state.categories
                .map(
                  (ref) => Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CategoryChip(
                        node: ref.node,
                        onTap: () {
                          _bloc.tap(ref.node);
                        },
                        onSave: (text) {
                          _bloc.save(ref.node, text);
                        },
                        onDelete: () {
                          _bloc.delete(ref.node);
                        },
                        onLongPress: () {
                          _bloc.edit(ref.node);
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
