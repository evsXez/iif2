import 'package:iif/domain/entities/account.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class LoanDecreaseUseCase {
  final OperationsRepository operationsRepository;
  LoanDecreaseUseCase({
    required this.operationsRepository,
  });

  void execute(
    Account account,
    Money money, {
    String? comment,
    String? categoriesStamp,
    required Subject subject,
  }) {
    throw UnimplementedError();
  }
}
