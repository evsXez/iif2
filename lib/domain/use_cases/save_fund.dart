import 'package:iif/domain/entities/fund.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/funds_repository.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class SaveFund {
  final FundsRepository fundsRepository;
  final OperationsRepository operationsRepository;
  SaveFund({
    required this.fundsRepository,
    required this.operationsRepository,
  });

  void execute(Fund fund, Money money) {
    fundsRepository.saveFund(fund);
    operationsRepository.addOperationInitialInput(fund, money);
  }
}
