import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/use_cases/get_all_operations_use_case.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import '../mocks.mocks.dart';
import '../operation_fixtures.dart';

void main() {
  late GetAllOperationsUseCase getAllOperationsUseCase;
  late MockOperationsRepository mockOperationsRepository;

  final account = getAccount(0, AccountType.money);
  final List<LogicOperation> allOperations = [
    getLogicOperationInitialInput(account, money100),
    getLogicOperationInitialInput(account, money999),
  ];

  setUp(() {
    mockOperationsRepository = MockOperationsRepository();
    getAllOperationsUseCase = GetAllOperationsUseCase(operationsRepository: mockOperationsRepository);
  });

  test('repository has operations and we can get them', () async {
    when(mockOperationsRepository.getAllOperations()).thenAnswer((_) async => allOperations);

    expect(allOperations, isNotEmpty);
    expect(await getAllOperationsUseCase.execute(), allOperations);
  });
}
