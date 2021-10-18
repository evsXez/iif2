import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';

abstract class OperationsRepository extends ChangeNotifier {
  Future<Money> calculateBalance(Account account);
  void addOperationInitialInput(Account account, Money money);
  Future<List<LogicOperation>> getOperations(Account account);
  Future<List<LogicOperation>> getAllOperations();
}
