import 'dart:io';

import '../../../../core/common/shared/shared_imports.dart'; //

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepositoryImplement, this._imagePicker)
    : super(const CategoryState.initial()) {
    _categoryRepositoryImplement.onCategoryDataUpdated = (updatedModel) {
      _categories = updatedModel.data!;
      emit(CategoryState.getCategoriesSuccess(_categories));
    };
  }

  final CategoryRepositoryImplement _categoryRepositoryImplement;

  final TextEditingController arTitleController = TextEditingController();
  final TextEditingController enTitleController = TextEditingController();
  final ImagePicker _imagePicker;
  List<CategoryResponseData> _categories = [];

  final List<String?> _categoryTitleData = [];

  List<CategoryResponseData> get categories => _categories;

  List<String?> get categoriesTitle => _categoryTitleData;

  String? returnCategoryIdType(String value) {
    try {
      final category = _categories.firstWhere(
        (category) => category.title == value,
      );

      return category.sId;
    } catch (e) {
      return null;
    }
  }

  Future<void> getCategories({
    String sort = 'createdAt',
    String? active,
  }) async {
    emit(const CategoryState.getCategoriesLoading());

    final response = await _categoryRepositoryImplement.getCategoriesRepo(
      sort: sort,
      active: active,
    );

    response.when(
      success: (dataResponse) {
        _categoryTitleData.clear(); // Clear old data
        dataResponse.data?.forEach((category) {
          _categoryTitleData.add(category.title); // Add new titles
        });

        _categories = dataResponse.data!;
        emit(CategoryState.getCategoriesSuccess(_categories));
      },
      failure: (error) {
        emit(CategoryState.getCategoriesError(error));
      },
    );
  }

  Future<void> fetchCreationCategory() async {
    emit(const CategoryState.createCategoriesLoading());

    final response = await _categoryRepositoryImplement.createCategoriesrepo(
      arTitleController.text.trim(),
      enTitleController.text.trim(),
      imageFile!,
    );

    response.when(
      success: (dataResponse) {
        _categories.add(dataResponse.data);

        arTitleController.clear();
        enTitleController.clear();
        imageFile = null;

        emit(CategoryState.updateCategoriesSuccess([..._categories]));
      },
      failure: (error) {
        emit(CategoryState.updateCategoriesError(error));
      },
    );
  }

  Future<void> fetchUpdateActiveOrNotCategories(
    String? id,
    bool? isActive,
  ) async {
    emit(CategoryState.updateCategoriesLoading(id!));

    final response = await _categoryRepositoryImplement
        .updateCategoriesActiveOrNotActiveRepo(id, isActive);

    response.when(
      success: (dataResponse) {
        final updatedIndex = _categories.indexWhere(
          (category) => category.sId == id,
        );

        if (updatedIndex != -1) {
          _categories[updatedIndex] = dataResponse.data;
        }

        emit(CategoryState.updateCategoriesSuccess([..._categories]));
      },
      failure: (error) {
        emit(CategoryState.updateCategoriesError(error));
      },
    );
  }

  Future<void> fetchUpdateTitleCategories(String? id) async {
    emit(CategoryState.updateCategoriesLoading(id!));

    final response = await _categoryRepositoryImplement
        .updateCategoriesTitleRepo(
          id,
          arTitleController.text.trim(),
          enTitleController.text.trim(),
        );

    response.when(
      success: (dataResponse) {
        final updatedIndex = _categories.indexWhere(
          (category) => category.sId == id,
        );

        if (updatedIndex != -1) {
          _categories[updatedIndex] = dataResponse.data;
        }

        arTitleController.clear();
        enTitleController.clear();

        emit(CategoryState.updateCategoriesSuccess([..._categories]));
      },
      failure: (error) {
        emit(CategoryState.updateCategoriesError(error));
      },
    );
  }

  Future<void> fetchUpdateImageCategories(String? id, File image) async {
    emit(CategoryState.updateCategoriesLoading(id!));

    final response = await _categoryRepositoryImplement
        .updateCategoriesImageRepo(id, image);

    response.when(
      success: (dataResponse) {
        final updatedIndex = _categories.indexWhere(
          (category) => category.sId == id,
        );

        if (updatedIndex != -1) {
          _categories[updatedIndex] = dataResponse.data;
        }

        emit(CategoryState.updateCategoriesSuccess([..._categories]));
      },
      failure: (error) {
        emit(CategoryState.updateCategoriesError(error));
      },
    );
  }

  Future<void> fetchDeleteCategories(String? id) async {
    emit(CategoryState.updateCategoriesLoading(id!));

    final response = await _categoryRepositoryImplement.deleteCategoriesrepo(
      id,
    );

    response.when(
      success: (dataResponse) {
        final updatedIndex = _categories.indexWhere(
          (category) => category.sId == id,
        );

        if (updatedIndex != -1) {
          _categories.removeAt(updatedIndex);
        }

        emit(CategoryState.updateCategoriesSuccess([..._categories]));
      },
      failure: (error) {
        emit(CategoryState.updateCategoriesError(error));
      },
    );
  }

  File? imageFile;

  Future<void> pickImage() async {
    final pickedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      emit(const CategoryState.imagePicked());
    }
  }
}
