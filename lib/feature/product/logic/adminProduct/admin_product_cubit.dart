import 'dart:io';

import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'admin_product_state.dart';
part 'admin_product_cubit.freezed.dart';

class AdminProductCubit extends Cubit<AdminProductState> {
  AdminProductCubit(this._imagePicker, this._productRepository)
    : super(const AdminProductState.initial());

  final List<DataProductResponse> _allProduct = [];

  List<DataProductResponse> get allProduct => _allProduct;

  final ProductRepositoryImplement _productRepository;

  final TextEditingController search = TextEditingController();
  final ImagePicker _imagePicker;

  final TextEditingController arTitleController = TextEditingController();
  final TextEditingController enTitleController = TextEditingController();
  final TextEditingController arDescriptionController = TextEditingController();
  final TextEditingController enDescriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  String? subCategoryValueId;
  void setSubCategoryId(String value) {
    subCategoryValueId = value;
  }

  Future<void> fetchDeleteProduct(String? id) async {
    emit(const AdminProductState.updateProductLoading());
    final response = await _productRepository.deleteProductRepo(id: id!);

    response.when(
      success: (dataResponse) {
        final updatedIndex = _allProduct.indexWhere(
          (product) => product.sId == id,
        );

        if (updatedIndex != -1) {
          _allProduct.removeAt(updatedIndex);
        }

        emit(AdminProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        emit(AdminProductState.updateProductError(error));
      },
    );
  }

  int page = 1;
  int theLastPage = 0;

  Future<void> fetchGetAllProduct({bool fromPagination = false}) async {
    if (fromPagination) {
      emit(const AdminProductState.getAllProductSFromPaginationLoadingState());
    } else {
      emit(const AdminProductState.getAllProductLoading());
    }

    final response = await _productRepository.getAllProductRepo(10, page);

    response.when(
      success: (dataResponse) {
        if (dataResponse.data != null && dataResponse.data!.isNotEmpty) {
          _allProduct.addAll(dataResponse.data!);
          page++;
        } else {
          theLastPage = page;
        }
        emit(AdminProductState.getAllProductSuccess(dataResponse));
      },
      failure: (error) {
        emit(AdminProductState.getAllProductError(error));
      },
    );
  }

  Future<void> fetchUpdateProduct({bool? active, required String id}) async {
    emit(const AdminProductState.updateProductLoading());

    final response = await _productRepository.updateProductRepo(
      id: id,
      active: active,
      arDescription: arDescriptionController.text.trim(),
      enDescription: enDescriptionController.text.trim(),
      arTitle: arTitleController.text.trim(),
      enTitle: enTitleController.text.trim(),
      price: priceController.text.trim(),
      subCategory: subCategoryValueId,
    );

    response.when(
      success: (dataResponse) {
        final updatedIndex = _allProduct.indexWhere(
          (product) => product.sId == id,
        );

        if (updatedIndex != -1) {
          _allProduct[updatedIndex] = dataResponse.data;
        }

        arTitleController.clear();
        enTitleController.clear();
        arDescriptionController.clear();
        enDescriptionController.clear();
        priceController.clear();

        emit(AdminProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        emit(AdminProductState.updateProductError(error));
      },
    );
  }

  Future<void> fetchCreateProduct() async {
    emit(const AdminProductState.updateProductLoading());

    final response = await _productRepository.createProductRepo(
      image: imageFile!,
      arDescription: arDescriptionController.text.trim(),
      enDescription: enDescriptionController.text.trim(),
      arTitle: arTitleController.text.trim(),
      enTitle: enTitleController.text.trim(),
      price: priceController.text.trim(),
      subCategory: subCategoryValueId!,
    );

    response.when(
      success: (dataResponse) {
        _allProduct.insert(0, dataResponse.data);

        arTitleController.clear();
        enTitleController.clear();
        arDescriptionController.clear();
        enDescriptionController.clear();
        priceController.clear();
        imageFile = null;

        emit(AdminProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        emit(AdminProductState.updateProductError(error));
      },
    );
  }

  File? imageFile;

  Future<void> pickImage() async {
    final pickedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      emit(const AdminProductState.imagePicked());
    }
  }

  Future<void> fetchUpdateProductImage({required String id}) async {
    emit(const AdminProductState.updateProductLoading());

    final response = await _productRepository.updateProductImageRepo(
      id: id,
      image: imageFile!,
    );

    response.when(
      success: (dataResponse) {
        final updatedIndex = _allProduct.indexWhere(
          (product) => product.sId == id,
        );

        if (updatedIndex != -1) {
          _allProduct[updatedIndex] = dataResponse.data;
        }
        imageFile = null;

        emit(AdminProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        emit(AdminProductState.updateProductError(error));
      },
    );
  }
}
