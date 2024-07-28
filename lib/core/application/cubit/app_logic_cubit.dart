import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

part 'app_logic_state.dart';
part 'app_logic_cubit.freezed.dart';

class AppLogicCubit extends Cubit<AppLogicState> {
  AppLogicCubit() : super(const AppLogicState.initial());
  final PersistentTabController bottomNavBarController =
      PersistentTabController();



}
