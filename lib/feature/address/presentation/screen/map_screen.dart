import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/application/constant_manger.dart';
import '../../../../core/utils/map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final TextEditingController searchController = TextEditingController();
  LatLng? _currentPosition;
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  ScaffoldState? currentState;
  final places = GoogleMapsPlaces(apiKey: AppConstant.mapKey);
  List<Prediction> predictions = [];

  @override
  void initState() {
    mapPreProcessing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(_currentPosition!.latitude,
                            _currentPosition!.longitude),
                        zoom: 15),
                    onMapCreated: onMapCreated,
                    mapType: MapType.terrain,
                    onTap: (argument) {
                      markers.clear();
                      markers.addAll([
                        Marker(
                          markerId: const MarkerId("1"),
                          position:
                              LatLng(argument.latitude, argument.longitude),
                        )
                      ]);
                      setState(() {});

                      print(argument);
                      _getAddressFromLatLng(
                              argument.latitude, argument.longitude)
                          .then((address) {
                        print('Address: $address');
                      });
                    },
                    markers: markers),
                Positioned(
                  top: 15,
                  right: 10,
                  left: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    height: 50,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        getPredictions(value).then((predictionsList) {
                          log('$predictionsList==== value ===');
                          setState(() {
                            predictions = predictionsList;
                          });
                        });
                      },
                      decoration: InputDecoration(
                        label: const Text(
                          "بحث",
                          style: TextStyle(fontSize: 15),
                        ),
                        prefixIcon: const Icon(
                          Icons.map,
                          color: Colors.grey,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                predictions.isEmpty
                    ? const SizedBox.shrink()
                    : Positioned(
                        top: 100,
                        right: 10,
                        left: 10,
                        child: Container(
                          color: Colors.white,
                          height: 100,
                          child: ListView.builder(
                            itemCount: predictions.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(
                                  predictions[index].description!,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                onTap: () async {
                                  log(predictions[index]
                                      .description!
                                      .toString());

                                  PlacesDetailsResponse response =
                                      await places.getDetailsByPlaceId(
                                          predictions[index].placeId!);
                                  if (response.isOkay) {
                                    double lat =
                                        response.result.geometry!.location.lat;
                                    double lng =
                                        response.result.geometry!.location.lng;
                                    _changeLocation(10, LatLng(lat, lng));
                                    predictions.clear();
                                    setState(() {});
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),
              ],
            ),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void setCurrentLocation(LatLng currentPosition) {
    _currentPosition = currentPosition;
    setState(() {});
  }

  void addMarkerToMap(LatLng currentPosition) {
    markers.addAll([
      Marker(
        markerId: const MarkerId("1"),
        position: LatLng(currentPosition.latitude, currentPosition.longitude),
      )
    ]);
  }

  void mapPreProcessing() async {
    Position? currentPosition = await AppUtils.determinePosition(context);
    setCurrentLocation(LatLng(
        currentPosition?.latitude ?? 23, currentPosition?.longitude ?? 47));
    addMarkerToMap(LatLng(
        currentPosition?.latitude ?? 23, currentPosition?.longitude ?? 47));
  }

  Future<List<Prediction>> getPredictions(String query) async {
    PlacesAutocompleteResponse response = await places.autocomplete(
      query,
    );
    log("${response.predictions} here");
    if (response.isOkay) {
      return response.predictions;
    } else {
      return [];
    }
  }

  void _changeLocation(double zoom, LatLng latLng) {
    double newZoom = zoom > 15 ? zoom : 15;
    _currentPosition = latLng;
    setState(() {
      mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: newZoom)));
      markers.clear();
      _currentPosition = latLng;
      markers.add(Marker(
        markerId: const MarkerId('1'),
        position: latLng,
      ));
    });
  }

  Future<String> _getAddressFromLatLng(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );

      Placemark place = placemarks[0];
      String address =
          "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";

      return address;
    } catch (e) {
      return 'Failed to get address: $e';
    }
  }
}
