import 'package:iif/domain/include.dart';

class CategoryModel extends Category {
  CategoryModel({
    required int id,
    required String name,
    required CategoryType type,
  }) : super(id, name, type);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        name: json['name'],
        type: CategoryType.values[json['type']],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type.index,
      };
}
