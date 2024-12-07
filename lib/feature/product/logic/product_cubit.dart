import 'dart:io';

import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository, this._imagePicker)
      : super(const ProductState.initial());
  final ProductRepositoryImplement _productRepository;
  final TextEditingController search = TextEditingController();
  final ImagePicker _imagePicker;

  List<DataProductResponse> _newProduct = [];

  List<DataProductResponse> get dataList => _newProduct;

  List<DataProductResponse> _allProduct = [];

  List<DataProductResponse> get allProduct => _allProduct;

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
        ProductState.getNewProductError(error);
      },
    );
  }

  Future<void> fetchGetAllProduct() async {
    emit(const ProductState.getAllProductLoading());

    final response = await _productRepository.getAllProductRepo();

    response.when(
      success: (dataResponse) {
        if (dataResponse.data!.isNotEmpty) {
          _allProduct = [];
          _allProduct.addAll(dataResponse.data!);
        }
        emit(ProductState.getAllProductSuccess(dataResponse));
      },
      failure: (error) {
        ProductState.getAllProductError(error);
      },
    );
  }

  Future<void> fetchUpdateProduct({
    bool? active,
    String? arTitle,
    required String id,
    String? enTitle,
    String? price,
    String? description,
    String? subCategory,
  }) async {
    emit(ProductState.updateProductLoading(id));

    final response = await _productRepository.updateProductRepo(
        id: id,
        active: active,
        arTitle: arTitle,
        description: description,
        enTitle: enTitle,
        price: price,
        subCategory: subCategory);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _allProduct.indexWhere((product) => product.sId == id);

        if (updatedIndex != -1) {
          _allProduct[updatedIndex] = dataResponse.data;
        }

        emit(ProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        ProductState.updateProductError(error);
      },
    );
  }

  Future<void> pickImage(
    ImageSource source,
    String? id,
  ) async {
    final pickedImage = await _imagePicker.pickImage(source: source);
    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);
      await fetchUpdateProductImage(id: id!, image: imageFile);
    }
  }

  Future<void> fetchUpdateProductImage({
    required String id,
    required File image,
  }) async {
    emit(ProductState.updateProductLoading(id));

    final response =
        await _productRepository.updateProductImageRepo(id: id, image: image);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _allProduct.indexWhere((product) => product.sId == id);

        if (updatedIndex != -1) {
          _allProduct[updatedIndex] = dataResponse.data;
        }

        emit(ProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        ProductState.updateProductError(error);
      },
    );
  }
}
