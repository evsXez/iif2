import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/data/include/data_include.dart';
import 'package:iif/data/repositories/funds_repository.dart';

part 'funds_state.dart';
part 'funds_event.dart';
part 'funds_bloc.freezed.dart';

class FundsBloc extends Bloc<FundsEvent, FundsState> {
  final FundsRepository repository;

  FundsBloc(this.repository) : super(const _LoadInProgress()) {
    repository.getFunds().then((data) {
      emit(_LoadSuccess(data));
    });
  }

  @override
  Stream<FundsState> mapEventToState(FundsEvent event) async* {
    // yield* gEvent.map();
  }
}
