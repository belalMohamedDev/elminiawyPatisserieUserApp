import 'dart:io';

import 'package:elminiawy/feature/client/category/data/repository/category_repo.dart';

import '../../../../core/common/shared/shared_imports.dart'; //

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepositoryImplement, this._imagePicker)
      : super(const CategoryState.initial());
  final CategoryRepositoryImplement _categoryRepositoryImplement;

  final TextEditingController arTitleController = TextEditingController();
  final TextEditingController enTitleController = TextEditingController();
  final ImagePicker _imagePicker;
  List<CategoryResponseData> _categories = [];

  List<CategoryResponseData> get categories => _categories;

  Future<void> getCategories({String sort = 'createdAt'}) async {
    emit(const CategoryState.getCategoriesLoading());

    final response = await _categoryRepositoryImplement.getCategoriesRepo(sort);

    response.when(
      success: (dataResponse) {
        _categories = dataResponse.data!;
        emit(CategoryState.getCategoriesSuccess(_categories));
      },
      failure: (error) {
        emit(
          CategoryState.getCategoriesError(error),
        );
      },
    );
  }

  Future<void> fetchUpdateActiveOrNotCategories(
      String? id, bool? isActive) async {
    emit(CategoryState.updateCategoriesLoading(id!));

    final response = await _categoryRepositoryImplement
        .updateCategoriesActiveOrNotActiveRepo(
      id,
      isActive,
    );

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _categories.indexWhere((category) => category.sId == id);

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

  Future<void> fetchUpdateTitleCategories(
    String? id,
  ) async {
    emit(CategoryState.updateCategoriesLoading(id!));

    final response =
        await _categoryRepositoryImplement.updateCategoriesTitleRepo(
            id, arTitleController.text.trim(), enTitleController.text.trim());

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _categories.indexWhere((category) => category.sId == id);

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

    final response =
        await _categoryRepositoryImplement.updateCategoriesImageRepo(id, image);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _categories.indexWhere((category) => category.sId == id);

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

  Future<void> fetchDeleteCategories(
    String? id,
  ) async {
    emit(CategoryState.updateCategoriesLoading(id!));

    final response =
        await _categoryRepositoryImplement.deleteCategoriesrepo(id);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _categories.indexWhere((category) => category.sId == id);

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

  Future<void> pickImage(ImageSource source, String? id) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);

      await fetchUpdateImageCategories(id, imageFile);
    }
  }
}
