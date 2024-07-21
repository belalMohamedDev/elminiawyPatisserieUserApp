


import 'package:elminiawy/feature/home/data/repository/category_repositry.dart';
import 'package:elminiawy/feature/home/data/response/category_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repository/banner_repositry.dart';
import '../../data/response/banner_response.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState<dynamic>> {
  HomeCubit(this._bannerRepository, this._categoryRepository)
      : super(const HomeState.initial());

  final BannerRepository _bannerRepository;
  final CategoryRepository _categoryRepository;

  void init() async {
    await Future.wait([
      getBanners(),
      getCategories(),
    ]);
  }

  Future<void> getBanners() async {
    emit(const HomeState.getBannersLoading());

    final response = await _bannerRepository.getBanner();

    response.when(
      success: (dataResponse) {
        emit(HomeState.getBannersSuccess(dataResponse));
      },
      failure: (error) {
        emit(
          HomeState.getBannersError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }

  

  Future<void> getCategories() async {
    emit(const HomeState.getCategoriesLoading());

    final response = await _categoryRepository.getCategories();

    response.when(
      success: (dataResponse) {
        emit(HomeState.getCategoriesSuccess(dataResponse));
      },
      failure: (error) {
        emit(
          HomeState.getCategoriesError(
              errorMessage: error.message!, statesCode: error.statusCode!),
        );
      },
    );
  }
}
