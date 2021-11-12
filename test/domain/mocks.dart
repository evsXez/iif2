import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/accounts_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AccountsRepository,
  OperationsRepository,
  GetAccountsBalanceUseCase,
  GetAccountTypesOnMainPageUseCase,
])
void main() {}
