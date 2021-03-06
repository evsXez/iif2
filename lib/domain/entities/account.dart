import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Account with EquatableMixin {
  final int id;
  final String name;
  final AccountType type;
  final Currency currency;

  final bool isArchived;
  final bool isDeleted;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.currency,
    this.isArchived = false,
    this.isDeleted = false,
  });

  factory Account.template({
    required AccountType type,
    required String name,
  }) =>
      Account(
        id: -1,
        name: name,
        type: type,
        currency: Currency.debugDefault,
      );

  @override
  List<Object?> get props => [id, name, type, currency, isArchived, isDeleted];
}
