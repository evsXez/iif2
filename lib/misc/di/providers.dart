import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iif/data/data_sources/data_source_impl.dart';
import 'package:iif/data/repositories/accounts_repository_impl.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/use_cases/get_accounts_balance_use_case.dart';
import 'package:iif/main.dart';
import 'package:iif/presentation/include.dart';

//data sources
final _dataSource = Provider((ref) => DataSourceImpl(sharedPreferences));

//repositories, private, for use cases only
final _accountsRepository = Provider((ref) => AccountsRepositoryImpl(ref.read(_dataSource)));
final _operationsRepository = Provider((ref) => OperationsRepositoryImpl(ref.read(_dataSource)));

//use cases
final getAccountTypesOnMainPageUseCase = Provider((ref) => GetAccountTypesOnMainPageUseCase());
final saveAccountUseCase = Provider((ref) => SaveAccountUseCase(
      accountsRepository: ref.read(_accountsRepository),
      operationsRepository: ref.read(_operationsRepository),
    ));
final getAccountsBalanceUseCase = Provider((ref) => GetAccountsBalanceUseCase(
      accountsRepository: ref.read(_accountsRepository),
      operationsRepository: ref.read(_operationsRepository),
    ));

//extension for more readability
extension ProviderX<T> on Provider<T> {
  T of(BuildContext context) => context.read(this);
}
