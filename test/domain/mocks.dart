import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/categories_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:iif/domain/repositories/subjects_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AccountsRepository,
  OperationsRepository,
  CategoriesRepository,
  SubjectsRepository,
  GetAccountsBalanceUseCase,
  GetAccountTypesOnMainPageUseCase,
])
void main() {}
