import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Account with EquatableMixin {
  final int id;
  final String name;
  final AccountType type;
  final Currency currency;
  final bool isArchived;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    this.isArchived = false,
  });

  @override
  List<Object?> get props => [id, name, type, currency, isArchived];
}
