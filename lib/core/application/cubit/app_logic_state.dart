part of 'app_logic_cubit.dart';

@freezed
class AppLogicState with _$AppLogicState {
  const factory AppLogicState.initial() = _Initial;
   const factory AppLogicState.hideNavigationBarState({
    @Default(false) bool hideNavigationBar,
  }) = HideNavigationBarState;
}
