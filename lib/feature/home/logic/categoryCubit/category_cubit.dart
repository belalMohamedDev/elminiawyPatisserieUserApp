import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repository/category_repositry.dart';
import '../../data/response/category_response.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._categoryRepository)
      : super(const CategoryState.initial());
  final CategoryRepository _categoryRepository;
  static const int _retryLimit = 3;
  int _retryCount = 0;
  String sort = 'createdAt';

  Future<void> getCategories() async {
    emit(const CategoryState.getCategoriesLoading());

    final response = await _categoryRepository.getCategories(sort);

    response.when(
      success: (dataResponse) {
        emit(CategoryState.getCategoriesSuccess(dataResponse));
      },
      failure: (error) {
        if (_retryCount < _retryLimit) {
          _retryCount++;
          getCategories();
        } else {
          emit(
            CategoryState.getCategoriesError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }
}
