import 'package:iif/domain/include.dart';

class LogicOperation {
  final LogicOperationType type;
  final DateTime created;
  final String comment;
  final List<AtomicOperation> atomics;

  //TODO: ask is it a stamp really or it should be a link to Node and change when Node changes too?
  final String categoriesStamp;
  final String subjectsStamp;

  LogicOperation({
    required this.type,
    required this.created,
    required this.comment,
    required this.atomics,
    required this.categoriesStamp,
    required this.subjectsStamp,
  });

  factory LogicOperation.initialInput({
    required Account account,
    required Money money,
    String? categoriesStamp,
    String? subjectsStamp,
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
        subjectsStamp: subjectsStamp ?? "",
      );

  factory LogicOperation.expense(
    Account account,
    Money money, {
    String? categoriesStamp,
    String? subjectsStamp,
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
        subjectsStamp: subjectsStamp ?? "",
      );

  factory LogicOperation.income(
    Account account,
    Money money, {
    String? categoriesStamp,
    String? subjectsStamp,
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
        subjectsStamp: subjectsStamp ?? "",
      );

  factory LogicOperation.debtIncrease(
    Account account,
    Money money,
    Subject subject, {
    String? categoriesStamp,
    String? subjectsStamp,
    DateTime? created,
    String? comment,
  }) =>
      LogicOperation(
        type: LogicOperationType.debts,
        created: created ?? DateTime.now(),
        comment: comment ?? "",
        atomics: [
          AtomicOperation(
            money: money,
            type: AtomicOperationType.income,
            account: account,
          ),
          AtomicOperation(
            money: money,
            type: AtomicOperationType.expense,
            account: Account(id: 0, name: "0", type: AccountType.money, currency: Currency.debugDefault), //TODO
            // account: subject.account,
          ),
        ],
        categoriesStamp: categoriesStamp ?? "",
        subjectsStamp: subjectsStamp ?? "",
      );
}
