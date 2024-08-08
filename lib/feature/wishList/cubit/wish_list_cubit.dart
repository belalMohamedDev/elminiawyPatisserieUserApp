import 'package:elminiawy/feature/wishList/data/model/getWishListResponse/response.dart';
import 'package:elminiawy/feature/wishList/data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wish_list_state.dart';
part 'wish_list_cubit.freezed.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit(
    this._wishListRepository,
  ) : super(const WishListState.initial());
  final WishListRepositoryImplement _wishListRepository;

  Map<String, bool> favorites = {};
  List<WishListProductData> dataList = [];

  Future<void> getWishList() async {
    emit(const WishListState.getWishListLoading());

    final response = await _wishListRepository.getWishList();

    response.when(
      success: (dataResponse) {
        dataList = [];

        dataList.addAll(dataResponse.data!);

        emit(WishListState.getWishListSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            WishListState.getWishListError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }

  Future<void> addOrRemoveProductFromWish(String productId) async {
    // Update the local state immediately
    final bool isFavorite = favorites[productId] ?? false;
    favorites[productId] = !isFavorite;
    emit(WishListState.updateFavoriteState(favorites));

    // Emit loading state for the API call
    emit(const WishListState.addOrRemoveProductFromWishListLoading());

    final response =
        await _wishListRepository.addOrRemoveProductFromWishList(productId);

    response.when(
      success: (dataResponse) {
        if (isFavorite == true) {
          // Remove the product from dataList if it was unfavorited
          dataList.removeWhere((product) => product.sId == productId);
        }
        emit(WishListState.addOrRemoveProductFromWishListSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          favorites[productId] = !favorites[productId]!;

          emit(
            WishListState.addOrRemoveProductFromWishListError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }
}
