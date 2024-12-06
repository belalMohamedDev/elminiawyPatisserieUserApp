import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(const ProductState.initial());
  final ProductRepository _productRepository;
  final TextEditingController search = TextEditingController();

  List<DataProductResponse> dataList = [];

  Future<void> fetchGetNewProduct() async {
    emit(const ProductState.getNewProductLoading());

    final response = await _productRepository.getNewProduct();

    response.when(
      success: (dataResponse) {
        if (dataResponse.data!.isNotEmpty) {
          dataList = [];
          dataList.addAll(dataResponse.data!);
        }
        emit(ProductState.getNewProductSuccess(dataResponse));
      },
      failure: (error) {
        ProductState.getNewProductError(error);
      },
    );
  }
}
