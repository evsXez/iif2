import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iif/data/repositories/accounts_repository_impl.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

//repositories, private, for use cases only
final _accountsRepository = Provider((ref) => AccountsRepositoryImpl());
final _operationsRepository = Provider((ref) => OperationsRepositoryImpl());

//use cases
final getAccountTypesOnMainPageUseCase = Provider((ref) => GetAccountTypesOnMainPageUseCase());
final saveAccountUseCase = Provider((ref) => SaveAccountUseCase(
      accountsRepository: ref.read(_accountsRepository),
      operationsRepository: ref.read(_operationsRepository),
    ));

//extension for more readability
extension ProviderX<T> on Provider<T> {
  T of(BuildContext context) => context.read(this);
}
