import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repository/banner_repositry.dart';
import '../../data/response/banner_response.dart';

part 'banner_state.dart';
part 'banner_cubit.freezed.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this._bannerRepository) : super(const BannerState.initial());
  final BannerRepository _bannerRepository;
  static const int _retryLimit = 3;
  int _retryCount = 0;

  Future<void> getBanners() async {
    emit(const BannerState.getBannersLoading());

    final response = await _bannerRepository.getBanner();

    response.when(
      success: (dataResponse) {
        emit(BannerState.getBannersSuccess(dataResponse));
      },
      failure: (error) {
        if (_retryCount < _retryLimit) {
          _retryCount++;
          getBanners();
        } else {
          emit(
            BannerState.getBannersError(
                errorMessage: error.message!, statesCode: error.statusCode!),
          );
        }
      },
    );
  }
}
