import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:elminiawy/feature/address/logic/mapCubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/style/color/color_manger.dart';
import '../widget/mapScrrenWidget/build_search_bar.dart';
import '../widget/mapScrrenWidget/build_search_results.dart';
import '../widget/mapScrrenWidget/current_location_button.dart';
import '../widget/mapScrrenWidget/google_map_widget.dart';
import '../widget/mapScrrenWidget/pick_location_button.dart';

class MapScreen extends StatefulWidget {
  final bool isUpdateMap;
  const MapScreen({super.key, this.isUpdateMap = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  void initState() {
    final mapCuibt = context.read<MapCubit>();
    super.initState();
    mapCuibt.getCurrentLocation(context).then(
      (value) {
        context
            .read<MapCubit>()
            .checkAddressAvailableFetch(mapCuibt.targetPosition);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MapCubit, MapState>(
        listener: (context, state) {
          state.whenOrNull(
              checkAddressAvailableError: (statesCode, errorMessage) =>
                  ShowToast.showToastErrorTop(
                      errorMessage: errorMessage, context: context),
              error: (message) {
                ShowToast.showToastErrorTop(
                    errorMessage: message, context: context);
              });
        },
        builder: (context, state) {
          final mapCuibt = context.read<MapCubit>();

          return Stack(
            children: [
              GoogleMapWidget(
                mapCubit: mapCuibt,
              ),
              BuildSearchBar(
                mapCubit: mapCuibt,
              ),
              const BuildSearchResults(),
              CurrentLocationButton(
                mapCubit: mapCuibt,
              ),
              _togelMapType(),
              PickLocationButton(
                isUpdateMap: widget.isUpdateMap,
                mapCubit: mapCuibt,
                mapState: state,
              ),
            ],
          );
        },
      ),
    );
  }

  Positioned _togelMapType() {
    return Positioned(
      bottom: 105.h,
      right: 25.w,
      child: InkWell(
        onTap: () {
          context.read<MapCubit>().toggleMapType();
        },
        child: CircleAvatar(
          maxRadius: 22.r,
          backgroundColor: ColorManger.brown,
          child: Image.asset(
            ImageAsset.map,
            height: 20.h,
          ),
        ),
      ),
    );
  }
}
