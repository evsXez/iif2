import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main() {
  late GetAccountOptionsUseCase getAccountOptionsUseCase;
  final operationsRepository = MockOperationsRepository();

  final noMoney = AccountBalance(
    Account(
      id: -1,
      name: "no money",
      type: AccountType.investments,
      currency: Currency.debugDefault,
    ),
    Money.zero,
  );

  final hasMoney = AccountBalance(
    Account(
      id: -1,
      name: "has money",
      type: AccountType.investments,
      currency: Currency.debugDefault,
    ),
    const Money(coins: 1),
  );

  final onlyInitial = AccountBalance(
    Account(
      id: -1,
      name: "only initial",
      type: AccountType.creditCards,
      currency: Currency.debugDefault,
    ),
    const Money(coins: 10),
  );

  final notOnlyInitial = AccountBalance(
    Account(
      id: -1,
      name: "not only initial",
      type: AccountType.creditCards,
      currency: Currency.debugDefault,
    ),
    const Money(coins: 10),
  );

  LogicOperation initialInput(Account account, int coins) => LogicOperation(
        type: LogicOperationType.initialInput,
        created: DateTime.now(),
        comment: "",
        categoriesStamp: "",
        subjectsStamp: "",
        atomics: [
          AtomicOperation(
            money: Money(coins: coins),
            type: AtomicOperationType.initialInput,
            account: account,
          ),
        ],
      );

  LogicOperation expense(Account account, int coins) => LogicOperation(
        type: LogicOperationType.expense,
        created: DateTime.now(),
        comment: "",
        categoriesStamp: "",
        subjectsStamp: "",
        atomics: [
          AtomicOperation(
            money: Money(coins: coins),
            type: AtomicOperationType.expense,
            account: account,
          ),
        ],
      );

  setUp(() {
    getAccountOptionsUseCase = GetAccountOptionsUseCase(operationsRepository: operationsRepository);

    when(operationsRepository.getOperations(noMoney.account))
        .thenAnswer((_) async => [initialInput(noMoney.account, 0)]);
    when(operationsRepository.getOperations(hasMoney.account))
        .thenAnswer((_) async => [initialInput(hasMoney.account, 101)]);
    when(operationsRepository.getOperations(onlyInitial.account))
        .thenAnswer((_) async => [initialInput(onlyInitial.account, 10000), initialInput(onlyInitial.account, 10)]);
    when(operationsRepository.getOperations(notOnlyInitial.account))
        .thenAnswer((_) async => [initialInput(notOnlyInitial.account, 10000), expense(notOnlyInitial.account, 999)]);
  });

  test('we can archive accounts without money', () async {
    expect((await getAccountOptionsUseCase.execute(noMoney)).isArchiveAvailable, true);
  });
  test('we can\'t archive accounts with money', () async {
    expect((await getAccountOptionsUseCase.execute(hasMoney)).isArchiveAvailable, false);
  });
  test('we can delete accounts with only initial input operations', () async {
    expect((await getAccountOptionsUseCase.execute(onlyInitial)).isDeleteAvailable, true);
  });
  test('we can\'t delete accounts with operations other than initial input', () async {
    expect((await getAccountOptionsUseCase.execute(notOnlyInitial)).isDeleteAvailable, false);
  });
}
