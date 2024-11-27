import '../../../../../core/common/shared/shared_imports.dart'; //

part 'banner_state.dart';
part 'banner_cubit.freezed.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this._homeRepository) : super(const BannerState.initial());
  final HomeRepositoryImplement _homeRepository;

  int bannerIndex = 0;

  void changeIndexCarouselSlider(int index) {
    bannerIndex = index;
    emit(BannerState.changeCrouserIndex(bannerIndex));
  }

  Future<void> getBanners() async {
    emit(const BannerState.getBannersLoading());

    final response = await _homeRepository.getBanner();

    response.when(
      success: (dataResponse) {
        emit(BannerState.getBannersSuccess(dataResponse));
      },
      failure: (error) {
        emit(BannerState.getBannersError(error));
      },
    );
  }
}
