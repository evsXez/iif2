import 'package:iif/data/models/account_model.dart';
import 'package:iif/domain/include.dart';

AccountModel accountModel(int id, AccountType type, {String? name, bool isArchived = false}) => AccountModel(
      id: id,
      name: name ?? "accountModel#$id",
      type: type,
      currency: Currency.debugDefault,
      isArchived: isArchived,
    );
