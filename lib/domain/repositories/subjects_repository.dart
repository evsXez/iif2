import 'package:iif/domain/include.dart';

abstract class SubjectsRepository {
  Node<Subject> getSubjects(SubjectType type);
  Subject? getSubjectForId(int? id);
  Subject saveSubject(Subject subjectTemplate, Subject parent);
}
