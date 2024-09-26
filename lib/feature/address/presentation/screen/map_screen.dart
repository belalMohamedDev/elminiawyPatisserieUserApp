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

import '../../../../core/style/color/color_manger.dart';
import '../../../../core/style/fonts/font_manger.dart';
import '../../logic/storeAddressCubit/store_address_cuibt_cubit.dart';

class MapScreen extends StatefulWidget {
  final bool isUpdateMap;
  const MapScreen({super.key, this.isUpdateMap = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String buttonText = "";
  MapType mapType = MapType.normal;

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
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await Future.wait([
    //     context.read<StoreAddressCuibt>().getAllStoreAddress().then(
    //       (value) {
    //         context.read<MapCubit>().getCurrentLocation(context);
    //         for (var store
    //             in context.read<StoreAddressCuibt>().addressDataList) {
    //           LatLng position = LatLng(store.location!.coordinates![1],
    //               store.location!.coordinates![0]);

    //           context.read<MapCubit>().calculateDistance(
    //               context.read<MapCubit>().targetPosition, position);
    //         }
    //         if (context.read<MapCubit>().nearestDistance <= 5000) {
    //           buttonText = "Pick Location";
    //         } else {
    //           buttonText = "Service not available in this area";
    //         }
    //       },
    //     ),

    //   ]);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final mapCuibt = context.read<MapCubit>();
    final storeAddressCuibt = context.read<StoreAddressCuibt>();
    return Scaffold(
      body: BlocBuilder<MapCubit, MapState>(
        builder: (context, state) {
          if (state is Error) {
            return Center(child: Text(state.message));
          }

          return Stack(
            children: [
              _mapWidget(context, mapCuibt),
              Positioned(
                top: 45.h,
                right: 20.w,
                left: 20.w,
                child: _buildSearchBar(context),
              ),
              BlocBuilder<MapCubit, MapState>(
                builder: (context, state) {
                  if (state is SearchResults) {
                    return Positioned(
                      top: 100.h,
                      right: 10.w,
                      left: 10.w,
                      child: _buildSearchResults(state.predictions, context),
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
                child: _pickLocationButton(context, mapCuibt),
              )
            ],
          );
        },
      ),
    );
  }

  BlocBuilder _pickLocationButton(BuildContext context, MapCubit mapCubit) {
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () async {
            // if (mapCubit.nearestDistance <= 5000) {
            //   try {
            //     // Perform the async operation without using the context directly.
            //     final value = await mapCubit.getAddressFromLatLng(
            //       mapCubit.targetPosition.latitude,
            //       mapCubit.targetPosition.longitude,
            //     );

            //     if (!mounted) return; // Ensure the widget is still mounted.

            //     if (widget.isUpdateMap == true) {
            //       var resultData = {
            //         'latLng': mapCubit.targetPosition,
            //         'markerData': mapCubit.markers,
            //         'addressAreaInformation': value,
            //       };

            //       // Use the context only if the widget is still mounted.
            //       if (mounted) {
            //         Navigator.pop(context, resultData);
            //       }
            //     } else {
            //       // Use the context only if the widget is still mounted.
            //       if (mounted) {
            //         Navigator.pushAndRemoveUntil(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => AddNewAddressScreen(
            //               latLng: mapCubit.targetPosition,
            //               markerData: mapCubit.markers,
            //               addressAreaInformation: value,
            //             ),
            //           ),
            //           (route) => route.isFirst,
            //         );
            //       }
            //     }
            //   } catch (error) {
            //     if (mounted) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text('An error occurred. Please try again.'),
            //         ),
            //       );

            //       // Retry the operation if necessary.
            //       await Future.delayed(const Duration(seconds: 2));
            //       if (mounted) {
            //         _pickLocationButton(context, mapCubit).onPressed!();
            //       }
            //     }
            //   }
            // }
          },
          widget: state is CheckAddressAvailableLoading
              ? SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5.w,
                      color: ColorManger.white,
                    ),
                  ),
                )
              : Text(
                  state is CheckAddressAvailableSuccess
                      ? state.data.storeAddressAvailable == true &&
                              state.data.isAddressAvailable == true
                          ? "Pick Location"
                          : state.data.isAddressAvailable == false
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
      },
    );
  }

  InkWell _togelMapType() {
    return InkWell(
      onTap: () {
        setState(() {});
        if (mapType == MapType.normal) {
          mapType = MapType.hybrid;
        } else {
          mapType = MapType.normal;
        }
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
          mapType: mapType,
          onTap: (argument) async {
            mapCuibt.checkAddressAvailableFetch(argument);

            mapCuibt.addCurrentLocationMarkerToMap(argument);
          },
        );
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: TextFormField(
        onChanged: (value) {
          context.read<MapCubit>().searchLocation(value);
        },
        style: TextStyle(color: ColorManger.white),
        decoration: InputDecoration(
            hintText: 'Find Your Location',
            prefixIcon: Icon(IconlyBroken.search,
                size: 18.sp, color: ColorManger.white),
            hintStyle: TextStyle(color: ColorManger.white),
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
      List<Prediction> predictions, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
            color: ColorManger.brunLight,
            borderRadius: BorderRadius.circular(10.r)),
        height: 100.h,
        child: ListView.builder(
          itemCount: predictions.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                predictions[index].description!,
                style: TextStyle(color: ColorManger.white),
              ),
              onTap: () {
                context
                    .read<MapCubit>()
                    .moveToLocationInTextFormField(predictions[index]);

                
                    // .(predictions[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
