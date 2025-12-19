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

  Future<void> fetchGetAllCoupons() async {
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

  /// ================= ADD =================
  Future<void> addCoupon({
    required String title,
    required String discount,
    required String expire,
  }) async {
    emit(CouponsState.actionLoading());

    final response = await _couponsRepositoryImplement.addCouponsRepo(
      title: title,
      discount: discount,
      expire: expire,
    );

    response.when(
      success: (createdCoupon) async {
        _coupons.insert(0, createdCoupon.data!);
        emit(CouponsState.actionSuccess());
      },
      failure: (error) {
        emit(CouponsState.actionError(error));
      },
    );
  }

  /// ================= UPDATE =================
  Future<void> updateCoupon({
    required String id,
    required String title,
    required String discount,
    required String expire,
  }) async {
    emit(CouponsState.actionLoading());

    final response = await _couponsRepositoryImplement.updateCouponRepo(
      id: id,
      title: title,
      discount: discount,
      expire: expire,
    );

    response.when(
      success: (updatedCoupon) async {
        final index = _coupons.indexWhere((c) => c.sId == id);
        if (index != -1) {
          _coupons[index] = updatedCoupon.data!;
        }
        emit(CouponsState.actionSuccess());
      },
      failure: (error) {
        emit(CouponsState.actionError(error));
      },
    );
  }

  /// ================= DELETE =================
  Future<void> deleteCoupon(String id) async {
    emit(CouponsState.actionLoading());

    final response = await _couponsRepositoryImplement.deleteCouponsRepo(
      id: id,
    );

    response.when(
      success: (_) async {
        _coupons.removeWhere((c) => c.sId == id);
        emit(CouponsState.actionSuccess());
      },
      failure: (error) {
        emit(CouponsState.actionError(error));
      },
    );
  }
}
