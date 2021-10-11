import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class AccountBalance with EquatableMixin {
  final Account account;
  final Money money;

  AccountBalance(this.account, this.money);

  @override
  List<Object?> get props => [account, money];
}
