import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/utils/map.dart';
import '../../presentation/widget/custom_store_map_marker.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this.places) : super(const MapState.initial());

  final GoogleMapsPlaces
      places; // Instance of GoogleMapsPlaces for search functionality
  late GoogleMapController mapController; // Controller to manage Google Map
  List<MarkerData> markers = []; // List to hold custom markers
  LatLng? nearestBranch; // Stores the nearest branch's location
  double nearestDistance =
      double.infinity; // Tracks the shortest distance to a branch

  // Default starting position on the map
  LatLng targetPosition = const LatLng(30.73148352751841, 31.79803739729101);

  // Initialize the map by adding the current location marker
  Future<void> init(BuildContext context) async {
    addCurrentLocationMarkerToMap(targetPosition);
  }

  Future<void> onTapFunction() async {}

  // Calculate the distance between the user location and a branch location
  double calculateDistance(LatLng userLocation, LatLng branchLocation) {
    var lat1 = userLocation.latitude;
    var lon1 = userLocation.longitude;
    var lat2 = branchLocation.latitude;
    var lon2 = branchLocation.longitude;

    double distanceInMeters =
        Geolocator.distanceBetween(lat1, lon1, lat2, lon2);

    // Update the nearest branch if the current branch is closer
    if (distanceInMeters < nearestDistance) {
      nearestDistance = distanceInMeters;
      nearestBranch = branchLocation;
    }

    return distanceInMeters;
  }

  // Set the map controller
  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  // Get the current location of the user
  Future<void> getCurrentLocation(BuildContext context) async {
    emit(const MapState.loading());

    Position? position = await _determinePosition(context);
    if (position != null) {
      LatLng currentPosition = LatLng(position.latitude, position.longitude);
      addCurrentLocationMarkerToMap(currentPosition);
      targetPosition = currentPosition;
      await moveToLocation(currentPosition);

      emit(MapState.loaded(currentPosition, {}));
    }
  }

  // Add a marker for the current location on the map
  void addCurrentLocationMarkerToMap(LatLng position) async {
    final marker = MarkerData(
      marker: Marker(
        markerId: const MarkerId('currentLocation'),
        position: position,
      ),
      child: const TextOnImage(currentLocation: true),
    );

    // Remove any existing current location marker and add the new one
    markers.removeWhere((markerData) =>
        markerData.marker.markerId == const MarkerId('currentLocation'));
    markers.add(marker);
  }

  // Search for locations based on the user's query
  Future<void> searchLocation(String query) async {
    emit(const MapState.loading());
    if (query.isEmpty) {
      // Restore the previous state if the search query is empty
      emit(state.maybeWhen(
        loaded: (currentPosition, markers) =>
            MapState.loaded(currentPosition, markers),
        orElse: () => const MapState.loaded(LatLng(0, 0), {}),
      ));
      return;
    }

    try {
      // Perform the location search
      PlacesAutocompleteResponse response = await places.autocomplete(query);
      if (response.isOkay) {
        emit(MapState.searchResults(response.predictions));
      } else {
        emit(const MapState.error("Error searching for location."));
      }
    } catch (e) {
      emit(MapState.error("Error searching for location: $e"));
    }
  }

  // Move the map to the location selected from the search results
  Future<void> moveToLocationInTextFormField(Prediction prediction) async {
    emit(const MapState.loading());

    try {
      PlacesDetailsResponse response =
          await places.getDetailsByPlaceId(prediction.placeId!);
      if (response.isOkay) {
        double lat = response.result.geometry!.location.lat;
        double lng = response.result.geometry!.location.lng;
        LatLng newPosition = LatLng(lat, lng);

        // Animate the camera to the new position
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: newPosition, zoom: 18),
          ),
        );

        // Update the map with the new location marker
        addCurrentLocationMarkerToMap(newPosition);
        emit(MapState.loaded(
            newPosition,
            state.maybeWhen(
              loaded: (_, markers) => markers,
              orElse: () => {},
            )));
      } else {
        emit(const MapState.error("Error moving to location."));
      }
    } catch (e) {
      emit(MapState.error("Error moving to location: $e"));
    }
  }

  // Move the map camera to the specified position
  Future<void> moveToLocation(LatLng position) async {
    emit(const MapState.loading());

    try {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: position, zoom: 18),
        ),
      );

      // Add a marker at the new position
      addCurrentLocationMarkerToMap(position);
      emit(MapState.loaded(position, markers as Map<String, Marker>));
    } catch (e) {
      emit(MapState.error("Error moving to location: $e"));
    }
  }

  // Determine the user's current position using Geolocator
  Future<Position?> _determinePosition(BuildContext context) async {
    return await AppUtils.determinePosition(context);
  }

  // Get the address from the latitude and longitude
  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
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
