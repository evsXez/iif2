import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/subjects_repository.dart';

//TODO: untested
class SubjectsRepositoryImpl extends SubjectsRepository {
  final DataSource _dataSource;

  SubjectsRepositoryImpl(this._dataSource);

  Node<Subject> _withChildren(List<SubjectModel> list, Node<Subject> parent) {
    final nodes = list.where((model) => model.id != model.parentId && model.parentId == parent.value?.id).map(
          (it) => _withChildren(
            list,
            Node<Subject>(value: it, children: []),
          ),
        );
    if (nodes.isNotEmpty) {
      parent.children.addAll(nodes);
    }
    return parent;
  }

  @override
  Node<Subject> getSubjects(SubjectType type) {
    final List<SubjectModel> list = _dataSource.getSubjects().where((it) => it.type == type).toList();

    final rootModel = list.firstWhere((it) => it.id == it.parentId);
    final result = _withChildren(
      list,
      Node<Subject>(
        value: rootModel,
        children: [],
        type: NodeType.root,
        canHaveMoreChildren: true,
      ),
    );

    return result;
  }

  @override
  Subject? getSubjectForId(int? id) {
    try {
      final result = _dataSource.getSubjects().where((it) => it.id == id).first;
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Subject saveSubject(Subject template, Subject parent) {
    if (template.id >= 0) {
      final subjects = _dataSource.getSubjects();
      if (subjects.any((it) => it.id == template.id)) {
        _dataSource.updateSubject(template);
        return template;
      }
    }

    return _dataSource.addSubject(template, parent);
  }
}
