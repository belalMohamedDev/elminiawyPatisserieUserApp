import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'sub_categories_state.dart';
part 'sub_categories_cubit.freezed.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit(this._subCategoryRepositoryImplement)
      : super(const SubCategoriesState.initial());

  final SubCategoryRepositoryImplement _subCategoryRepositoryImplement;
  final TextEditingController arTitleController = TextEditingController();
  final TextEditingController enTitleController = TextEditingController();

  List<SubCategoryResponseData> _subCategories = [];
  final List<String?> _subCategoryTitleData = [];

  List<SubCategoryResponseData> get subCategories => _subCategories;

  List<String?> get subCategoriesTitle => _subCategoryTitleData;
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
      final subCategory = _subCategories.firstWhere(
        (subCategory) => subCategory.title == value,
      );

      return subCategory.sId;
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchCreationNewSubCategory() async {
    if (categoryValueId != null &&
        arTitleController.text.isNotEmpty &&
        enTitleController.text.isNotEmpty) {
      emit(const SubCategoriesState.createSubCategoriesLoading());

      final response =
          await _subCategoryRepositoryImplement.createNewSubCategoriesrepo(
              arTitleController.text.trim(),
              enTitleController.text.trim(),
              categoryValueId!);

      response.when(
        success: (dataResponse) {
          _subCategories.add(dataResponse.data);

          arTitleController.clear();
          enTitleController.clear();

          emit(SubCategoriesState.createSubCategoriesSuccess(
              [..._subCategories]));
        },
        failure: (error) {
          emit(SubCategoriesState.createSubCategoriesError(error));
        },
      );
    }
  }

  int page = 1;
  int theLastPage = 0;

  Future<void> fetchGetSubCategories({fromPagination = false}) async {
    if (fromPagination) {
      emit(const SubCategoriesState
          .getSubCategoriesFromPaginationLoadingState());
    } else {
      emit(const SubCategoriesState.getSubCategoriesLoading());
    }

    final response =
        await _subCategoryRepositoryImplement.getSubCategoriesRepo(16, page);

    response.when(
      success: (dataResponse) {
        //@TODO: handle pagination properly
        // _subCategoryTitleData.clear(); // Clear old data
        // dataResponse.data?.forEach((subCategory) {
        //   _subCategoryTitleData.add(subCategory.title); // Add new titles
        // });

        if (dataResponse.data!.isNotEmpty) {
          _subCategories.addAll(dataResponse.data!);
          page++;
        }else{
          theLastPage = page;
        }

        emit(SubCategoriesState.getSubCategoriesSuccess(_subCategories));
      },
      failure: (error) {
        emit(
          SubCategoriesState.getSubCategoriesError(error),
        );
      },
    );
  }

  Future<void> fetchUpdateSubCategories({
    String? id,
    bool? active,
  }) async {
    emit(SubCategoriesState.updateSubCategoriesLoading(id!));

    final response =
        await _subCategoryRepositoryImplement.updateSubCategoriesRepo(
            id,
            arTitleController.text.trim(),
            enTitleController.text.trim(),
            active,
            categoryValueId);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _subCategories.indexWhere((subCategory) => subCategory.sId == id);

        if (updatedIndex != -1) {
          _subCategories[updatedIndex] = dataResponse.data;
        }

        arTitleController.clear();
        enTitleController.clear();

        emit(
            SubCategoriesState.updateSubCategoriesSuccess([..._subCategories]));
      },
      failure: (error) {
        emit(SubCategoriesState.updateSubCategoriesError(error));
      },
    );
  }

  Future<void> fetchDeleteSubCategories(
    String? id,
  ) async {
    emit(SubCategoriesState.deleteSubCategoriesLoading(id!));

    final response =
        await _subCategoryRepositoryImplement.deleteSubCategoriesrepo(id);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _subCategories.indexWhere((subCategory) => subCategory.sId == id);

        if (updatedIndex != -1) {
          _subCategories.removeAt(updatedIndex);
        }

        emit(
            SubCategoriesState.deleteSubCategoriesSuccess([..._subCategories]));
      },
      failure: (error) {
        emit(SubCategoriesState.deleteSubCategoriesError(error));
      },
    );
  }
}
