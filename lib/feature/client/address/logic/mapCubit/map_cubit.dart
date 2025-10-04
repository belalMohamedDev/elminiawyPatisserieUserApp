import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:mapbox_search/mapbox_search.dart';

part 'map_state.dart';
part 'map_cubit.freezed.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit(this.geoCoding, this._userAddressRepository)
      : super(const MapState.initial());

  final UserAddressRepositoryImplement _userAddressRepository;

  final context = instance<GlobalKey<NavigatorState>>().currentState!.context;
  final GeoCodingApi geoCoding;

  // final GoogleMapsPlaces
  //     places; // Instance of GoogleMapsPlaces for search functionality
  late GoogleMapController mapController; // Controller to manage Google Map
  late GoogleMapController
      newAddressMapController; // Controller to manage Google Map
  late GoogleMapController
      checkOutMapController; // Controller to manage Google Map
  List<MarkerData> markers = []; // List to hold custom markers

  bool isHomeScreenLocation = false;

  String? textEditingSearchText;
  String homeScreenCurrentAddress = '';
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
  Future<void> moveToLocationInTextFormField(MapBoxPlace place) async {
    emit(const MapState.loading());

    try {
      // Fetch place details using place ID
      // PlacesDetailsResponse response =
      //     await places.getDetailsByPlaceId(prediction.placeId!);

      double lat = place.geometry?.coordinates.lat ?? 0.0;
      double lng = place.geometry?.coordinates.long ?? 0.0;
      LatLng newPosition = LatLng(lat, lng);

      // Animate the map camera to the new location
      await _animateCameraToPosition(newPosition);

      // Add a marker for the new location
      await _addMarkerAndCheckAddress(newPosition);
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
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    emit(const MapState.checkAddressAvailableLoading());

    final response = await _userAddressRepository.checkAddressAvailable(
      CheckAddressAvailableRequestBody(
        latitude: currentLocation.latitude.toString(),
        longitude: currentLocation.longitude.toString(),
      ),
    );

    response.when(
      success: (dataResponse) {
        textEditingSearchText = isEnLocale
            ? dataResponse.englishAddress!
            : dataResponse.arabicAddress!;
        checkLocationAvailableResponse = dataResponse;
        emit(MapState.checkAddressAvailableSuccess(dataResponse));
      },
      failure: (error) {
        if (error.statusCode != 401) {
          emit(
            MapState.checkAddressAvailableError(error),
          );
        }
      },
    );
  }

  // Set the map controller
  void setMapController(GoogleMapController controller) async {
    mapController = controller;
    if (isHomeScreenLocation == true) {
      await moveToLocation(position: targetPosition);
    }
  }

  // Set the map controller
  void setNewAddressMapController(GoogleMapController controller) {
    newAddressMapController = controller;
  }

  // Set the map controller
  void setCheckOutMapController(GoogleMapController controller) {
    checkOutMapController = controller;
  }

  // Set the location String
  void setLocationToHome() async {
    bool isEnLocale = AppLocalizations.of(context)?.isEnLocale ?? true;

    homeScreenCurrentAddress = await SharedPrefHelper.getSecuredString(
        isEnLocale ? PrefKeys.enLocationArea : PrefKeys.arLocationArea);
    emit(MapState.setStringHomeLocationState(homeScreenCurrentAddress));
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

  void addLocationToMap(BuildContext context) {
    emit(const MapState.loading());
    try {
      final lat = SharedPrefHelper.getDouble(PrefKeys.latAddressHome);
      final long = SharedPrefHelper.getDouble(PrefKeys.longAddressHome);

      LatLng currentPosition = LatLng(lat, long);

      targetPosition = currentPosition;

      addCurrentLocationMarkerToMap(currentPosition);

      isHomeScreenLocation = true;

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
      final ApiResponse<List<MapBoxPlace>> response = await geoCoding.getPlaces(
        query.trim(),
        // proximity اختياري عشان تُعطي أفضل نتائج حوالين نقطة:
        // proximity: Location(lat: targetPosition.latitude, long: targetPosition.longitude),
      );

      // if (response.isOkay) {
      //   emit(MapState.searchResults(response.predictions));
      // } else {
      //   emit(const MapState.error("Error searching for location."));
      // }

      response.fold(
        (placesList) {
          // placesList: List<MapBoxPlace>
          // **مهم**: MapState.searchResults لازم تتقبّل نوع اللي هتبعته هنا.
          // لو MapState حالياً متوقع Google Predictions هتحتاج:
          //  - تحول MapBoxPlace -> نموذج موحد (مثلاً SearchSuggestion)
          //  - أو تضيف حالة جديدة في MapState
          emit(MapState.searchResults(placesList)); // عدّل حسب تعريفك
        },
        (failure) {
          emit(MapState.error(failure.toString()));
        },
      );
    } catch (e) {
      emit(MapState.error("Error searching for location: $e"));
    }
  }

  // Move the map camera to the specified position
  Future<void> moveToLocation(
      {required LatLng position, GoogleMapController? controller}) async {
    emit(const MapState.loading());

    final googleController = controller ?? mapController;

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
