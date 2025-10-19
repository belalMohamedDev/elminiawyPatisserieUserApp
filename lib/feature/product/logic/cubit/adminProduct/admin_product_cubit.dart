import 'dart:io';

import 'package:elminiawy/core/common/shared/shared_imports.dart';

part 'admin_product_state.dart';
part '../admin_product_cubit.freezed.dart';

class AdminProductCubit extends Cubit<AdminProductState> {
  AdminProductCubit(this._imagePicker, this._productRepository) : super(const AdminProductState.initial());


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


  Future<void> fetchDeleteProduct(
    String? id,
  ) async {
    emit(const AdminProductState.updateProductLoading());
    final response = await _productRepository.deleteProductRepo(id: id!);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _allProduct.indexWhere((product) => product.sId == id);

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

  Future<void> fetchGetAllProduct({fromPagination = false}) async {
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


    Future<void> fetchUpdateProduct({
    bool? active,
    required String id,
  }) async {
    emit(const AdminProductState.updateProductLoading());

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

        emit(AdminProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        
         emit(AdminProductState.updateProductError(error));
      },
    );
  }


  Future<void> fetchCreateProduct({
    required File image,
  }) async {
    emit(const AdminProductState.updateProductLoading());

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

        emit(AdminProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        emit(AdminProductState.updateProductError(error));
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
    emit(const AdminProductState.updateProductLoading());

    final response =
        await _productRepository.updateProductImageRepo(id: id, image: image);

    response.when(
      success: (dataResponse) {
        final updatedIndex =
            _allProduct.indexWhere((product) => product.sId == id);

        if (updatedIndex != -1) {
          _allProduct[updatedIndex] = dataResponse.data;
        }

        emit(AdminProductState.updateProductSuccess([..._allProduct]));
      },
      failure: (error) {
        emit(AdminProductState.updateProductError(error));
      },
    );
  }







}






