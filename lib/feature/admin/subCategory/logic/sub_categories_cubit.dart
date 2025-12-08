import 'dart:io';

import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/subCategory/data/model/response/drop_down_item.dart';

part 'sub_categories_state.dart';
part 'sub_categories_cubit.freezed.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit(this._subCategoryRepositoryImplement, this._imagePicker)
    : super(const SubCategoriesState.initial());
  final ImagePicker _imagePicker;
  final SubCategoryRepositoryImplement _subCategoryRepositoryImplement;
  final TextEditingController arTitleController = TextEditingController();
  final TextEditingController enTitleController = TextEditingController();

  final List<SubCategoryResponseData> _subCategories = [];
  final List<DropdownItem> _dropdownItems = [];

  List<SubCategoryResponseData> get subCategories => _subCategories;

  List<String> get subCategoriesTitle =>
      _dropdownItems.map((e) => e.title).toList();

  String? categoryValueId;

  bool? active;
  void setCategoryId(String value) {
    categoryValueId = value;
  }

  void setActiveStatus(bool value) {
    active = value;
    emit(SubCategoriesState.updateActiveStatus(active));
  }

  String? returnSubCategoryIdType(String value) {
    try {
      return _dropdownItems.firstWhere((item) => item.title == value).id;
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchCreationNewSubCategory() async {
    if (categoryValueId != null &&
        arTitleController.text.isNotEmpty &&
        enTitleController.text.isNotEmpty) {
      emit(const SubCategoriesState.createSubCategoriesLoading());

      final response = await _subCategoryRepositoryImplement
          .createNewSubCategoriesrepo(
            arTitleController.text.trim(),
            enTitleController.text.trim(),
            categoryValueId!,
          );

      response.when(
        success: (dataResponse) {
          _subCategories.add(dataResponse.data);

          arTitleController.clear();
          enTitleController.clear();

          emit(
            SubCategoriesState.createSubCategoriesSuccess([..._subCategories]),
          );
        },
        failure: (error) {
          emit(SubCategoriesState.createSubCategoriesError(error));
        },
      );
    }
  }

  int page = 1;
  int theLastPage = 0;

  Future<void> fetchGetSubCategories({
    bool fromPagination = false,
    disablePagination = false,
  }) async {
    if (fromPagination) {
      emit(
        const SubCategoriesState.getSubCategoriesFromPaginationLoadingState(),
      );
    } else {
      emit(const SubCategoriesState.getSubCategoriesLoading());
    }

    final int effectivePage = disablePagination ? -1 : page;

    final response = await _subCategoryRepositoryImplement.getSubCategoriesRepo(
      16,
      effectivePage,
    );

    response.when(
      success: (dataResponse) {
        if (disablePagination) {
          _dropdownItems.clear();
          dataResponse.data?.forEach((subCategory) {
            _dropdownItems.add(
              DropdownItem(
                id: subCategory.sId ?? "",
                title: subCategory.title ?? "",
              ),
            );
          });
        } else {
          if (dataResponse.data != null && dataResponse.data!.isNotEmpty) {
            _subCategories.addAll(dataResponse.data!);
            page++;
          } else {
            theLastPage = page;
          }
        }

        emit(SubCategoriesState.getSubCategoriesSuccess(_subCategories));
      },
      failure: (error) {
        emit(SubCategoriesState.getSubCategoriesError(error));
      },
    );
  }

  Future<void> fetchUpdateSubCategories({String? id, bool? active}) async {
    emit(SubCategoriesState.updateSubCategoriesLoading(id!));

    final response = await _subCategoryRepositoryImplement
        .updateSubCategoriesRepo(
          id,
          arTitleController.text.trim(),
          enTitleController.text.trim(),
          active,
          categoryValueId,
        );

    response.when(
      success: (dataResponse) {
        final updatedIndex = _subCategories.indexWhere(
          (subCategory) => subCategory.sId == id,
        );

        if (updatedIndex != -1) {
          _subCategories[updatedIndex] = dataResponse.data;
        }

        arTitleController.clear();
        enTitleController.clear();

        emit(
          SubCategoriesState.updateSubCategoriesSuccess([..._subCategories]),
        );
      },
      failure: (error) {
        emit(SubCategoriesState.updateSubCategoriesError(error));
      },
    );
  }

  Future<void> fetchDeleteSubCategories(String? id) async {
    emit(SubCategoriesState.deleteSubCategoriesLoading(id!));

    final response = await _subCategoryRepositoryImplement
        .deleteSubCategoriesrepo(id);

    response.when(
      success: (dataResponse) {
        final updatedIndex = _subCategories.indexWhere(
          (subCategory) => subCategory.sId == id,
        );

        if (updatedIndex != -1) {
          _subCategories.removeAt(updatedIndex);
        }

        emit(
          SubCategoriesState.deleteSubCategoriesSuccess([..._subCategories]),
        );
      },
      failure: (error) {
        emit(SubCategoriesState.deleteSubCategoriesError(error));
      },
    );
  }

  Future<void> pickImage(ImageSource source, String? id) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      id == null
          ? await fetchCreationNewSubCategory()
          : await fetchUpdateSubCategoriesImage(id: id, image: imageFile);
    }
  }

  Future<void> fetchUpdateSubCategoriesImage({
    required String id,
    required File image,
  }) async {
    emit(SubCategoriesState.updateSubCategoriesImageLoading(id));

    final response = await _subCategoryRepositoryImplement
        .updateSubCategoriesImageRepo(id, image);

    response.when(
      success: (dataResponse) {
        final updatedIndex = _subCategories.indexWhere(
          (subCategory) => subCategory.sId == id,
        );

        if (updatedIndex != -1) {
          _subCategories[updatedIndex] = dataResponse.data;
        }

        emit(
          SubCategoriesState.updateSubCategoriesImageSuccess([
            ..._subCategories,
          ]),
        );
      },
      failure: (error) {
        emit(SubCategoriesState.updateSubCategoriesImageError(error));
      },
    );
  }
}
