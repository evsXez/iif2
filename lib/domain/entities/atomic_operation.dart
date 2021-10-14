import 'package:iif/domain/entities/enums/atomic_operation_type.dart';
import 'package:iif/domain/include.dart';

class AtomicOperation {
  final Money money;
  final AtomicOperationType type;
  //final Currency currency;
  final Account account;

  AtomicOperation({
    required this.money,
    required this.type,
    required this.account,
  });
}
