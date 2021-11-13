import 'package:iif/data/include.dart';
import 'package:iif/data/models/account_model.dart';
import 'package:iif/data/models/atomic_operation_model.dart';
import 'package:iif/domain/include.dart';

AccountModel accountModel(int id, AccountType type, {String? name, bool isArchived = false}) => AccountModel(
      id: id,
      name: name ?? "accountModel#$id",
      type: type,
      currency: Currency.debugDefault,
      isArchived: isArchived,
    );

AtomicOperationModel atomicOperationModel(int id, AtomicOperationType type, Money money, AccountModel accountModel) =>
    AtomicOperationModel(
      id: id,
      moneyModel: moneyModel(money),
      type: type,
      accountModel: accountModel,
    );

MoneyModel moneyModel(Money money) => MoneyModel(coins: money.coins);
