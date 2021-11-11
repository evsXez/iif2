import 'package:iif/domain/include.dart';

class LogicOperation {
  final LogicOperationType type;
  final DateTime created;
  final String comment;
  final List<AtomicOperation> atomics;

  LogicOperation({
    required this.type,
    required this.created,
    required this.comment,
    required this.atomics,
  });

  factory LogicOperation.initialInput(Account account, Money money, {DateTime? created}) => LogicOperation(
        type: LogicOperationType.initialInput,
        created: created ?? DateTime.now(),
        comment: "",
        atomics: [
          AtomicOperation(
            money: money,
            type: AtomicOperationType.initialInput,
            account: account,
          )
        ],
      );

  factory LogicOperation.expense(Account account, Money money, {DateTime? created, String? comment}) => LogicOperation(
        type: LogicOperationType.expense,
        created: created ?? DateTime.now(),
        comment: comment ?? "",
        atomics: [
          AtomicOperation(
            money: money,
            type: AtomicOperationType.expense,
            account: account,
          )
        ],
      );
}
