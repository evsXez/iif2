import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Subject extends NodeValue with EquatableMixin {
  final SubjectType type;
  // final Account account;
  Subject(int id, String name, this.type) : super(id, name);

  @override
  List<Object?> get props => [name, type];

  Subject.undefined()
      : type = SubjectType.general,
        // account = Account.template(type: AccountType.money, name: ""),
        super(-1, "");

  Subject.template({
    int? id,
    required this.type,
    required String name,
  }) :
        // account = Account.template(type: AccountType.money, name: ""),
        super(id ?? -1, name);

  @override
  String toString() => name;
}

// class DebtSubject extends Subject {
//   final Account account;
// }
