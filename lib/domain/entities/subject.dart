import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Subject extends NodeValue with EquatableMixin {
  final String name;
  final SubjectType type;
  final Account account;
  Subject(this.name, this.type, this.account);

  @override
  List<Object?> get props => [name, type, account];

  Subject.undefined()
      : name = "",
        type = SubjectType.general,
        account = Account.template(type: AccountType.money, name: "");

  @override
  String toString() => name;
}

// class DebtSubject extends Subject {
//   final Account account;
// }
