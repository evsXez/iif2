import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';

class CreateNodeValueUseCase {
  final AccountsRepository accountsRepository;
  CreateNodeValueUseCase({required this.accountsRepository});

  T execute<T extends NodeValue>(String text, NodeValue? value, NodeValue reference) {
    switch (T) {
      case Category:
        return Category(text, value is Category ? value.type : (reference as Category).type) as T;
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
