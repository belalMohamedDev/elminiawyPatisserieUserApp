
import '../../../../../core/common/shared/shared_imports.dart'; //

part 'app_logic_state.dart';
part 'app_logic_cubit.freezed.dart';

class AppLogicCubit extends Cubit<AppLogicState> {
  AppLogicCubit() : super(const AppLogicState.initial());
  final PersistentTabController bottomNavBarController =
      PersistentTabController();




}
