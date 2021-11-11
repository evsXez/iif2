import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class AccountingObject with EquatableMixin {
  final AccountingObjectType type;
  final String name;

  AccountingObject({
    required this.type,
    required this.name,
  });

  @override
  List<Object?> get props => [type, name];
}
