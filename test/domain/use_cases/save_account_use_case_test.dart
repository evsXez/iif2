import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:iif/domain/use_cases/save_account_use_case.dart';
import 'package:mockito/mockito.dart';

import '../mocks.mocks.dart';

void main() {
  late SaveAccountUseCase saveAccountUseCase;
  late AccountsRepository mockAccountsRepository;
  late OperationsRepository mockOperationsRepository;
  late Account account;
  late List<Account> listAccounts;
  late List<LogicOperation> listOperations;
  final money = Money(coins: 100);

  setUp(() {
    mockAccountsRepository = MockAccountsRepository();
    mockOperationsRepository = MockOperationsRepository();

    saveAccountUseCase = SaveAccountUseCase(
      accountsRepository: mockAccountsRepository,
      operationsRepository: mockOperationsRepository,
    );
    account = Account(id: 13, name: "Test", type: AccountType.money, currency: Currency.debugDefault);
    listAccounts = [];
    listOperations = [];

    when(mockAccountsRepository.getAccountsOfType(AccountType.money)).thenReturn(listAccounts);
    when(mockAccountsRepository.saveAccount(account)).thenAnswer((realInvocation) {
      listAccounts.add(account);
      return account;
    });

    when(mockOperationsRepository.getOperations(account)).thenAnswer((_) async => listOperations);
    when(mockOperationsRepository.addOperationInitialInput(account, money)).thenAnswer((_) {
      listOperations.add(LogicOperation.initialInput(
        account: account,
        money: money,
      ));
    });
  });

  test('after saving account we can get it', () {
    expect(mockAccountsRepository.getAccountsOfType(account.type).contains(account), false);
    saveAccountUseCase.execute(account, money);
    expect(mockAccountsRepository.getAccountsOfType(account.type).contains(account), true);
  });

  test('after saving account the initial input operation saved too', () async {
    expect((await mockOperationsRepository.getOperations(account)), isEmpty);
    saveAccountUseCase.execute(account, money);
    expect((await mockOperationsRepository.getOperations(account)).length == 1, true);
    expect((await mockOperationsRepository.getOperations(account)).first.type, LogicOperationType.initialInput);
  });
}
