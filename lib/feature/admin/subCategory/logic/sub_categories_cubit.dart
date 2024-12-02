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

  List<SubCategoryResponseData> get subCategories => _subCategories;

  String? categoryValueId;

  bool? active;
  void setCategoryId(String value) {
    categoryValueId = value;
  }

void setActiveStatus(bool value) {
  
    active = value;
    emit(SubCategoriesState.updateActiveStatus(active));
  }


  Future<void> fetchGetSubCategories() async {
    emit(const SubCategoriesState.getSubCategoriesLoading());

    final response =
        await _subCategoryRepositoryImplement.getSubCategoriesRepo();

    response.when(
      success: (dataResponse) {
        _subCategories = dataResponse.data!;
        emit(SubCategoriesState.getSubCategoriesSuccess(_subCategories));
      },
      failure: (error) {
        emit(
          SubCategoriesState.getSubCategoriesError(error),
        );
      },
    );
  }

  Future<void> fetchUpdateSubCategories(
 {
    String? id,
    bool? active,
  }
  ) async {
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
