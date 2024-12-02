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

  Future<void> fetchDeleteSubCategories(
    String? id,
  ) async {
    emit(SubCategoriesState.deleteSubCategoriesLoading(id!));

    final response =
        await _subCategoryRepositoryImplement.deleteSubCategoriesrepo(id);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _subCategories.indexWhere((category) => category.sId == id);

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
