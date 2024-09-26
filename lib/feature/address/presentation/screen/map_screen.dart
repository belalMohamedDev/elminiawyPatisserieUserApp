import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:elminiawy/core/common/sharedWidget/custom_button.dart';
import 'package:elminiawy/core/style/images/asset_manger.dart';
import 'package:elminiawy/feature/address/logic/mapCubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/common/toast/show_toast.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';

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
              _mapWidget(context, mapCuibt),
              Positioned(
                top: 45.h,
                right: 20.w,
                left: 20.w,
                child: _buildSearchBar(context, mapCuibt),
              ),
              BlocBuilder<MapCubit, MapState>(
                builder: (context, state) {
                  if (state is SearchResults) {
                    return Positioned(
                      top: 100.h,
                      right: 10.w,
                      left: 10.w,
                      child: _buildSearchResults(
                          state.predictions, context, mapCuibt),
                    );
                  }

                  return const SizedBox();
                },
              ),
              Positioned(
                bottom: 165.h,
                right: 25.w,
                child: _currentLocationButton(mapCuibt, context),
              ),
              Positioned(
                bottom: 105.h,
                right: 25.w,
                child: _togelMapType(),
              ),
              Positioned(
                bottom: 30.h,
                left: 20.w,
                right: 20.w,
                child: _pickLocationButton(context, mapCuibt, state),
              )
            ],
          );
        },
      ),
    );
  }

  CustomButton _pickLocationButton(
      BuildContext context, MapCubit mapCubit, MapState state) {
    return CustomButton(
      onPressed: () async {
        if (mapCubit.checkLocationAvailableResponse != null) {
          if (mapCubit.checkLocationAvailableResponse!.storeAddressAvailable ==
                  true &&
              mapCubit.checkLocationAvailableResponse!.isAddressAvailable ==
                  true) {
            if (widget.isUpdateMap == true) {
              if (mounted) {
                mapCubit.moveToLocation(
                    position: mapCubit.targetPosition,
                    controller: mapCubit.newAddressMapController);
                Navigator.pop(context);
              }
            } else {
              // Use the context only if the widget is still mounted.
              if (mounted) {
                Navigator.popAndPushNamed(
                  context,
                  Routes.addNewAddress,
                );
              }
            }
          }
        }
      },
      widget: state is CheckAddressAvailableLoading
          ? SizedBox(
              height: 25.h,
              width: 25.w,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2.5.w,
                  color: ColorManger.white,
                ),
              ),
            )
          : Text(
              mapCubit.checkLocationAvailableResponse != null
                  ? mapCubit.checkLocationAvailableResponse!
                                  .storeAddressAvailable ==
                              true &&
                          mapCubit.checkLocationAvailableResponse!
                                  .isAddressAvailable ==
                              true
                      ? "Pick Location"
                      : mapCubit.checkLocationAvailableResponse!
                                  .isAddressAvailable ==
                              false
                          ? "Address not found in this area"
                          : "Service not available in this area"
                  : "Enter Complete address",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16.sp,
                    color: ColorManger.white,
                    fontWeight: FontWeightManger.semiBold,
                  ),
            ),
    );
  }

  InkWell _togelMapType() {
    return InkWell(
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
    );
  }

  InkWell _currentLocationButton(
    MapCubit mapCuibt,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        mapCuibt.getCurrentLocation(context).then(
          (value) {
            context
                .read<MapCubit>()
                .checkAddressAvailableFetch(mapCuibt.targetPosition);
          },
        );
      },
      child: CircleAvatar(
        maxRadius: 22.r,
        backgroundColor: ColorManger.brown,
        child: Image.asset(
          ImageAsset.navigation,
          height: 20.h,
        ),
      ),
    );
  }

  CustomGoogleMapMarkerBuilder _mapWidget(
      BuildContext context, MapCubit mapCuibt) {
    return CustomGoogleMapMarkerBuilder(
      customMarkers: mapCuibt.markers,
      builder: (p0, Set<Marker>? markers) {
        return GoogleMap(
          zoomControlsEnabled: false,
          initialCameraPosition:
              CameraPosition(target: mapCuibt.targetPosition, zoom: 16),
          onMapCreated: (controller) => mapCuibt.setMapController(controller),
          markers: markers ?? {},
          mapType: mapCuibt.mapType,
          onTap: (argument) async {
            mapCuibt.checkAddressAvailableFetch(argument);

            mapCuibt.addCurrentLocationMarkerToMap(argument);
          },
        );
      },
    );
  }

  Widget _buildSearchBar(BuildContext context, MapCubit mapCuibt) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextFormField(
        onChanged: (value) {
          mapCuibt.searchLocation(value);
        },
        style: TextStyle(color: ColorManger.white),
        controller: mapCuibt.searchConroller,
        decoration: InputDecoration(
            hintText: mapCuibt.textEditingSearchText,
            prefixIcon: Icon(IconlyBroken.search,
                size: 18.sp, color: ColorManger.white),
            hintStyle: const TextStyle(color: Colors.white60),
            fillColor: ColorManger.brunLight,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManger.brunLight,
              ),
              borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManger.brunLight,
              ),
              borderRadius: BorderRadius.all(Radius.elliptical(10.r, 10.r)),
            )),
      ),
    );
  }

  Widget _buildSearchResults(
      List<Prediction> predictions, BuildContext context, MapCubit mapCuibt) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
            color: ColorManger.brunLight,
            borderRadius: BorderRadius.circular(10.r)),
        constraints: BoxConstraints(
          maxHeight: 320.h,
        ),
        child: ListView.builder(
          itemCount: predictions.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                predictions[index].description!,
                style: TextStyle(color: ColorManger.white),
              ),
              onTap: () {
                mapCuibt.moveToLocationInTextFormField(predictions[index]);

                // .(predictions[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
