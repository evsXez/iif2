import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iif/domain/include.dart';

part 'main_page_fab_state.freezed.dart';

@freezed
abstract class MainPageFabState with _$MainPageFabState {
  const factory MainPageFabState.hidden() = Hidden;
  const factory MainPageFabState.shown() = Shown;
}
