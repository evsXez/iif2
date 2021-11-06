import 'dart:collection';
import 'dart:convert';

import 'package:iif/domain/entities/category_node.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/blocs/category_selector_bloc/category_selector_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/widgets/editable_chip.dart';
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
                    child: _Chip(
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

class _Chip extends StatelessWidget {
  final CategoryNode node;
  final VoidCallback onTap;
  final Function(String text) onSave;
  final VoidCallback onDelete;
  final VoidCallback onLongPress;
  const _Chip({
    Key? key,
    required this.node,
    required this.onTap,
    required this.onSave,
    required this.onDelete,
    required this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (node.isEditing) {
      return EditableChip(
        initialText: node.category.name == "+" ? null : node.category.name,
        doneEditing: (text) {
          if (text.isEmpty) {
            onDelete();
          } else {
            onSave(text);
          }
        },
      );
    }

    return GestureDetector(
      onLongPress: () {
        if (!node.isLocked) {
          onLongPress();
        } else {
          print("locked: $node");
        }
      },
      child: ChoiceChip(
        label: Text(
          node.category.name,
          style: TextStyle(
            color: node.isSelected ? Style.whiteColor : Style.blackColor,
          ),
        ),
        selected: node.isSelected,
        backgroundColor: Style.grayColor.withAlpha(25),
        selectedColor: Style.accentColor,
        shadowColor: Style.blackColor,
        onSelected: (_) => onTap(),
      ),
    );
  }
}


    // if (isCollapsed) return collapsedItem;

    // List<Widget> items = [];
    // for (int i = 0; i < roots.length; i++) {
    //   items.addAll(listForLevel(i));
    // }

    // return Container(
    //   //margin: EdgeInsets.symmetric(horizontal: 8),
    //   child: GestureDetector(
    //     onTap: () {
    //       //print("tap on clear field");
    //       setState(() {
    //         levelInEditMode = null;
    //         chipTextInDeleteMode = null;
    //         chipLevelInDeleteMode = null;
    //       });
    //     },
    //     child: Stack(
    //       children: [
    //         Container(
    //           decoration: null, //itemDecorationUserInput,
    //           //padding: EdgeInsets.only(top: 8),
    //           //color: Colors.lightBlue.withAlpha(70),
    //           // height: (3.4)*40.0,
    //           constraints: BoxConstraints(maxHeight: 6 * 40.0),
    //           //alignment: Alignment.topLeft,
    //           margin: EdgeInsets.only(top: 8),
    //           child: Wrap(
    //             // controller: scrollController,
    //             // padding: EdgeInsets.only(top: 10),
    //             //crossAxisAlignment: CrossAxisAlignment.start,
    //             children: items,
    //           ),
    //         ),
    //         Row(children: [
    //           title,
    //           widget.isObject ? buttonCollapse : SizedBox.shrink(),
    //         ])
    //       ],
    //     ),
    //   ),
    // );
  // }

  // CategoryType? selectedCategory() {
  //   if (roots.length > 1 && roots[1] == categoryNameExpense) return CategoryType.expense;
  //   if (roots.length > 1 && roots[1] == categoryNameIncome) return CategoryType.income;
  //   if (roots.length > 1 && roots[1] == categoryNameTransfer) return CategoryType.transfer;
  //   if (roots.length > 2 && roots[1] == categoryNameDebts) {
  //     if (roots[2] == categoryNameDebtsNew) return CategoryType.debtNew;
  //     if (roots[2] == categoryNameDebtsReturn) return CategoryType.debtReturn;
  //     if (roots[2] == categoryNameDebtsToMe) return CategoryType.debtToMe;
  //     if (roots[2] == categoryNameDebtsReturnedToMe) return CategoryType.debtReturnedToMe;
  //   }
  //   return null;
  // }

  // Widget get buttonCollapse => Expanded(
  //         child: Align(
  //       alignment: Alignment.centerRight,
  //       child: Container(
  //         height: 25,
  //         child: FlatButton(
  //           //color: Colors.red,
  //           onPressed: () {
  //             setState(() {
  //               isCollapsed = true;
  //             });
  //           },
  //           child: Text(Strings.label_hide,
  //               style: TextStyle(
  //                 color: Style.accentColor,
  //               )),
  //         ),
  //       ),
  //     ));

  // Widget get collapsedItem => GestureDetector(
  //       onTap: () {
  //         setState(() {
  //           isCollapsed = false;
  //         });
  //       },
  //       child: Row(
  //         children: [
  //           Container(
  //             width: 200,
  //             height: 35,
  //             child: Align(alignment: Alignment.centerLeft, child: title),
  //           ),
  //         ],
  //       ),
  //     );

  // Widget get title => Padding(
  //     padding: const EdgeInsets.only(left: 8.0, bottom: 4),
  //     child: widget.isObject
  //         ? (isCollapsed
  //             ? Text(
  //                 Strings.title_object_collapsed,
  //                 style: TextStyle(
  //                   color: Style.accentColor,
  //                 ),
  //               )
  //             : Text(Strings.title_object))
  //         : Text("" /*Strings.title_category*/));

  // List<Widget> listForLevel(int level) {
  //   final String? master = level >= roots.length ? null : roots[level];
  //   if (master == null)
  //     return [
  //       Align(
  //         alignment: Alignment.topLeft,
  //         child: chip("+null", level),
  //       )
  //     ];

  //   if (level < roots.length - 2) return []; //SizedBox.shrink();

  //   final levelData = data.where((it) {
  //     final sameBase = roots.length > 1 ? it.base == roots[1] : true;
  //     return it.master == master && sameBase;
  //   }).toList();
  //   try {
  //     final itemToMove = levelData.firstWhere((it) => it.master == master && it.slave == roots.last);
  //     if (itemToMove != null) {
  //       //levelData.remove(itemToMove);
  //       levelData.clear();

  //       // Timer(Duration(milliseconds: 100), () {
  //       //   scrollControllerForLevel[level].jumpTo(scrollControllerForLevel[level].position.maxScrollExtent);
  //       // });

  //     }
  //   } catch (e) {}
  //   if (level == roots.length - 2) {
  //     for (int i = roots.length - 1; i > 0; i--) {
  //       final currentMaster = roots[i - 1];
  //       final current = roots[i];
  //       levelData.insert(0, Category(base: roots[1], master: currentMaster, slave: current));
  //       selected[master]?.add(current);
  //     }
  //   }

  //   final isTransferCategoryFinal = (level == 1) && roots[1] == categoryNameTransfer && !widget.isObject;
  //   final isDebtsCategoryFinal = (level == 2) && roots[1] == categoryNameDebts && !widget.isObject;
  //   final isBaseCategory = master == categoryNameRoot && !widget.isObject;
  //   final isDebtsSubcategory = (master == categoryNameDebts) && !widget.isObject && (level == 1);
  //   final isLastLevel = (level == roots.length - 1);
  //   final addOnThisLevel =
  //       isLastLevel && !isBaseCategory && !isDebtsSubcategory && !isDebtsCategoryFinal && !isTransferCategoryFinal;

  //   return List<Widget>.generate(levelData.length + (addOnThisLevel ? 1 : 0), (int index) {
  //     return (index < levelData.length) ? chip(levelData[index].slave, level) : chip("+", level);
  //   });
  // }

  // void doneEditingChip(String s, String master) {
  //   //print("done: '$s'");
  //   setState(() {
  //     levelInEditMode = null;
  //     if (s.isNotEmpty) {
  //       addCategory(Category(base: roots.length > 1 ? roots[1] : categoryNameRoot, master: master, slave: s));
  //     }
  //   });
  // }

  // void addCategory(Category category) async {
  //   data.add(category);
  //   print("//TODO: Category.insert($category)");
  //   // await category.insert(widget.isObject ? SubcategoryObject.TABLE_NAME : Subcategory.TABLE_NAME);
  // }

  // void removeCategory(Category category) async {
  //   data.remove(category);
  //   print("//TODO: Category.delete($category)");
  //   // await category.delete(widget.isObject ? SubcategoryObject.TABLE_NAME : Subcategory.TABLE_NAME);
  // }

  // bool isPredefinedCategory(String master, String text) {
  //   try {
  //     mapPredefinedCategories.firstWhere((it) => it.key == master && it.value == text);
  //     return true;
  //   } catch (e) {
  //     return false;
  //   }
  // }

//   Widget chip(String text, int level) {
//     final String master = roots.length > level ? roots[level] : categoryNameRoot;
//     final isAdd = text == "+";
//     final isAddEditing = isAdd && levelInEditMode == level;
//     final isSelected = (master != null ? (selected[master]?.contains(text) ?? false) : false);

//     if (isAddEditing) {
//       return EditableChip(
//         initialText: "",
//         doneEditing: (s) {
//           doneEditingChip(s, master);
//           if (s.length > 0) {
//             setState(() {
//               selected[master] = [s];
//               roots.add(s);
//               widget.onCategoryChanged(selectedCategory());
//             });
//           }
//         },
//       );
//     }

//     if (chipTextInDeleteMode == text && chipLevelInDeleteMode == level) {
//       return EditableChip(
//         doneEditing: (s) {
//           setState(() {
//             chipTextInDeleteMode = null;
//             chipLevelInDeleteMode = null;
//             //selected[master].clear();
//             roots.removeRange(level + 1, roots.length);
//             try {
//               final categoryToRemove = data.firstWhere((it) => it.master == master && it.slave == text);
//               removeCategory(categoryToRemove);
//             } catch (_) {}
//             //widget.update(returnValue); //TODO: error: dirty selected, need clear for master, but this is very dirty
//           });
//         },
//         initialText: text,
//       );
//     }

//     return GestureDetector(
//       onLongPress: () {
//         //print("Long press on '$text'");
//         if (!isPredefinedCategory(master, text)) {
//           setState(() {
//             chipTextInDeleteMode = text;
//             chipLevelInDeleteMode = level;
//           });
//         }
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(left: 8.0, right: 0.0),
//         child: ChoiceChip(
//           label: Text(text,
//               style: TextStyle(
//                 color: isSelected ? Style.whiteColor : Style.blackColor,
//               )),
//           selected: isSelected,
//           backgroundColor: Style.grayColor.withAlpha(25),
//           selectedColor: Style.accentColor,
//           shadowColor: Style.blackColor,
//           onSelected: (bool s) {
//             if (s) {
//               setState(() {
//                 if (isAdd) {
//                   //print("click on add [level: $level]");
//                   levelInEditMode = level;
//                   selected.remove(master);
//                   roots.removeRange(level + 1, roots.length);

//                   // final sc = scrollControllerForLevel[level];
//                   // if (sc != null) {
//                   //   sc.animateTo(sc.position.maxScrollExtent+200, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
//                   // }
//                 } else {
//                   //print("[$level] selected: $master: $text");
//                   levelInEditMode = null;
//                   if (true || level == roots.length - 1) {
//                     //final int updateLevel = level+1;
//                     //print("update level [${level+1}]");
//                     roots.removeRange(level + 1, roots.length);
//                     if (data.map((it) => it.master).contains(text)) {
//                       roots.add(text);
//                       //remove all from selected, add roots on their levels
//                       selected.clear();
//                       for (int i = 0; i < roots.length - 1; i++) {
//                         selected[roots[i]] = [roots[i + 1]];
//                       }
//                     } else {
//                       //print("selected leaf with no childs");
//                       roots.add(text);
//                     }

//                     // final sc = scrollControllerForLevel[level+1];
//                     // if (sc != null) {
//                     //   sc.animateTo(sc.position.maxScrollExtent+200, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
//                     // }
//                   }
//                   selected[master] = [text];
//                   // scrollController.animateTo(scrollController.position.maxScrollExtent+100, duration: Duration(milliseconds: 500), curve: Curves.easeOut);
//                 }
//               });
//             } else {
//               setState(() {
//                 //print("deselect: [$level]: $text");
//                 final int deselectedLevel = roots.indexOf(text);
//                 if (deselectedLevel > 0) {
//                   final deselectedMaster = roots[deselectedLevel - 1];
//                   for (int i = deselectedLevel - 1; i < roots.length; i++) {
//                     selected.remove(roots[i]);
//                   }
//                   roots.removeRange(deselectedLevel + 1 - 1, roots.length);
//                 }
//               });
//             }
//             widget.onCategoryChanged(selectedCategory());
//           },
//         ),
//       ),
//     );
//   }
// }

