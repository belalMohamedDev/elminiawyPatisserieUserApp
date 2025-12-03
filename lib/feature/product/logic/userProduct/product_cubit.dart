import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(const ProductState.initial()) {
    _productRepository.onNewProductDataUpdated = (updatedModel) {
      _newProduct = updatedModel.data!;
      emit(ProductState.getNewProductSuccess(updatedModel));
    };
  }
  final ProductRepositoryImplement _productRepository;

  List<DataProductResponse> _newProduct = [];

  List<DataProductResponse> get dataList => _newProduct;

  Future<void> fetchGetNewProductToUser() async {
    emit(const ProductState.getNewProductLoading());

    final response = await _productRepository.getNewProductRepo(limit: "10");

    response.when(
      success: (dataResponse) {
        if (dataResponse.data!.isNotEmpty) {
          _newProduct = [];
          _newProduct.addAll(dataResponse.data!);
        }
        emit(ProductState.getNewProductSuccess(dataResponse));
      },
      failure: (error) {
        emit(ProductState.getNewProductError(error));
      },
    );
  }
}
