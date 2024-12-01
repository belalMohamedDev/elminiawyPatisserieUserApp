
import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'sub_categories_state.dart';
part 'sub_categories_cubit.freezed.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit(this._subCategoryRepositoryImplement) : super(const SubCategoriesState.initial());

    final SubCategoryRepositoryImplement _subCategoryRepositoryImplement;


  List<SubCategoryResponseData> _subCategories = [];

  List<SubCategoryResponseData> get subCategories => _subCategories;

  Future<void> fetchGetSubCategories() async {
    emit(const SubCategoriesState.getSubCategoriesLoading());

    final response = await _subCategoryRepositoryImplement.getSubCategoriesRepo();

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
}
