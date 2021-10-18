import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iif/data/data_sources/data_source_impl.dart';
import 'package:iif/data/repositories/accounts_repository_impl.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/main.dart';
import 'package:iif/presentation/include.dart';

//data sources
final _dataSource = Provider((ref) => DataSourceImpl(sharedPreferences));

//repositories, private, for use cases only
final accountsRepository = Provider((ref) => AccountsRepositoryImpl(ref.read(_dataSource)));
final operationsRepository = Provider((ref) => OperationsRepositoryImpl(ref.read(_dataSource)));

//use cases
final getAccountTypesOnMainPageUseCase = Provider((ref) => GetAccountTypesOnMainPageUseCase());
final saveAccountUseCase = Provider((ref) => SaveAccountUseCase(
      accountsRepository: ref.read(accountsRepository),
      operationsRepository: ref.read(operationsRepository),
    ));
final getAccountsBalanceUseCase = Provider((ref) => GetAccountsBalanceUseCase(
      accountsRepository: ref.read(accountsRepository),
      operationsRepository: ref.read(operationsRepository),
    ));
final getAllMoneyForAccountTypesUseCase = Provider((ref) => GetAllMoneyForAccountTypesUseCase(
      ref.read(getAccountsBalanceUseCase),
      ref.read(getAccountTypesOnMainPageUseCase),
    ));
final getAccountOptionsUseCase = Provider((ref) => GetAccountOptionsUseCase(
      operationsRepository: ref.read(operationsRepository),
    ));
final archiveAccountUseCase = Provider((ref) => ArchiveAccountUseCase(
      accountsRepository: ref.read(accountsRepository),
    ));
final deleteAccountUseCase = Provider((ref) => DeleteAccountUseCase(
      accountsRepository: ref.read(accountsRepository),
    ));
final getAllOperationsUseCase = Provider((ref) => GetAllOperationsUseCase(
      operationsRepository: ref.read(operationsRepository),
    ));

//extension for more readability
extension ProviderX<T> on Provider<T> {
  T of(BuildContext context) => context.read(this);
}
