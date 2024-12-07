part of 'wish_list_cubit.dart';

@freezed
class WishListState with _$WishListState {
  const factory WishListState.initial() = _Initial;

  //get WishList State
  const factory WishListState.getWishListLoading() = GetWishListLoading;
  const factory WishListState.getWishListError(
       ApiErrorModel apiErrorModel) = GetWishListError;

  const factory WishListState.getWishListSuccess(ProductResponse data) =
      GetWishListSuccess;

  //add or remove product from WishList State
  const factory WishListState.addOrRemoveProductFromWishListLoading() = AddOrRemoveProductFromWishListLoading;
  const factory WishListState.addOrRemoveProductFromWishListError(
       ApiErrorModel apiErrorModel) = AddOrRemoveProductFromWishListError;

  const factory WishListState.addOrRemoveProductFromWishListSuccess(
      ProductResponse data) =
      AddOrRemoveProductFromWishListSuccess;

  const factory WishListState.updateFavoriteState(Map<String, bool> favorites) =
      _UpdateFavoriteState;



}
