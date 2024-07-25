import 'package:elminiawy/feature/wishList/data/model/getWishListResponse/response.dart';
import 'package:elminiawy/feature/wishList/data/repository/add_remove_product.dart';
import 'package:elminiawy/feature/wishList/data/repository/get_wish_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/repository/remove_product.dart';

part 'wish_list_state.dart';
part 'wish_list_cubit.freezed.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit(
      this._getWishListRepository,
      this._addOrRemoveProductFromWishListRepository,
      this._removeProductFromWishListRepository)
      : super(const WishListState.initial());
  final GetWishListRepository _getWishListRepository;
  final AddOrRemoveProductFromWishListRepository
      _addOrRemoveProductFromWishListRepository;

  final RemoveProductFromWishListRepository
      _removeProductFromWishListRepository;
  String product = '';

  Future<void> getWishList() async {
    emit(const WishListState.getWishListLoading());

    final response = await _getWishListRepository.getWishList();

    response.when(
      success: (dataResponse) {
        emit(WishListState.getWishListSuccess(dataResponse));
      },
      failure: (error) {
        emit(
          WishListState.getWishListError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }

  Future<void> addOrRemoveProductFromWish() async {
    emit(const WishListState.addOrRemoveProductFromWishListLoading());

    final response = await _addOrRemoveProductFromWishListRepository
        .addOrRemoveProductFromWishList(product);

    response.when(
      success: (dataResponse) {
        emit(WishListState.addOrRemoveProductFromWishListSuccess(dataResponse));
      },
      failure: (error) {
        emit(
          WishListState.addOrRemoveProductFromWishListError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }

  Future<void> removeProductFromWish() async {
    emit(const WishListState.removeProductFromWishListLoading());

    final response = await _removeProductFromWishListRepository
        .removeProductFromWishList(product);

    response.when(
      success: (dataResponse) {
        emit(WishListState.removeProductFromWishListSuccess(dataResponse));
      },
      failure: (error) {
        emit(
          WishListState.removeProductFromWishListError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }
}
