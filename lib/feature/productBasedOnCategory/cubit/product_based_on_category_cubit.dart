import 'package:elminiawy/feature/productBasedOnCategory/data/repository/product_category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/response/product_category.dart';

part 'product_based_on_category_state.dart';
part 'product_based_on_category_cubit.freezed.dart';

class ProductBasedOnCategoryCubit extends Cubit<ProductBasedOnCategoryState> {
  ProductBasedOnCategoryCubit(this._getProductBasedOnCategoryRepository)
      : super(const ProductBasedOnCategoryState.initial());

  final GetProductBasedOnCategoryRepository
      _getProductBasedOnCategoryRepository;

  Future<void> getProduct(String id) async {
    emit(const ProductBasedOnCategoryState.getProductLoading());

    final response = await _getProductBasedOnCategoryRepository
        .getProductBasedOnCategory(id);

    response.when(
      success: (dataResponse) {
        emit(ProductBasedOnCategoryState.getProductSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            ProductBasedOnCategoryState.getProductError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }
}
