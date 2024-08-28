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
import 'add_new_address_screen.dart';

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
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        context.read<StoreAddressCuibt>().getAllStoreAddress().then(
          (value) {
            context.read<MapCubit>().getCurrentLocation(context);
            for (var store
                in context.read<StoreAddressCuibt>().addressDataList) {
              LatLng position = LatLng(store.location!.coordinates![1],
                  store.location!.coordinates![0]);

              context.read<MapCubit>().calculateDistance(
                  context.read<MapCubit>().targetPosition, position);
            }
            if (context.read<MapCubit>().nearestDistance <= 5000) {
              buttonText = "Pick Location";
            } else {
              buttonText = "Service not available in this area";
            }
          },
        ),
        context.read<MapCubit>().init(context)
      ]);
    });
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
              _mapWidget(context, mapCuibt, storeAddressCuibt),
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
                child: _currentLocationButton(
                    mapCuibt, context, storeAddressCuibt),
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

  CustomButton _pickLocationButton(BuildContext context, MapCubit mapCubit) {
    return CustomButton(
      onPressed: () async {
        if (mapCubit.nearestDistance <= 5000) {
          try {
            // Perform the async operation without using the context directly.
            final value = await mapCubit.getAddressFromLatLng(
              mapCubit.targetPosition.latitude,
              mapCubit.targetPosition.longitude,
            );

            if (!mounted) return; // Ensure the widget is still mounted.

            if (widget.isUpdateMap == true) {
              var resultData = {
                'latLng': mapCubit.targetPosition,
                'markerData': mapCubit.markers,
                'addressAreaInformation': value,
              };

              // Use the context only if the widget is still mounted.
              if (mounted) {
                Navigator.pop(context, resultData);
              }
            } else {
              // Use the context only if the widget is still mounted.
              if (mounted) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewAddressScreen(
                      latLng: mapCubit.targetPosition,
                      markerData: mapCubit.markers,
                      addressAreaInformation: value,
                    ),
                  ),
                  (route) => route.isFirst,
                );
              }
            }
          } catch (error) {
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('An error occurred. Please try again.'),
                ),
              );

              // Retry the operation if necessary.
              await Future.delayed(const Duration(seconds: 2));
              if (mounted) {
                _pickLocationButton(context, mapCubit).onPressed!();
              }
            }
          }
        }
      },
      widget: Text(
        buttonText.isEmpty ? "Enter Complete address" : buttonText,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 16.sp,
            color: ColorManger.white,
            fontWeight: FontWeightManger.semiBold),
      ),
    );
  }

  // CustomButton _pickLocationButton(BuildContext context, MapCubit mapCuibt) {
  //   return CustomButton(
  //     onPressed: () async {
  //       if (mapCuibt.nearestDistance <= 5000) {
  //         // Capture the context to use after the async call
  //         final currentContext = context;

  //         try {
  //           final value = await mapCuibt.getAddressFromLatLng(
  //             mapCuibt.targetPosition.latitude,
  //             mapCuibt.targetPosition.longitude,
  //           );

  //           if (!mounted) return; // Check if the widget is still mounted

  //           if (widget.isUpdateMap == true) {
  //             var resultData = {
  //               'latLng': mapCuibt.targetPosition,
  //               'markerData': mapCuibt.markers,
  //               'addressAreaInformation': value
  //             };

  //             Navigator.pop(currentContext, resultData);
  //           } else {
  //             Navigator.pushAndRemoveUntil(
  //               currentContext,
  //               MaterialPageRoute(
  //                 builder: (context) => AddNewAddressScreen(
  //                   latLng: mapCuibt.targetPosition,
  //                   markerData: mapCuibt.markers,
  //                   addressAreaInformation: value,
  //                 ),
  //               ),
  //               (route) => route.isFirst,
  //             );
  //           }
  //         } catch (error) {
  //           if (!mounted) return; // Check if the widget is still mounted

  //           ScaffoldMessenger.of(currentContext).showSnackBar(
  //             const SnackBar(
  //               content: Text('An error occurred. Please try again.'),
  //             ),
  //           );

  //           await Future.delayed(Duration(seconds: 2));
  //           if (!mounted) return; // Check if the widget is still mounted

  //           _pickLocationButton(currentContext, mapCuibt).onPressed!();
  //         }
  //       }
  //     },
  //     // () async {
  //     //   if (mapCuibt.nearestDistance <= 5000) {
  //     //     await mapCuibt
  //     //         .getAddressFromLatLng(mapCuibt.targetPosition.latitude,
  //     //             mapCuibt.targetPosition.longitude)
  //     //         .then(
  //     //       (value) {
  //     //         if (widget.isUpdateMap == true) {
  //     //           var resultData = {
  //     //             'latLng': mapCuibt.targetPosition,
  //     //             'markerData': mapCuibt.markers,
  //     //             'addressAreaInformation': value
  //     //           };

  //     //           Navigator.pop(context, resultData);
  //     //         } else {
  //     //           Navigator.pushAndRemoveUntil(
  //     //             context,
  //     //             MaterialPageRoute(
  //     //               builder: (context) => AddNewAddressScreen(
  //     //                   latLng: mapCuibt.targetPosition,
  //     //                   markerData: mapCuibt.markers,
  //     //                   addressAreaInformation: value),
  //     //             ),
  //     //             (route) => route.isFirst,
  //     //           );
  //     //         }
  //     //       },
  //     //     );
  //     //   }
  //     // },
  //     widget: Text(
  //       buttonText.isEmpty ? "Enter Complete address" : buttonText,
  //       style: Theme.of(context).textTheme.titleLarge?.copyWith(
  //           fontSize: 16.sp,
  //           color: ColorManger.white,
  //           fontWeight: FontWeightManger.semiBold),
  //     ),
  //   );
  // }

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

  InkWell _currentLocationButton(MapCubit mapCuibt, BuildContext context,
      StoreAddressCuibt storeAddressCuibt) {
    return InkWell(
      onTap: () {
        mapCuibt.getCurrentLocation(context);
        for (var store in storeAddressCuibt.addressDataList) {
          LatLng position = LatLng(
              store.location!.coordinates![1], store.location!.coordinates![0]);

          mapCuibt.calculateDistance(mapCuibt.targetPosition, position);
        }
        if (mapCuibt.nearestDistance <= 5000) {
          buttonText = "Pick Location";
        } else {
          buttonText = "Service not available in this area";
        }
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

  CustomGoogleMapMarkerBuilder _mapWidget(BuildContext context,
      MapCubit mapCuibt, StoreAddressCuibt storeAddressCuibt) {
    return CustomGoogleMapMarkerBuilder(
      customMarkers: context.read<MapCubit>().markers,
      builder: (p0, Set<Marker>? markers) {
        return GoogleMap(
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
              target: context.read<MapCubit>().targetPosition, zoom: 16),
          onMapCreated: (controller) =>
              context.read<MapCubit>().setMapController(controller),
          markers: markers ?? {},
          mapType: mapType,
          onTap: (argument) async {
            mapCuibt.nearestDistance = double.infinity;

            mapCuibt.addCurrentLocationMarkerToMap(argument);

            for (var store in storeAddressCuibt.addressDataList) {
              LatLng position = LatLng(store.location!.coordinates![1],
                  store.location!.coordinates![0]);

              mapCuibt.calculateDistance(argument, position);
            }

            setState(() {
              if (mapCuibt.nearestDistance <= 5000) {
                buttonText = "Pick Location";
              } else {
                buttonText = "Service not available in this area";
              }
            });
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
              },
            );
          },
        ),
      ),
    );
  }
}
