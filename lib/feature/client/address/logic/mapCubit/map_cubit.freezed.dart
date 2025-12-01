// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState()';
}


}

/// @nodoc
class $MapStateCopyWith<$Res>  {
$MapStateCopyWith(MapState _, $Res Function(MapState) __);
}


/// Adds pattern-matching-related methods to [MapState].
extension MapStatePatterns on MapState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Initial value)?  initial,TResult Function( Loading value)?  loading,TResult Function( Loaded value)?  loaded,TResult Function( SearchResults value)?  searchResults,TResult Function( Error value)?  error,TResult Function( ToggleMapState value)?  toggleMapState,TResult Function( SetStringHomeLocationState value)?  setStringHomeLocationState,TResult Function( CheckAddressAvailableLoading value)?  checkAddressAvailableLoading,TResult Function( CheckAddressAvailableError value)?  checkAddressAvailableError,TResult Function( CheckAddressAvailableSuccess value)?  checkAddressAvailableSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case SearchResults() when searchResults != null:
return searchResults(_that);case Error() when error != null:
return error(_that);case ToggleMapState() when toggleMapState != null:
return toggleMapState(_that);case SetStringHomeLocationState() when setStringHomeLocationState != null:
return setStringHomeLocationState(_that);case CheckAddressAvailableLoading() when checkAddressAvailableLoading != null:
return checkAddressAvailableLoading(_that);case CheckAddressAvailableError() when checkAddressAvailableError != null:
return checkAddressAvailableError(_that);case CheckAddressAvailableSuccess() when checkAddressAvailableSuccess != null:
return checkAddressAvailableSuccess(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Initial value)  initial,required TResult Function( Loading value)  loading,required TResult Function( Loaded value)  loaded,required TResult Function( SearchResults value)  searchResults,required TResult Function( Error value)  error,required TResult Function( ToggleMapState value)  toggleMapState,required TResult Function( SetStringHomeLocationState value)  setStringHomeLocationState,required TResult Function( CheckAddressAvailableLoading value)  checkAddressAvailableLoading,required TResult Function( CheckAddressAvailableError value)  checkAddressAvailableError,required TResult Function( CheckAddressAvailableSuccess value)  checkAddressAvailableSuccess,}){
final _that = this;
switch (_that) {
case Initial():
return initial(_that);case Loading():
return loading(_that);case Loaded():
return loaded(_that);case SearchResults():
return searchResults(_that);case Error():
return error(_that);case ToggleMapState():
return toggleMapState(_that);case SetStringHomeLocationState():
return setStringHomeLocationState(_that);case CheckAddressAvailableLoading():
return checkAddressAvailableLoading(_that);case CheckAddressAvailableError():
return checkAddressAvailableError(_that);case CheckAddressAvailableSuccess():
return checkAddressAvailableSuccess(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Initial value)?  initial,TResult? Function( Loading value)?  loading,TResult? Function( Loaded value)?  loaded,TResult? Function( SearchResults value)?  searchResults,TResult? Function( Error value)?  error,TResult? Function( ToggleMapState value)?  toggleMapState,TResult? Function( SetStringHomeLocationState value)?  setStringHomeLocationState,TResult? Function( CheckAddressAvailableLoading value)?  checkAddressAvailableLoading,TResult? Function( CheckAddressAvailableError value)?  checkAddressAvailableError,TResult? Function( CheckAddressAvailableSuccess value)?  checkAddressAvailableSuccess,}){
final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial(_that);case Loading() when loading != null:
return loading(_that);case Loaded() when loaded != null:
return loaded(_that);case SearchResults() when searchResults != null:
return searchResults(_that);case Error() when error != null:
return error(_that);case ToggleMapState() when toggleMapState != null:
return toggleMapState(_that);case SetStringHomeLocationState() when setStringHomeLocationState != null:
return setStringHomeLocationState(_that);case CheckAddressAvailableLoading() when checkAddressAvailableLoading != null:
return checkAddressAvailableLoading(_that);case CheckAddressAvailableError() when checkAddressAvailableError != null:
return checkAddressAvailableError(_that);case CheckAddressAvailableSuccess() when checkAddressAvailableSuccess != null:
return checkAddressAvailableSuccess(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( LatLng currentPosition,  Map<String, Marker> markers)?  loaded,TResult Function( List<MapBoxPlace> placesList)?  searchResults,TResult Function( String message)?  error,TResult Function( MapType mapType)?  toggleMapState,TResult Function( String homeLocation)?  setStringHomeLocationState,TResult Function()?  checkAddressAvailableLoading,TResult Function( ApiErrorModel apiErrorModel)?  checkAddressAvailableError,TResult Function( CheckLocationAvailableResponse data)?  checkAddressAvailableSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.currentPosition,_that.markers);case SearchResults() when searchResults != null:
return searchResults(_that.placesList);case Error() when error != null:
return error(_that.message);case ToggleMapState() when toggleMapState != null:
return toggleMapState(_that.mapType);case SetStringHomeLocationState() when setStringHomeLocationState != null:
return setStringHomeLocationState(_that.homeLocation);case CheckAddressAvailableLoading() when checkAddressAvailableLoading != null:
return checkAddressAvailableLoading();case CheckAddressAvailableError() when checkAddressAvailableError != null:
return checkAddressAvailableError(_that.apiErrorModel);case CheckAddressAvailableSuccess() when checkAddressAvailableSuccess != null:
return checkAddressAvailableSuccess(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( LatLng currentPosition,  Map<String, Marker> markers)  loaded,required TResult Function( List<MapBoxPlace> placesList)  searchResults,required TResult Function( String message)  error,required TResult Function( MapType mapType)  toggleMapState,required TResult Function( String homeLocation)  setStringHomeLocationState,required TResult Function()  checkAddressAvailableLoading,required TResult Function( ApiErrorModel apiErrorModel)  checkAddressAvailableError,required TResult Function( CheckLocationAvailableResponse data)  checkAddressAvailableSuccess,}) {final _that = this;
switch (_that) {
case Initial():
return initial();case Loading():
return loading();case Loaded():
return loaded(_that.currentPosition,_that.markers);case SearchResults():
return searchResults(_that.placesList);case Error():
return error(_that.message);case ToggleMapState():
return toggleMapState(_that.mapType);case SetStringHomeLocationState():
return setStringHomeLocationState(_that.homeLocation);case CheckAddressAvailableLoading():
return checkAddressAvailableLoading();case CheckAddressAvailableError():
return checkAddressAvailableError(_that.apiErrorModel);case CheckAddressAvailableSuccess():
return checkAddressAvailableSuccess(_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( LatLng currentPosition,  Map<String, Marker> markers)?  loaded,TResult? Function( List<MapBoxPlace> placesList)?  searchResults,TResult? Function( String message)?  error,TResult? Function( MapType mapType)?  toggleMapState,TResult? Function( String homeLocation)?  setStringHomeLocationState,TResult? Function()?  checkAddressAvailableLoading,TResult? Function( ApiErrorModel apiErrorModel)?  checkAddressAvailableError,TResult? Function( CheckLocationAvailableResponse data)?  checkAddressAvailableSuccess,}) {final _that = this;
switch (_that) {
case Initial() when initial != null:
return initial();case Loading() when loading != null:
return loading();case Loaded() when loaded != null:
return loaded(_that.currentPosition,_that.markers);case SearchResults() when searchResults != null:
return searchResults(_that.placesList);case Error() when error != null:
return error(_that.message);case ToggleMapState() when toggleMapState != null:
return toggleMapState(_that.mapType);case SetStringHomeLocationState() when setStringHomeLocationState != null:
return setStringHomeLocationState(_that.homeLocation);case CheckAddressAvailableLoading() when checkAddressAvailableLoading != null:
return checkAddressAvailableLoading();case CheckAddressAvailableError() when checkAddressAvailableError != null:
return checkAddressAvailableError(_that.apiErrorModel);case CheckAddressAvailableSuccess() when checkAddressAvailableSuccess != null:
return checkAddressAvailableSuccess(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class Initial implements MapState {
  const Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState.initial()';
}


}




/// @nodoc


class Loading implements MapState {
  const Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState.loading()';
}


}




/// @nodoc


class Loaded implements MapState {
  const Loaded(this.currentPosition, final  Map<String, Marker> markers): _markers = markers;
  

 final  LatLng currentPosition;
 final  Map<String, Marker> _markers;
 Map<String, Marker> get markers {
  if (_markers is EqualUnmodifiableMapView) return _markers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_markers);
}


/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadedCopyWith<Loaded> get copyWith => _$LoadedCopyWithImpl<Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Loaded&&(identical(other.currentPosition, currentPosition) || other.currentPosition == currentPosition)&&const DeepCollectionEquality().equals(other._markers, _markers));
}


@override
int get hashCode => Object.hash(runtimeType,currentPosition,const DeepCollectionEquality().hash(_markers));

@override
String toString() {
  return 'MapState.loaded(currentPosition: $currentPosition, markers: $markers)';
}


}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) = _$LoadedCopyWithImpl;
@useResult
$Res call({
 LatLng currentPosition, Map<String, Marker> markers
});




}
/// @nodoc
class _$LoadedCopyWithImpl<$Res>
    implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentPosition = null,Object? markers = null,}) {
  return _then(Loaded(
null == currentPosition ? _self.currentPosition : currentPosition // ignore: cast_nullable_to_non_nullable
as LatLng,null == markers ? _self._markers : markers // ignore: cast_nullable_to_non_nullable
as Map<String, Marker>,
  ));
}


}

/// @nodoc


class SearchResults implements MapState {
  const SearchResults(final  List<MapBoxPlace> placesList): _placesList = placesList;
  

 final  List<MapBoxPlace> _placesList;
 List<MapBoxPlace> get placesList {
  if (_placesList is EqualUnmodifiableListView) return _placesList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_placesList);
}


/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchResultsCopyWith<SearchResults> get copyWith => _$SearchResultsCopyWithImpl<SearchResults>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchResults&&const DeepCollectionEquality().equals(other._placesList, _placesList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_placesList));

@override
String toString() {
  return 'MapState.searchResults(placesList: $placesList)';
}


}

/// @nodoc
abstract mixin class $SearchResultsCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $SearchResultsCopyWith(SearchResults value, $Res Function(SearchResults) _then) = _$SearchResultsCopyWithImpl;
@useResult
$Res call({
 List<MapBoxPlace> placesList
});




}
/// @nodoc
class _$SearchResultsCopyWithImpl<$Res>
    implements $SearchResultsCopyWith<$Res> {
  _$SearchResultsCopyWithImpl(this._self, this._then);

  final SearchResults _self;
  final $Res Function(SearchResults) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? placesList = null,}) {
  return _then(SearchResults(
null == placesList ? _self._placesList : placesList // ignore: cast_nullable_to_non_nullable
as List<MapBoxPlace>,
  ));
}


}

/// @nodoc


class Error implements MapState {
  const Error(this.message);
  

 final  String message;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MapState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ToggleMapState implements MapState {
  const ToggleMapState(this.mapType);
  

 final  MapType mapType;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ToggleMapStateCopyWith<ToggleMapState> get copyWith => _$ToggleMapStateCopyWithImpl<ToggleMapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ToggleMapState&&(identical(other.mapType, mapType) || other.mapType == mapType));
}


@override
int get hashCode => Object.hash(runtimeType,mapType);

@override
String toString() {
  return 'MapState.toggleMapState(mapType: $mapType)';
}


}

/// @nodoc
abstract mixin class $ToggleMapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $ToggleMapStateCopyWith(ToggleMapState value, $Res Function(ToggleMapState) _then) = _$ToggleMapStateCopyWithImpl;
@useResult
$Res call({
 MapType mapType
});




}
/// @nodoc
class _$ToggleMapStateCopyWithImpl<$Res>
    implements $ToggleMapStateCopyWith<$Res> {
  _$ToggleMapStateCopyWithImpl(this._self, this._then);

  final ToggleMapState _self;
  final $Res Function(ToggleMapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mapType = null,}) {
  return _then(ToggleMapState(
null == mapType ? _self.mapType : mapType // ignore: cast_nullable_to_non_nullable
as MapType,
  ));
}


}

/// @nodoc


class SetStringHomeLocationState implements MapState {
  const SetStringHomeLocationState(this.homeLocation);
  

 final  String homeLocation;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetStringHomeLocationStateCopyWith<SetStringHomeLocationState> get copyWith => _$SetStringHomeLocationStateCopyWithImpl<SetStringHomeLocationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetStringHomeLocationState&&(identical(other.homeLocation, homeLocation) || other.homeLocation == homeLocation));
}


@override
int get hashCode => Object.hash(runtimeType,homeLocation);

@override
String toString() {
  return 'MapState.setStringHomeLocationState(homeLocation: $homeLocation)';
}


}

/// @nodoc
abstract mixin class $SetStringHomeLocationStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $SetStringHomeLocationStateCopyWith(SetStringHomeLocationState value, $Res Function(SetStringHomeLocationState) _then) = _$SetStringHomeLocationStateCopyWithImpl;
@useResult
$Res call({
 String homeLocation
});




}
/// @nodoc
class _$SetStringHomeLocationStateCopyWithImpl<$Res>
    implements $SetStringHomeLocationStateCopyWith<$Res> {
  _$SetStringHomeLocationStateCopyWithImpl(this._self, this._then);

  final SetStringHomeLocationState _self;
  final $Res Function(SetStringHomeLocationState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? homeLocation = null,}) {
  return _then(SetStringHomeLocationState(
null == homeLocation ? _self.homeLocation : homeLocation // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CheckAddressAvailableLoading implements MapState {
  const CheckAddressAvailableLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAddressAvailableLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MapState.checkAddressAvailableLoading()';
}


}




/// @nodoc


class CheckAddressAvailableError implements MapState {
  const CheckAddressAvailableError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckAddressAvailableErrorCopyWith<CheckAddressAvailableError> get copyWith => _$CheckAddressAvailableErrorCopyWithImpl<CheckAddressAvailableError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAddressAvailableError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'MapState.checkAddressAvailableError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $CheckAddressAvailableErrorCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $CheckAddressAvailableErrorCopyWith(CheckAddressAvailableError value, $Res Function(CheckAddressAvailableError) _then) = _$CheckAddressAvailableErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$CheckAddressAvailableErrorCopyWithImpl<$Res>
    implements $CheckAddressAvailableErrorCopyWith<$Res> {
  _$CheckAddressAvailableErrorCopyWithImpl(this._self, this._then);

  final CheckAddressAvailableError _self;
  final $Res Function(CheckAddressAvailableError) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(CheckAddressAvailableError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class CheckAddressAvailableSuccess implements MapState {
  const CheckAddressAvailableSuccess(this.data);
  

 final  CheckLocationAvailableResponse data;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckAddressAvailableSuccessCopyWith<CheckAddressAvailableSuccess> get copyWith => _$CheckAddressAvailableSuccessCopyWithImpl<CheckAddressAvailableSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckAddressAvailableSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'MapState.checkAddressAvailableSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $CheckAddressAvailableSuccessCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory $CheckAddressAvailableSuccessCopyWith(CheckAddressAvailableSuccess value, $Res Function(CheckAddressAvailableSuccess) _then) = _$CheckAddressAvailableSuccessCopyWithImpl;
@useResult
$Res call({
 CheckLocationAvailableResponse data
});




}
/// @nodoc
class _$CheckAddressAvailableSuccessCopyWithImpl<$Res>
    implements $CheckAddressAvailableSuccessCopyWith<$Res> {
  _$CheckAddressAvailableSuccessCopyWithImpl(this._self, this._then);

  final CheckAddressAvailableSuccess _self;
  final $Res Function(CheckAddressAvailableSuccess) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CheckAddressAvailableSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CheckLocationAvailableResponse,
  ));
}


}

// dart format on
