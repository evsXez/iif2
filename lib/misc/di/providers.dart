import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iif/data/data_sources/data_source_impl.dart';
import 'package:iif/data/repositories/accounts_repository_impl.dart';
import 'package:iif/data/repositories/categories_repository_impl.dart';
import 'package:iif/data/repositories/operations_repository_impl.dart';
import 'package:iif/data/repositories/subjects_repository_impl.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/main.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/ui_notifiers/ui_notifier_account_editor_opened.dart';

//data sources
final _dataSource = Provider((ref) => DataSourceImpl(sharedPreferences));

//repositories, private, for use cases only
final accountsRepository = Provider((ref) => AccountsRepositoryImpl(ref.read(_dataSource)));
final operationsRepository = Provider((ref) => OperationsRepositoryImpl(ref.read(_dataSource)));
final categoriesRepository = Provider((ref) => CategoriesRepositoryImpl(ref.read(_dataSource)));
final subjectsRepository = Provider((ref) => SubjectsRepositoryImpl(ref.read(_dataSource)));

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
final getAccountsCountUseCase = Provider((ref) => GetAccountsCountUseCase(
      accountsRepository: ref.read(accountsRepository),
    ));
final getAllOperationsUseCase = Provider((ref) => GetAllOperationsUseCase(
      operationsRepository: ref.read(operationsRepository),
    ));
final addExpenseUseCase = Provider((ref) => AddExpenseUseCase(
      operationsRepository: ref.read(operationsRepository),
    ));
final addIncomeUseCase = Provider((ref) => AddIncomeUseCase(
      operationsRepository: ref.read(operationsRepository),
    ));
final debtIncreaseUseCase = Provider((ref) => DebtIncreaseUseCase(
      accountsRepository: ref.read(accountsRepository),
      operationsRepository: ref.read(operationsRepository),
    ));
final debtDecreaseUseCase = Provider((ref) => DebtDecreaseUseCase(
      accountsRepository: ref.read(accountsRepository),
      operationsRepository: ref.read(operationsRepository),
    ));
final loanIncreaseUseCase = Provider((ref) => LoanIncreaseUseCase(
      accountsRepository: ref.read(accountsRepository),
      operationsRepository: ref.read(operationsRepository),
    ));
final loanDecreaseUseCase = Provider((ref) => LoanDecreaseUseCase(
      accountsRepository: ref.read(accountsRepository),
      operationsRepository: ref.read(operationsRepository),
    ));
final createNodeValueUseCase = Provider((ref) => CreateNodeValueUseCase(
      accountsRepository: ref.read(accountsRepository),
      categoriesRepository: ref.read(categoriesRepository),
      subjectsRepository: ref.read(subjectsRepository),
    ));
final getRootNodeUseCase = Provider((ref) => GetRootNodeUseCase(
      categoriesRepository: ref.read(categoriesRepository),
      subjectsRepository: ref.read(subjectsRepository),
    ));

//ui notifiers, are used only in presentation layer to make some ui interactions easier
final UiNotifierAccountEditorOpened uiNotifierAccountEditorOpened = UiNotifierAccountEditorOpened();

//extension for more readability
extension ProviderX<T> on Provider<T> {
  T of(BuildContext context) => context.read(this);
}
