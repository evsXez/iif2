import 'package:equatable/equatable.dart';
import 'package:iif/data/include.dart';
import 'package:iif/domain/include.dart';

class AtomicOperationModel extends AtomicOperation with EquatableMixin {
  final int id;
  final AccountModel accountModel;
  final MoneyModel moneyModel;

  AtomicOperationModel({
    required this.id,
    required this.moneyModel,
    required AtomicOperationType type,
    required this.accountModel,
  }) : super(
          money: moneyModel,
          type: type,
          account: accountModel,
        );

  factory AtomicOperationModel.fromJson(Map<String, dynamic> json) => AtomicOperationModel(
        id: json['id'],
        moneyModel: MoneyModel.fromJson(json['money']),
        type: AtomicOperationType.values[json['type']],
        accountModel: AccountModel.fromJson(json['account']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'money': moneyModel.toJson(),
        'type': type.index,
        'account': accountModel.toJson(),
      };

  @override
  List<Object?> get props => [id, accountModel, moneyModel];
}
