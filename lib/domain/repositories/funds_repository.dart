import 'package:iif/domain/include.dart';

abstract class FundsRepository {
  Future<List<Fund>> getFundsOfType(FundType type);
  Future<Fund> saveFund(Fund? fundToEdit, String name, FundType type);
  Future<Map<FundType, Money>> getMoneyForFundTypes();
}
