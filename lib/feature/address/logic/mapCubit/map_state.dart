part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.initial() = Initial;

  const factory MapState.loading() = Loading;

  const factory MapState.loaded(
      LatLng currentPosition, Map<String, Marker> markers) = Loaded;

  const factory MapState.searchResults(List<Prediction> predictions) = SearchResults;

  const factory MapState.error(String message) = Error;



  
  const factory MapState.checkAddressAvailableLoading() = CheckAddressAvailableLoading;

  const factory MapState.checkAddressAvailableError(
      {required int statesCode,
      required String errorMessage}) = CheckAddressAvailableError;

  const factory MapState.checkAddressAvailableSuccess(
      CheckLocationAvailableResponse data) =
      CheckAddressAvailableSuccess;
}
