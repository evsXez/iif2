import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Subject extends NodeValue with EquatableMixin {
  final SubjectType type;
  Subject(int id, String name, this.type) : super(id, name);

  @override
  List<Object?> get props => [name, type];

  Subject.undefined()
      : type = SubjectType.general,
        super(-1, "");

  Subject.template({
    int? id,
    required this.type,
    required String name,
  }) : super(id ?? -1, name);

  @override
  String toString() => name;
}
