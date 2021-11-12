import 'package:iif/domain/include.dart';

class LogicOperation {
  final LogicOperationType type;
  final DateTime created;
  final String comment;
  final List<AtomicOperation> atomics;

  //TODO: ask is it a stamp really or it should be a link to Node and change when Node changes too?
  final String categoriesStamp;

  LogicOperation({
    required this.type,
    required this.created,
    required this.comment,
    required this.atomics,
    required this.categoriesStamp,
  });

  factory LogicOperation.initialInput({
    required Account account,
    required Money money,
    String? categoriesStamp,
    DateTime? created,
    String? comment,
  }) =>
      LogicOperation(
        type: LogicOperationType.initialInput,
        created: created ?? DateTime.now(),
        comment: comment ?? "",
        atomics: [
          AtomicOperation(
            money: money,
            type: AtomicOperationType.initialInput,
            account: account,
          )
        ],
        categoriesStamp: categoriesStamp ?? "",
      );

  factory LogicOperation.expense(
    Account account,
    Money money, {
    String? categoriesStamp,
    DateTime? created,
    String? comment,
  }) =>
      LogicOperation(
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
        categoriesStamp: categoriesStamp ?? "",
      );

  factory LogicOperation.income(
    Account account,
    Money money, {
    String? categoriesStamp,
    DateTime? created,
    String? comment,
  }) =>
      LogicOperation(
        type: LogicOperationType.income,
        created: created ?? DateTime.now(),
        comment: comment ?? "",
        atomics: [
          AtomicOperation(
            money: money,
            type: AtomicOperationType.income,
            account: account,
          )
        ],
        categoriesStamp: categoriesStamp ?? "",
      );
}
