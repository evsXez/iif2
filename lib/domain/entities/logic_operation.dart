import 'package:iif/domain/include.dart';
import 'package:iif/misc/resources/strings.dart';

class LogicOperation {
  final LogicOperationType type;
  final DateTime created;
  final String comment;
  final List<AtomicOperation> atomics;

  //Subject? subject; //general

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
    // String? categoriesStamp,
    // String? subjectsStamp,
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
        categoriesStamp: account.type == AccountType.debts || account.type == AccountType.loans
            ? Strings.category_initial_input_debt
            : Strings.category_initial_input,
        subjectsStamp: "",
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

  factory LogicOperation.transfer(
    Account accountFrom,
    Account accountTo,
    Money money, {
    String? categoriesStamp,
    String? subjectsStamp,
    DateTime? created,
    String? comment,
  }) =>
      LogicOperation(
        type: LogicOperationType.transfer,
        created: created ?? DateTime.now(),
        comment: comment ?? "",
        atomics: [
          AtomicOperation(
            money: money,
            type: AtomicOperationType.expense,
            account: accountFrom,
          ),
          AtomicOperation(
            money: money,
            type: AtomicOperationType.income,
            account: accountTo,
          ),
        ],
        categoriesStamp: categoriesStamp ?? "",
        subjectsStamp: subjectsStamp ?? "",
      );

  factory LogicOperation.debtIncrease(
    Account account,
    Money money,
    Account debtAccount, {
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
            account: debtAccount,
          ),
        ],
        categoriesStamp: categoriesStamp ?? "",
        subjectsStamp: subjectsStamp ?? "",
      );

  factory LogicOperation.debtDecrease(
    Account account,
    Money money,
    Account debtAccount, {
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
            type: AtomicOperationType.expense,
            account: account,
          ),
          AtomicOperation(
            money: money,
            type: AtomicOperationType.income,
            account: debtAccount,
          ),
        ],
        categoriesStamp: categoriesStamp ?? "",
        subjectsStamp: subjectsStamp ?? "",
      );
  factory LogicOperation.loanIncrease(
    Account account,
    Money money,
    Account debtAccount, {
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
            type: AtomicOperationType.expense,
            account: account,
          ),
          AtomicOperation(
            money: money,
            type: AtomicOperationType.income,
            account: debtAccount,
          ),
        ],
        categoriesStamp: categoriesStamp ?? "",
        subjectsStamp: subjectsStamp ?? "",
      );

  factory LogicOperation.loanDecrease(
    Account account,
    Money money,
    Account debtAccount, {
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
            account: debtAccount,
          ),
        ],
        categoriesStamp: categoriesStamp ?? "",
        subjectsStamp: subjectsStamp ?? "",
      );
}
