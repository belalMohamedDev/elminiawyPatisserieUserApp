import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/coupons/data/model/coupons_response.dart';

part 'coupons_state.dart';
part 'coupons_cubit.freezed.dart';

class CouponsCubit extends Cubit<CouponsState> {
  CouponsCubit() : super(CouponsState.initial());
}
