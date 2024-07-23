import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repository/product_response.dart';
import '../../data/response/product_response.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(const ProductState.initial());
  final ProductRepository _productRepository;
  int limit = 8;

  Future<void> getProduct() async {
    emit(const ProductState.getProductLoading());

    final response = await _productRepository.getCategories(limit);

    response.when(
      success: (dataResponse) {
        emit(ProductState.getProductSuccess(dataResponse));
      },
      failure: (error) {
        emit(
          ProductState.getProductError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }
}
