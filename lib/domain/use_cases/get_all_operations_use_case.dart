import 'package:iif/domain/include.dart';
import 'package:iif/domain/repositories/operations_repository.dart';

class GetAllOperationsUseCase {
  final OperationsRepository operationsRepository;
  GetAllOperationsUseCase({required this.operationsRepository});

  Future<List<LogicOperation>> execute() {
    return operationsRepository.getAllOperations();
  }
}
