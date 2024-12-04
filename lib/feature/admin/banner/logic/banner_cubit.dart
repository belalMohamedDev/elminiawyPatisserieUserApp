import 'dart:io';

import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'banner_state.dart';
part 'banner_cubit.freezed.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this._bannerRepository, this._imagePicker)
      : super(const BannerState.initial());
  final BannerRepositoryImplement _bannerRepository;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  String? startDateText;
  String? endDateText;

  List<DataBannerResponse> _banners = [];
  final ImagePicker _imagePicker;
  List<DataBannerResponse> get banners => _banners;

  void setStartDate(DateTime pickedDate) {
    startDateText = pickedDate.toIso8601String();
    startDateController.text =
        '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
    emit(BannerState.setStartOrEndTextDate(startDateController.text));
  }

  void setEndDate(DateTime pickedDate) {
    endDateText = pickedDate.toIso8601String();
    endDateController.text =
        '${pickedDate.year}-${pickedDate.month}-${pickedDate.day}';
    emit(BannerState.setStartOrEndTextDate(endDateController.text));
  }

  Future<void> pickImage(
    ImageSource source,
    String? id,
  ) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      await createNewBanners(imageFile);
      id == null
          ? await createNewBanners(imageFile)
          : await updateImageBanners(
              imageFile,
              id,
            );
    }
  }

  Future<void> createNewBanners(File? image) async {
    if (image != null &&
        startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      emit(const BannerState.createBannersLoading());

      final response = await _bannerRepository.createNewBannerRepo(
          startDateText!, endDateText!, image);

      response.when(
        success: (dataResponse) {
          _banners.insert(0, dataResponse.data);

          startDateController.clear();
          endDateController.clear();

          emit(BannerState.createBannersSuccess([..._banners]));
        },
        failure: (error) {
          emit(BannerState.createBannersError(error));
        },
      );
    }
  }

  Future<void> updateImageBanners(File? image, String id) async {
    if (image != null) {
      emit(BannerState.updateImageBannersLoading(id));

      final response = await _bannerRepository.updateBannerImageRepo(id, image);

      response.when(
        success: (dataResponse) {
          final updatedIndex =
              _banners.indexWhere((subCategory) => subCategory.sId == id);

          if (updatedIndex != -1) {
            _banners[updatedIndex] = dataResponse.data;
          }

          emit(BannerState.updateImageBannersSuccess([..._banners]));
        },
        failure: (error) {
          emit(BannerState.updateImageBannersError(error));
        },
      );
    }
  }

  Future<void> updateBannersDate(String id) async {
    emit(BannerState.updateBannersLoading(id));

    final response = await _bannerRepository.updateBannerDateRepo(
        id, startDateText!, endDateText!);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _banners.indexWhere((subCategory) => subCategory.sId == id);

        if (updatedIndex != -1) {
          _banners[updatedIndex] = dataResponse.data;
        }

        emit(BannerState.updateBannersSuccess([..._banners]));
      },
      failure: (error) {
        emit(BannerState.updateBannersError(error));
      },
    );
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
