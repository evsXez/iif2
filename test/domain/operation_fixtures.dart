import 'package:iif/domain/include.dart';

const money100 = Money(coins: 100);
const money999 = Money(coins: 999);

LogicOperation getLogicOperationInitialInput(Account account, Money money) => LogicOperation(
      type: LogicOperationType.initialInput,
      created: DateTime.now(),
      comment: "comment for initial",
      categoriesStamp: "categories/Stamp",
      subjectsStamp: "subjects/Stamp",
      atomics: [
        AtomicOperation(
          money: money,
          type: AtomicOperationType.initialInput,
          account: account,
        ),
      ],
    );
