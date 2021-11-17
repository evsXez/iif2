import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Category extends NodeValue with EquatableMixin {
  final CategoryType type;
  Category(int id, String name, this.type) : super(id, name);

  Category.undefined()
      : type = CategoryType.undefined,
        super(-1, "");

  Category.template({
    int? id,
    String name = "",
    this.type = CategoryType.undefined,
  }) : super(id ?? -1, name);

  @override
  List<Object?> get props => [id, name, type];

  @override
  String toString() => "id:$id name:$name";
}
