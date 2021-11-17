import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class AccountModel extends Account with EquatableMixin {
  final int? subjectId;

  AccountModel({
    this.subjectId,
    required int id,
    required String name,
    required AccountType type,
    required Currency currency,
    bool isArchived = false,
    bool isDeleted = false,
  }) : super(
          id: id,
          name: name,
          type: type,
          currency: currency,
          isArchived: isArchived,
          isDeleted: isDeleted,
        );

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        id: json['id'],
        subjectId: json['subjectId'],
        name: json['name'],
        type: AccountType.values[json['type']],
        currency: Currency(
          code: json['currency']['code'],
          symbol: json['currency']['symbol'],
        ),
        isArchived: json['isArchived'],
        isDeleted: json['isDeleted'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectId': subjectId,
        'name': name,
        'type': type.index,
        'currency': {
          'code': currency.code,
          'symbol': currency.symbol,
        },
        'isArchived': isArchived,
        'isDeleted': isDeleted,
      };

  @override
  List<Object?> get props => [id, subjectId, name, type, currency];

  factory AccountModel.fromAccount(Account ref, {required int? subjectId}) => AccountModel(
        id: ref.id,
        name: ref.name,
        type: ref.type,
        currency: ref.currency,
        isArchived: ref.isArchived,
        isDeleted: ref.isDeleted,
        subjectId: subjectId,
      );
}
