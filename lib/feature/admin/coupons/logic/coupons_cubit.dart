import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/coupons/data/model/coupons_response.dart';
import 'package:elminiawy/feature/admin/coupons/data/repository/coupons_repo.dart';

part 'coupons_state.dart';
part 'coupons_cubit.freezed.dart';

class CouponsCubit extends Cubit<CouponsState> {
  CouponsCubit(this._couponsRepositoryImplement)
    : super(CouponsState.initial());

  final CouponsRepositoryImplement _couponsRepositoryImplement;

  List<CouponsData> _coupons = [];

  List<CouponsData> get coupons => _coupons;

  Future<void> getAllCoupons() async {
    emit(CouponsState.getAllCouponsLoading());

    final response = await _couponsRepositoryImplement.getAllCouponsRepo();

    response.when(
      success: (dataResponse) {
        _coupons = dataResponse.data!;
        emit(CouponsState.getAllCouponsSuccess(dataResponse));
      },
      failure: (error) {
        emit(CouponsState.getAllCouponsError(error));
      },
    );
  }
}
