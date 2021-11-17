import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

abstract class SubjectsRepository {
  Node<Subject> getSubjects(SubjectType type);
  Subject saveSubject(Subject subjectTemplate, Subject parent);
}
