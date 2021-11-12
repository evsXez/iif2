import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Subject extends NodeValue with EquatableMixin {
  final String name;
  final SubjectType type;
  final Account? account;
  Subject(this.name, this.type, {this.account});

  @override
  List<Object?> get props => [name, type, account];

  @override
  String toString() => name;
}
