import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/categories_repository.dart';
import 'package:iif/domain/repositories/subjects_repository.dart';
import 'package:iif/misc/di/providers.dart';

class CreateNodeValueUseCase {
  final AccountsRepository accountsRepository;
  final CategoriesRepository categoriesRepository;
  final SubjectsRepository subjectsRepository;
  CreateNodeValueUseCase({
    required this.accountsRepository,
    required this.categoriesRepository,
    required this.subjectsRepository,
  });

  T execute<T extends NodeValue>(String text, NodeValue? value, NodeValue reference, {required NodeValue parent}) {
    switch (T) {
      case Category:
        final categoryTemplate = Category.template(
            id: value?.id, name: text, type: value is Category ? value.type : (reference as Category).type);

        return categoriesRepository.saveCategory(categoryTemplate, parent as Category) as T;
      // return Category(text, value is Category ? value.type : (reference as Category).type) as T;
      case Subject: //TODO: now it is only for debts
        // final referenceSubject = reference as Subject;
        // Account accountTemplate = Account.template(
        //   type: AccountType.debts,
        //   name: text,
        // );
        // if (value is Subject) {
        //   accountTemplate = Account(
        //     id: value.account.id,
        //     name: text,
        //     type: value.account.type,
        //     currency: value.account.currency,
        //   );
        // }
        final subject = subjectsRepository.saveSubject(
          Subject.template(id: value?.id, name: text, type: SubjectType.debts),
          parent as Subject,
        );
        accountsRepository.saveAccount(
          Account(
            id: -1,
            type: subject.type == SubjectType.debts ? AccountType.debtsAndLoans : AccountType.investments,
            name: subject.name,
            currency: Currency.debugDefault,
          ),
          subject: subject,
        );

        return subject as T;

      // return Subject(text, value is Subject ? value.type : referenceSubject.type, account) as T;
    }

    throw UnimplementedError();
  }
}
