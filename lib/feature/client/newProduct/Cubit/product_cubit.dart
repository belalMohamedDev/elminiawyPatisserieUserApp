import '../../../../../core/common/shared/shared_imports.dart'; //

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(const ProductState.initial());
  final ProductRepository _productRepository;
  final TextEditingController search = TextEditingController();

  List<DataProductResponse> dataList = [];


  Future<void> getProduct() async {
    emit(const ProductState.getProductLoading());

    final response = await _productRepository.getNewProduct();

    response.when(
      success: (dataResponse) {
        if (dataResponse.data!.isNotEmpty) {
          dataList = [];
          dataList.addAll(dataResponse.data!);
        }
        emit(ProductState.getProductSuccess(dataResponse));
      },
      failure: (error) {
        ProductState.getProductError(error);

      },
    );
  }
}


