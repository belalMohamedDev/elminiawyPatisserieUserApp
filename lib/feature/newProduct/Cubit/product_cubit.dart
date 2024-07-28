import 'package:elminiawy/feature/newProduct/model/repository/repositry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums/filter_button_enum.dart';
import '../model/response/product_response.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._productRepository) : super(const ProductState.initial());
  final ProductRepository _productRepository;
  final TextEditingController search = TextEditingController();

  final List<DataProductResponse> dataList = [];
  List<DataProductResponse>? searchList;
  static const int _retryLimit = 3;
  int _retryCount = 0;

  Future<void> getProduct() async {
    emit(const ProductState.getProductLoading());

    final response = await _productRepository.getNewProduct();

    response.when(
      success: (dataResponse) {
        if (dataResponse.data!.isNotEmpty) {
          dataList.addAll(dataResponse.data!);
        }
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

  void clearSearch() {
    search.clear();
    searchList = [];
    
    emit(
      ProductState.addItemToList(searchList!),
    );
  }

  void addItemToList(String value,
      {double? minPrice, double? maxPrice, SortOrder? sortOrder}) {
    if (value.isEmpty) {
      searchList = [];
    } else {
      searchList = dataList.where((element) {
        final title = element.title?.toLowerCase() ?? '';
        final description = element.description?.toLowerCase() ?? '';
        final searchValue = value.toLowerCase();
        final price = element.price ?? 0.0;

        final matchesSearch = title.startsWith(searchValue) ||
            description.startsWith(searchValue);
        final matchesPrice = (minPrice == null || price >= minPrice) &&
            (maxPrice == null || price <= maxPrice);

        return matchesSearch && matchesPrice;
      }).toList();

      // Apply sorting based on the sortOrder
      if (sortOrder != null) {
        switch (sortOrder) {
          case SortOrder.aToZ:
            searchList!.sort((a, b) => a.title!.compareTo(b.title!));
            break;
          case SortOrder.zToA:
            searchList!.sort((a, b) => b.title!.compareTo(a.title!));
            break;
          case SortOrder.priceLowToHigh:
            searchList!.sort((a, b) => a.price!.compareTo(b.price!));
            break;
          case SortOrder.priceHighToLow:
            searchList!.sort((a, b) => b.price!.compareTo(a.price!));
            break;
        }
      }
    }

    emit(
      ProductState.addItemToList(searchList!),
    );
  }
}
