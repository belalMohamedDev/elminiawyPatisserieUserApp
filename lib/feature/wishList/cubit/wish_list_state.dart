part of 'wish_list_cubit.dart';

@freezed
class WishListState with _$WishListState {
  const factory WishListState.initial() = _Initial;

  //get WishList State
  const factory WishListState.getWishListLoading() = GetWishListLoading;
  const factory WishListState.getWishListError(
      {required int statesCode,
      required String errorMessage}) = GetWishListError;

  const factory WishListState.getWishListSuccess(WishListProduct data) =
      GetWishListSuccess;

  //add or remove product from WishList State
  const factory WishListState.addOrRemoveProductFromWishListLoading() = AddOrRemoveProductFromWishListLoading;
  const factory WishListState.addOrRemoveProductFromWishListError(
      {required int statesCode,
      required String errorMessage}) = AddOrRemoveProductFromWishListError;

  const factory WishListState.addOrRemoveProductFromWishListSuccess(WishListProduct data) =
      AddOrRemoveProductFromWishListSuccess;



        //add or remove product from WishList State
  const factory WishListState.removeProductFromWishListLoading() =
      RemoveProductFromWishListLoading;
  const factory WishListState.removeProductFromWishListError(
      {required int statesCode,
      required String errorMessage}) = RemoveProductFromWishListError;

  const factory WishListState.removeProductFromWishListSuccess(
      WishListProduct data) = RemoveProductFromWishListSuccess;
}
