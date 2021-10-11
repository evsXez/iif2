import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/funds_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:iif/domain/use_cases/save_fund.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'save_fund_test.mocks.dart';

@GenerateMocks([FundsRepository, OperationsRepository])
void main() {
  late SaveFund saveFundUseCase;
  late FundsRepository mockFundsRepository;
  late OperationsRepository mockOperationsRepository;
  late Fund fund;
  late List<Fund> listFunds;
  late List<Operation> listOperations;
  final money = Money(100);

  setUp(() {
    mockFundsRepository = MockFundsRepository();
    mockOperationsRepository = MockOperationsRepository();

    saveFundUseCase = SaveFund(
      fundsRepository: mockFundsRepository,
      operationsRepository: mockOperationsRepository,
    );
    fund = Fund(name: "Test", type: FundType.money, currency: Currency.debugDefault);
    listFunds = [];
    listOperations = [];

    when(mockFundsRepository.getFundsOfType(FundType.money)).thenReturn(listFunds);
    when(mockFundsRepository.saveFund(fund)).thenAnswer((realInvocation) {
      listFunds.add(fund);
    });

    when(mockOperationsRepository.getOperations(fund)).thenAnswer((_) async => listOperations);
    when(mockOperationsRepository.addOperationInitialInput(fund, money)).thenAnswer((_) {
      listOperations.add(Operation(OperationType.initialInput));
    });
  });

  test('after saving fund we can get it', () {
    expect(mockFundsRepository.getFundsOfType(fund.type).contains(fund), false);
    saveFundUseCase.execute(fund, money);
    expect(mockFundsRepository.getFundsOfType(fund.type).contains(fund), true);
  });

  test('after saving fund the initial input operation saved too', () async {
    expect((await mockOperationsRepository.getOperations(fund)), isEmpty);
    saveFundUseCase.execute(fund, money);
    expect((await mockOperationsRepository.getOperations(fund)).length == 1, true);
    expect((await mockOperationsRepository.getOperations(fund)).first.type, OperationType.initialInput);
  });
}
