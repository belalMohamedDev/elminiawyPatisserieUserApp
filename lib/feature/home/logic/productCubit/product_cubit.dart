import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/response/product_response.dart';
import '../../data/repository/repositry.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._homeRepository) : super(const ProductState.initial());
  final HomeRepositoryImplement _homeRepository;
  static const int _retryLimit = 3;
  int _retryCount = 0;

  Future<void> getProduct(
      {String sort = "", String keyword = "", int limit = 4}) async {
    emit(const ProductState.getProductLoading());

    final response = await _homeRepository.getNewProduct(
        limit == 0 ? null : limit,
        sort.isEmpty ? null : sort,
        keyword.isEmpty ? null : keyword);

    response.when(
      success: (dataResponse) {
        emit(ProductState.getProductSuccess(dataResponse));
      },
      failure: (error) {
        if (_retryCount < _retryLimit) {
          _retryCount++;
          // Retry the request
          getProduct();
        } else {
          emit(
            ProductState.getProductError(
              errorMessage: error.message!,
              statesCode: error.statusCode!,
            ),
          );
          _retryCount = 0; // Reset retry count after reaching the retry limit
        }
      },
    );
  }
}
