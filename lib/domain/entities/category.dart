import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Category extends NodeValue with EquatableMixin {
  final int id;
  final String name;
  final CategoryType type;
  Category(this.id, this.name, this.type);

  Category.undefined()
      : id = -1,
        name = "",
        type = CategoryType.undefined;

  Category.template({
    this.name = "",
    this.type = CategoryType.undefined,
  }) : id = -1;

  @override
  List<Object?> get props => [id, name, type];

  @override
  String toString() => name;
}
