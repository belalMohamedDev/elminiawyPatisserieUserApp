import '../../../../../core/common/shared/shared_imports.dart'; //

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this.places, this._userAddressRepository)
      : super(const MapState.initial());
  final UserAddressRepositoryImplement _userAddressRepository;

  final GoogleMapsPlaces
      places; // Instance of GoogleMapsPlaces for search functionality
  late GoogleMapController mapController; // Controller to manage Google Map
  late GoogleMapController
      newAddressMapController; // Controller to manage Google Map
  late GoogleMapController
      checkOutMapController; // Controller to manage Google Map
  List<MarkerData> markers = []; // List to hold custom markers

  String textEditingSearchText = 'Find Your Location';
  final TextEditingController searchConroller = TextEditingController();

  // Default starting position on the map
  LatLng targetPosition = const LatLng(30.73148352751841, 31.79803739729101);

  MapType mapType = MapType.normal;

  CheckLocationAvailableResponse? checkLocationAvailableResponse;

  void toggleMapType() {
    if (mapType == MapType.normal) {
      mapType = MapType.hybrid;
    } else {
      mapType = MapType.normal;
    }

    emit(MapState.toggleMapState(mapType));
  }

  // Move the map to the location selected from the search results
  Future<void> moveToLocationInTextFormField(Prediction prediction) async {
    emit(const MapState.loading());

    try {
      // Fetch place details using place ID
      PlacesDetailsResponse response =
          await places.getDetailsByPlaceId(prediction.placeId!);

      if (response.isOkay) {
        double lat = response.result.geometry!.location.lat;
        double lng = response.result.geometry!.location.lng;
        LatLng newPosition = LatLng(lat, lng);

        // Animate the map camera to the new location
        await _animateCameraToPosition(newPosition);

        // Add a marker for the new location
        await _addMarkerAndCheckAddress(newPosition);
      } else {
        emit(const MapState.error("Error moving to location."));
      }
    } catch (e) {
      emit(MapState.error("Error moving to location: $e"));
    }
  }

// Private method to animate the camera
  Future<void> _animateCameraToPosition(LatLng position) async {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 18),
      ),
    );
  }

// Private method to add a marker and check the address availability
  Future<void> _addMarkerAndCheckAddress(LatLng position) async {
    // Add the current location marker
    addCurrentLocationMarkerToMap(position);

    // Check if the address is available
    await checkAddressAvailableFetch(position);

    searchConroller.clear();
  }

// Add a marker for the current location
  void addCurrentLocationMarkerToMap(LatLng position) {
    targetPosition = position;

    // Remove any existing marker for the current location and add the new one
    markers.removeWhere(
      (markerData) =>
          markerData.marker.markerId == const MarkerId('currentLocation'),
    );

    final marker = MarkerData(
      marker: Marker(
        markerId: const MarkerId('currentLocation'),
        position: position,
      ),
      child: const TextOnImage(currentLocation: true),
    );

    markers.add(marker);
  }

// Check if the address is available
  Future<void> checkAddressAvailableFetch(LatLng currentLocation) async {
    emit(const MapState.checkAddressAvailableLoading());

    final response = await _userAddressRepository.checkAddressAvailable(
      CheckAddressAvailableRequestBody(
        latitude: currentLocation.latitude.toString(),
        longitude: currentLocation.longitude.toString(),
      ),
    );

    response.when(
      success: (dataResponse) {
        textEditingSearchText = dataResponse.address!;
        checkLocationAvailableResponse = dataResponse;
        emit(MapState.checkAddressAvailableSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            MapState.checkAddressAvailableError(
              errorMessage: error.message!,
              statesCode: error.statusCode!,
            ),
          );
        }
      },
    );
  }

  // Set the map controller
  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  // Set the map controller
  void setNewAddressMapController(GoogleMapController controller) {
    newAddressMapController = controller;
  }

  // Set the map controller
  void setCheckOutMapController(GoogleMapController controller) {
    checkOutMapController = controller;
  }

  Future<void> getCurrentLocation(BuildContext context) async {
    emit(const MapState.loading());

    try {
      Position? position = await _determinePosition(context).timeout(
        const Duration(seconds: 10), // Set a time limit to prevent long waits
        onTimeout: () {
          throw Exception("Location request timed out.");
        },
      );

      if (position != null) {
        LatLng currentPosition = LatLng(position.latitude, position.longitude);
        addCurrentLocationMarkerToMap(currentPosition);
        targetPosition = currentPosition;
        await moveToLocation(position: currentPosition);

        emit(MapState.loaded(currentPosition, {}));
      }
    } catch (e) {
      emit(MapState.error("Failed to get current location: $e"));
    }
  }

  Future<void> addLocationToMap(BuildContext context) async {
    emit(const MapState.loading());
    try {
      final lat = await SharedPrefHelper.getDouble(PrefKeys.latAddressHome);
      final long = await SharedPrefHelper.getDouble(PrefKeys.longAddressHome);

      LatLng currentPosition = LatLng(lat, long);

      targetPosition = currentPosition;

      addCurrentLocationMarkerToMap(currentPosition);

      // await moveToLocation(position: currentPosition);

      emit(MapState.loaded(currentPosition, {}));
    } catch (e) {
      emit(MapState.error("Failed to load location: $e"));
    }
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
      PlacesAutocompleteResponse response =
          await places.autocomplete(query.trim());
      if (response.isOkay) {
        emit(MapState.searchResults(response.predictions));
      } else {
        emit(const MapState.error("Error searching for location."));
      }
    } catch (e) {
      emit(MapState.error("Error searching for location: $e"));
    }
  }

  // Move the map camera to the specified position
  Future<void> moveToLocation(
      {required LatLng position, GoogleMapController? controller}) async {
    emit(const MapState.loading());

    GoogleMapController googleController = controller ?? mapController;

    try {
      googleController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: position, zoom: controller == null ? 18 : 14),
        ),
      );
    } catch (e) {
      emit(MapState.error("Error moving to location: $e"));
    }
  }

  // Determine the user's current position using Geolocator
  Future<Position?> _determinePosition(BuildContext context) async {
    return await AppUtils.determinePosition(context);
  }
}
