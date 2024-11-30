import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'admin_home_state.dart';
part 'admin_home_cubit.freezed.dart';

class AdminHomeCubit extends Cubit<AdminHomeState> {
  AdminHomeCubit() : super(const AdminHomeState.initial());

  double xOffset = 0;
  double yOffset = 0;
  double rotate = 0.0;
  double scaleFactor = 1;
  bool drawerIsOpen = false;

void drawerOpenOrClose(double xOffset, double yOffset, double scaleFactor,
      double rotate, bool drawerIsOpen) {
    this.xOffset = xOffset; 
    this.yOffset = yOffset;
    this.scaleFactor = scaleFactor;
    this.rotate = rotate;
    this.drawerIsOpen = drawerIsOpen;


    emit(AdminHomeState.drawerState(
      xOffset: this.xOffset,
      yOffset: this.yOffset,
      scaleFactor: this.scaleFactor,
      rotate: this.rotate,
      drawerIsOpen: this.drawerIsOpen,
    ));
  }


}
