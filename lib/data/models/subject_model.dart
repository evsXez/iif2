import 'package:iif/domain/include.dart';

class SubjectModel extends Subject {
  final int parentId;

  SubjectModel({
    required this.parentId,
    required int id,
    required String name,
    required SubjectType type,
  }) : super(id, name, type);

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        id: json['id'],
        parentId: json['parentId'],
        name: json['name'],
        type: SubjectType.values[json['type']],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'parentId': parentId,
        'name': name,
        'type': type.index,
      };
}
