import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/response/category_response.dart';
import '../../data/repository/repositry.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this._homeRepository) : super(const CategoryState.initial());
  final HomeRepositoryImplement _homeRepository;
  static const int _retryLimit = 3;
  int _retryCount = 0;

  Future<void> getCategories({String sort = 'createdAt'}) async {
    emit(const CategoryState.getCategoriesLoading());

    final response = await _homeRepository.getCategories(sort);

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
          _retryCount = 0;
        }
      },
    );
  }
}
