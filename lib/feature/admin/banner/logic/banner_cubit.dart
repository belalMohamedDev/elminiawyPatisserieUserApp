import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'banner_state.dart';
part 'banner_cubit.freezed.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this._bannerRepository) : super(const BannerState.initial());
  final BannerRepositoryImplement _bannerRepository;

  List<DataBannerResponse> _banners = [];

  List<DataBannerResponse> get banners => _banners;

  Future<void> getBanners() async {
    emit(const BannerState.getBannersLoading());

    final response = await _bannerRepository.getBannerRepo();

    response.when(
      success: (dataResponse) {
        _banners = dataResponse.data!;
        emit(BannerState.getBannersSuccess(dataResponse));
      },
      failure: (error) {
        emit(BannerState.getBannersError(error));
      },
    );
  }
}
