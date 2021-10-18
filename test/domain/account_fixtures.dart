import 'package:iif/domain/entities/account.dart';
import 'package:iif/domain/include.dart';

final accountMoney = Account(
  id: -1,
  name: "accountMoney",
  type: AccountType.money,
  currency: Currency.debugDefault,
);

Account getAccount(int id, AccountType type, {bool isArchived = false, String? name}) => Account(
      id: id,
      name: name ?? "account#$id",
      type: type,
      currency: Currency.debugDefault,
      isArchived: isArchived,
    );
