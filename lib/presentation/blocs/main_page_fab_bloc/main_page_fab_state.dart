part of 'main_page_fab_bloc.dart';

@freezed
abstract class MainPageFabState with _$MainPageFabState {
  const factory MainPageFabState.hidden() = _Hidden;
  const factory MainPageFabState.shown() = _Shown;
}
