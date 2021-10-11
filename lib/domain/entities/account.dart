import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Account with EquatableMixin {
  final String name;
  final AccountType type;
  final Currency currency;
  final bool isArchived;

  Account({
    required this.name,
    required this.type,
    required this.currency,
    this.isArchived = false,
  });

  @override
  List<Object?> get props => [name, type, currency];
}
