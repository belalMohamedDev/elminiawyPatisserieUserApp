import 'package:elminiawy/feature/wishList/data/model/getWishListResponse/response.dart';
import 'package:elminiawy/feature/wishList/data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'wish_list_state.dart';
part 'wish_list_cubit.freezed.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit(
      this._wishListRepository,
)
      : super(const WishListState.initial());
  final WishListRepositoryImplement _wishListRepository;

  Map<String, bool> favorites = {};

  Future<void> getWishList() async {
    emit(const WishListState.getWishListLoading());

    final response = await _wishListRepository.getWishList();

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

  Future<void> addOrRemoveProductFromWish(String product) async {
    // Update the local state immediately

    final bool isFavorite = favorites[product] ?? false;
    favorites[product] = !isFavorite;
    emit(WishListState.updateFavoriteState(favorites));

    // Emit loading state for the API call
    emit(const WishListState.addOrRemoveProductFromWishListLoading());

    final response = await _wishListRepository
        .addOrRemoveProductFromWishList(product);

    response.when(
      success: (dataResponse) {
        emit(WishListState.addOrRemoveProductFromWishListSuccess(dataResponse));
      },
      failure: (error) {
        favorites[product] = !favorites[product]!;

        emit(
          WishListState.addOrRemoveProductFromWishListError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }

  Future<void> removeProductFromWish(String product) async {
    emit(const WishListState.removeProductFromWishListLoading());

    final response = await _wishListRepository
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
