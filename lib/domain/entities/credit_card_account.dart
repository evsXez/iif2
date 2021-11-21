import 'package:iif/domain/include.dart';

class CreditCardAccount extends Account {
  final Money limit;

  CreditCardAccount({
    required int id,
    required String name,
    required Currency currency,
    required this.limit,
  }) : super(
          id: id,
          name: name,
          currency: currency,
          type: AccountType.creditCards,
        );

  @override
  List<Object?> get props => [id, name, type, currency, isArchived, isDeleted, limit];
}
