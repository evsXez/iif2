import 'package:equatable/equatable.dart';
import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';

class LogicOperationModel extends LogicOperation with EquatableMixin {
  final int id;
  final List<AtomicOperationModel> atomicsModel;

  LogicOperationModel({
    required this.id,
    required LogicOperationType type,
    required DateTime created,
    required String comment,
    required this.atomicsModel,
    String categoriesStamp = "",
    String subjectsStamp = "",
  }) : super(
          type: type,
          created: created,
          comment: comment,
          atomics: atomicsModel,
          categoriesStamp: categoriesStamp,
          subjectsStamp: subjectsStamp,
        );

  factory LogicOperationModel.fromJson(Map<String, dynamic> json) => LogicOperationModel(
        id: json['id'],
        type: LogicOperationType.values[json['type']],
        created: DateTime.fromMillisecondsSinceEpoch(json['createdTs']),
        comment: json['comment'],
        categoriesStamp: json['categoriesStamp'],
        subjectsStamp: json['subjectsStamp'],
        atomicsModel: (json['atomics'] as List<dynamic>).map((it) => AtomicOperationModel.fromJson(it)).toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type.index,
        'createdTs': created.millisecondsSinceEpoch,
        'comment': comment,
        'categoriesStamp': categoriesStamp,
        'subjectsStamp': subjectsStamp,
        'atomics': atomicsModel.map((it) => it.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, atomicsModel];
}
