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
  final TextEditingController arTitleController = TextEditingController();
  final TextEditingController enTitleController = TextEditingController();
  final TextEditingController arDescriptionController = TextEditingController();
  final TextEditingController enDescriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  List<DataProductResponse> _newProduct = [];

  List<DataProductResponse> get dataList => _newProduct;

  List<DataProductResponse> _allProduct = [];

  List<DataProductResponse> get allProduct => _allProduct;

  String? subCategoryValueId;
  void setSubCategoryId(String value) {
    subCategoryValueId = value;
  }

  Future<void> fetchDeleteProduct(
    String? id,
  ) async {
    emit(const ProductState.updateProductLoading());
    final response = await _productRepository.deleteProductRepo(id: id!);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _allProduct.indexWhere((product) => product.sId == id);

        if (updatedIndex != -1) {
          _allProduct.removeAt(updatedIndex);
        }

        emit(ProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        emit(ProductState.updateProductError(error));
      },
    );
  }

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
    required String id,
  }) async {
    emit(const ProductState.updateProductLoading());

    final response = await _productRepository.updateProductRepo(
        id: id,
        active: active,
        arDescription: arDescriptionController.text.trim(),
        enDescription: enDescriptionController.text.trim(),
        arTitle: arTitleController.text.trim(),
        enTitle: enTitleController.text.trim(),
        price: priceController.text.trim(),
        subCategory: subCategoryValueId);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _allProduct.indexWhere((product) => product.sId == id);

        if (updatedIndex != -1) {
          _allProduct[updatedIndex] = dataResponse.data;
        }

        arTitleController.clear();
        enTitleController.clear();
        arDescriptionController.clear();
        enDescriptionController.clear();
        priceController.clear();

        emit(ProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        ProductState.updateProductError(error);
      },
    );
  }

  Future<void> fetchCreateProduct({
    required File image,
  }) async {
    emit(const ProductState.updateProductLoading());

    final response = await _productRepository.createProductRepo(
        image: image,
        arDescription: arDescriptionController.text.trim(),
        enDescription: enDescriptionController.text.trim(),
        arTitle: arTitleController.text.trim(),
        enTitle: enTitleController.text.trim(),
        price: priceController.text.trim(),
        subCategory: subCategoryValueId!);

    response.when(
      success: (dataResponse) {
        _allProduct.insert(0, dataResponse.data);

        arTitleController.clear();
        enTitleController.clear();
        arDescriptionController.clear();
        enDescriptionController.clear();
        priceController.clear();

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
      id == null
          ? await fetchCreateProduct(image: imageFile)
          : await fetchUpdateProductImage(id: id, image: imageFile);
    }
  }

  Future<void> fetchUpdateProductImage({
    required String id,
    required File image,
  }) async {
    emit(const ProductState.updateProductLoading());

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
