

import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'banner_state.dart';
part 'banner_cubit.freezed.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this._bannerRepository, this._imagePicker) : super(const BannerState.initial());
  final BannerRepositoryImplement _bannerRepository;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  List<DataBannerResponse> _banners = [];
  final ImagePicker _imagePicker;
  List<DataBannerResponse> get banners => _banners;

  Future<void> pickImage(ImageSource source, ) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      //final imageFile = File(pickedImage.path);

      // id == null
      //     ? await fetchCreationCategory(imageFile)
      //     : await fetchUpdateImageCategories(id, imageFile);
    }
  }

  Future<void> getBanners() async {
    emit(const BannerState.getBannersLoading());

    final response = await _bannerRepository.getBannerRepo();

    response.when(
      success: (dataResponse) {
        _banners = dataResponse.data!;
        emit(BannerState.getBannersSuccess(_banners));
      },
      failure: (error) {
        emit(BannerState.getBannersError(error));
      },
    );
  }

  Future<void> deleteBanner(String id) async {
    emit(BannerState.deleteBannersLoading(id));

    final response = await _bannerRepository.deleteBannerRepo(id);

    response.when(
      success: (dataResponse) {
        final updatedIndex = _banners.indexWhere((banner) => banner.sId == id);

        if (updatedIndex != -1) {
          _banners.removeAt(updatedIndex);
        }
        emit(BannerState.deleteBannersSuccess(_banners));
      },
      failure: (error) {
        emit(BannerState.deleteBannersError(error));
      },
    );
  }
}
