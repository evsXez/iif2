import 'package:iif/domain/include.dart';

class MoneyModel extends Money {
  MoneyModel({required int coins}) : super(coins: coins);

  factory MoneyModel.fromJson(Map<String, dynamic> json) => MoneyModel(
        coins: json['coins'],
      );

  Map<String, dynamic> toJson() => {
        'coins': coins,
      };
}
