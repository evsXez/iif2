import 'package:iif/domain/include.dart';

class CategoryModel extends Category {
  final int parentId;

  CategoryModel({
    required this.parentId,
    required int id,
    required String name,
    required CategoryType type,
  }) : super(id, name, type);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'],
        parentId: json['parentId'],
        name: json['name'],
        type: CategoryType.values[json['type']],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'parentId': parentId,
        'name': name,
        'type': type.index,
      };
}
