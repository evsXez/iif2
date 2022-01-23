import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/use_cases/get_accounts_count_use_case.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import '../mocks.mocks.dart';

void main() {
  late GetAccountsCountUseCase getAccountsCountUseCase;
  late MockAccountsRepository mockAccountsRepository;

  setUp(() {
    mockAccountsRepository = MockAccountsRepository();
    getAccountsCountUseCase = GetAccountsCountUseCase(accountsRepository: mockAccountsRepository);
  });

  test('accounts count', () {
    when(mockAccountsRepository.getAccountsOfType(any)).thenReturn([accountMoney]);
    expect(getAccountsCountUseCase.execute(AccountType.values), AccountType.values.length);
  });
}
