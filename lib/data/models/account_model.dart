import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class AccountModel extends Account with EquatableMixin {
  AccountModel({
    required int id,
    required String name,
    required AccountType type,
    required Currency currency,
    bool isArchived = false,
  }) : super(
          id: id,
          name: name,
          type: type,
          currency: currency,
          isArchived: isArchived,
        );

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json['id'],
        name: json['name'],
        type: AccountType.values[json['type']],
        currency: Currency(
          code: json['currency']['code'],
          symbol: json['currency']['symbol'],
        ),
        isArchived: json['isArchived'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'type': type.index,
        'currency': {
          'code': currency.code,
          'symbol': currency.symbol,
        },
        'isArchived': isArchived,
      };

  @override
  List<Object?> get props => [id, name, type, currency];
}
