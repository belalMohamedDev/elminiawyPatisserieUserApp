import 'package:elminiawy/feature/client/category/data/repository/category_repo.dart';

import '../../../../core/common/shared/shared_imports.dart'; //

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepositoryImplement)
      : super(const CategoryState.initial());
  final CategoryRepositoryImplement _categoryRepositoryImplement;

  final TextEditingController arTitleController = TextEditingController();
  final TextEditingController enTitleController = TextEditingController();

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

  Future<void> fetchUpdateActiveOrNotCategories(String? id, bool? isActive) async {
    emit(CategoryState.updateCategoriesLoading(id!));

    final response = await _categoryRepositoryImplement
        .updateCategoriesActiveOrNotActiveRepo(
      id,
      isActive,
    );

    response.when(
      success: (dataResponse) {
        // Once the API succeeds, update the category with the new data
        final updatedIndex =
            _categories.indexWhere((category) => category.sId == id);

        if (updatedIndex != -1) {
          _categories[updatedIndex] = dataResponse.data;
        }

        // Emit the updated list with the category replaced
        emit(CategoryState.updateCategoriesSuccess([..._categories]));
      },
      failure: (error) {
        emit(CategoryState.updateCategoriesError(error)); // Emit failure state
      },
    );
  }
}
