import 'package:flutter_test/flutter_test.dart';
import 'package:iif/domain/include.dart';
import 'package:mockito/mockito.dart';

import '../account_fixtures.dart';
import '../mocks.mocks.dart';

void main() {
  late CreateNodeValueUseCase createNodeValueUseCase;
  const accountType = AccountType.debtsAndLoans;
  final account = getAccount(12, accountType);
  late MockAccountsRepository accountsRepository;
  late MockCategoriesRepository categoriesRepository;
  late MockSubjectsRepository subjectsRepository;
  late List<Account> accountsData;
  const name = "node value name";
  final categoryNodeValue = Category(-1, "category", CategoryType.debtDecrease);
  final categoryReference = categoryNodeValue;

  setUp(() {
    accountsRepository = MockAccountsRepository();
    categoriesRepository = MockCategoriesRepository();
    subjectsRepository = MockSubjectsRepository();

    createNodeValueUseCase = CreateNodeValueUseCase(
      accountsRepository: accountsRepository,
      categoriesRepository: categoriesRepository,
      subjectsRepository: subjectsRepository,
    );

    accountsData = [];

    when(accountsRepository.getAccountsOfType(accountType)).thenReturn(accountsData);
    when(accountsRepository.saveAccount(any)).thenAnswer((realInvocation) {
      final Account accountToSave = realInvocation.positionalArguments.first;
      accountsData.add(accountToSave);
      return accountToSave;
    });
    when(categoriesRepository.saveCategory(any, any)).thenAnswer((realInvocation) {
      final Category template = realInvocation.positionalArguments.first;
      return template;
    });
  });

  group('creates Category', () {
    test('can create Category undefined', () {
      final category =
          createNodeValueUseCase.execute<Category>(name, null, categoryReference, parent: Category.undefined());
      expect(category.name, name);
      expect(category.type, categoryReference.type);
    });
    test('can create Category from node', () {
      final category = createNodeValueUseCase.execute<Category>(name, categoryNodeValue, categoryReference,
          parent: Category.undefined());
      expect(category.name, name);
      expect(category.type, categoryNodeValue.type);
    });
  });
}
