import 'package:iif/domain/include.dart';

abstract class FundsRepository {
  List<Fund> getFundsOfType(FundType type);
  void saveFund(Fund fund);
}
