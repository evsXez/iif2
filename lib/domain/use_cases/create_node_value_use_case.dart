import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/categories_repository.dart';

class CreateNodeValueUseCase {
  final AccountsRepository accountsRepository;
  final CategoriesRepository categoriesRepository;
  CreateNodeValueUseCase({
    required this.accountsRepository,
    required this.categoriesRepository,
  });

  T execute<T extends NodeValue>(String text, NodeValue? value, NodeValue reference) {
    switch (T) {
      case Category:
        final categoryTemplate =
            Category.template(name: text, type: value is Category ? value.type : (reference as Category).type);
        return categoriesRepository.saveCategory(categoryTemplate, parent) as T;
      // return Category(text, value is Category ? value.type : (reference as Category).type) as T;
      case Subject:
        final referenceSubject = reference as Subject;
        Account accountTemplate = Account.template(
          type: referenceSubject.account.type,
          name: text,
        );
        if (value is Subject) {
          accountTemplate = Account(
            id: value.account.id,
            name: text,
            type: value.account.type,
            currency: value.account.currency,
          );
        }
        final account = accountsRepository.saveAccount(accountTemplate);

        return Subject(text, value is Subject ? value.type : referenceSubject.type, account) as T;
    }

    throw UnimplementedError();
  }
}
