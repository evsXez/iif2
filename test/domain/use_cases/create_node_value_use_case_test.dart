import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import '../mocks.mocks.dart';

void main() {
  late CreateNodeValueUseCase createNodeValueUseCase;
  final account = getAccount(12, AccountType.debts);
  late MockAccountsRepository accountsRepository;
  late List<Account> accountsData;
  const name = "node value name";
  final categoryNodeValue = Category("category", CategoryType.debtDecrease);
  final categoryReference = categoryNodeValue;
  final subjectNodeValue = Subject("subject", SubjectType.debts, account);
  final subjectReference = subjectNodeValue;

  setUp(() {
    accountsRepository = MockAccountsRepository();
    createNodeValueUseCase = CreateNodeValueUseCase(accountsRepository: accountsRepository);

    accountsData = [];

    // when(accountsRepository.getAccountsOfType(type)).thenReturn(accountsData);
    when(accountsRepository.saveAccount(any)).thenAnswer((realInvocation) {
      final Account accountToSave = realInvocation.positionalArguments.first;
      accountsData.add(accountToSave);
      return accountToSave;
    });
  });

  group('creates Category', () {
    test('can create Category undefined', () {
      final category = createNodeValueUseCase.execute<Category>(name, null, categoryReference);
      expect(category.name, name);
      expect(category.type, categoryReference.type);
    });
    test('can create Category from node', () {
      final category = createNodeValueUseCase.execute<Category>(name, categoryNodeValue, categoryReference);
      expect(category.name, name);
      expect(category.type, categoryNodeValue.type);
    });
  });

  group('creates Subject', () {
    test('can create Subject undefined', () {
      final subject = createNodeValueUseCase.execute<Subject>(name, null, subjectReference);
      expect(subject.name, name);
      expect(subject.type, subjectReference.type);
      expect(subject.account.name, name);
      expect(subject.account.type, subjectReference.account.type);
    });
    test('can create Subject from node', () {
      assert(name != subjectNodeValue.name);
      final subject = createNodeValueUseCase.execute<Subject>(name, subjectNodeValue, subjectReference);
      expect(subject.name, name);
      expect(subject.type, subjectNodeValue.type);
      expect(subject.account.id, subjectNodeValue.account.id);
      expect(subject.account.name, name);
      expect(subject.account.type, subjectNodeValue.account.type);
    });
  });
}
