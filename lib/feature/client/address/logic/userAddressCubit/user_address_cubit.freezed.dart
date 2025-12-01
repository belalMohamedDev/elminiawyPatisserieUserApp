// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_address_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserAddressState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAddressState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserAddressState()';
}


}

/// @nodoc
class $UserAddressStateCopyWith<$Res>  {
$UserAddressStateCopyWith(UserAddressState _, $Res Function(UserAddressState) __);
}


/// Adds pattern-matching-related methods to [UserAddressState].
extension UserAddressStatePatterns on UserAddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( CreateNewAddressLoading value)?  createNewAddressLoading,TResult Function( CreateNewAddressError value)?  createNewAddressError,TResult Function( UpdateAddressRegion value)?  updateAddressRegion,TResult Function( CreateNewAddressSuccess value)?  createNewAddressSuccess,TResult Function( GetAllAddressLoading value)?  getAllAddressLoading,TResult Function( GetAllAddressError value)?  getAllAddressError,TResult Function( GetAllAddressSuccess value)?  getAllAddressSuccess,TResult Function( ChangeRegionAreaIndex value)?  changeRegionAreaIndex,TResult Function( UpdateAddressLoading value)?  updateAddressLoading,TResult Function( UpdateAddressError value)?  updateAddressError,TResult Function( UpdateAddressSuccess value)?  updateAddressSuccess,TResult Function( ChooseAddress value)?  chooseAddress,TResult Function( RemoveAddressLoading value)?  removeAddressLoading,TResult Function( RemoveAddressError value)?  removeAddressError,TResult Function( RemoveAddressSuccess value)?  removeAddressSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CreateNewAddressLoading() when createNewAddressLoading != null:
return createNewAddressLoading(_that);case CreateNewAddressError() when createNewAddressError != null:
return createNewAddressError(_that);case UpdateAddressRegion() when updateAddressRegion != null:
return updateAddressRegion(_that);case CreateNewAddressSuccess() when createNewAddressSuccess != null:
return createNewAddressSuccess(_that);case GetAllAddressLoading() when getAllAddressLoading != null:
return getAllAddressLoading(_that);case GetAllAddressError() when getAllAddressError != null:
return getAllAddressError(_that);case GetAllAddressSuccess() when getAllAddressSuccess != null:
return getAllAddressSuccess(_that);case ChangeRegionAreaIndex() when changeRegionAreaIndex != null:
return changeRegionAreaIndex(_that);case UpdateAddressLoading() when updateAddressLoading != null:
return updateAddressLoading(_that);case UpdateAddressError() when updateAddressError != null:
return updateAddressError(_that);case UpdateAddressSuccess() when updateAddressSuccess != null:
return updateAddressSuccess(_that);case ChooseAddress() when chooseAddress != null:
return chooseAddress(_that);case RemoveAddressLoading() when removeAddressLoading != null:
return removeAddressLoading(_that);case RemoveAddressError() when removeAddressError != null:
return removeAddressError(_that);case RemoveAddressSuccess() when removeAddressSuccess != null:
return removeAddressSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( CreateNewAddressLoading value)  createNewAddressLoading,required TResult Function( CreateNewAddressError value)  createNewAddressError,required TResult Function( UpdateAddressRegion value)  updateAddressRegion,required TResult Function( CreateNewAddressSuccess value)  createNewAddressSuccess,required TResult Function( GetAllAddressLoading value)  getAllAddressLoading,required TResult Function( GetAllAddressError value)  getAllAddressError,required TResult Function( GetAllAddressSuccess value)  getAllAddressSuccess,required TResult Function( ChangeRegionAreaIndex value)  changeRegionAreaIndex,required TResult Function( UpdateAddressLoading value)  updateAddressLoading,required TResult Function( UpdateAddressError value)  updateAddressError,required TResult Function( UpdateAddressSuccess value)  updateAddressSuccess,required TResult Function( ChooseAddress value)  chooseAddress,required TResult Function( RemoveAddressLoading value)  removeAddressLoading,required TResult Function( RemoveAddressError value)  removeAddressError,required TResult Function( RemoveAddressSuccess value)  removeAddressSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CreateNewAddressLoading():
return createNewAddressLoading(_that);case CreateNewAddressError():
return createNewAddressError(_that);case UpdateAddressRegion():
return updateAddressRegion(_that);case CreateNewAddressSuccess():
return createNewAddressSuccess(_that);case GetAllAddressLoading():
return getAllAddressLoading(_that);case GetAllAddressError():
return getAllAddressError(_that);case GetAllAddressSuccess():
return getAllAddressSuccess(_that);case ChangeRegionAreaIndex():
return changeRegionAreaIndex(_that);case UpdateAddressLoading():
return updateAddressLoading(_that);case UpdateAddressError():
return updateAddressError(_that);case UpdateAddressSuccess():
return updateAddressSuccess(_that);case ChooseAddress():
return chooseAddress(_that);case RemoveAddressLoading():
return removeAddressLoading(_that);case RemoveAddressError():
return removeAddressError(_that);case RemoveAddressSuccess():
return removeAddressSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( CreateNewAddressLoading value)?  createNewAddressLoading,TResult? Function( CreateNewAddressError value)?  createNewAddressError,TResult? Function( UpdateAddressRegion value)?  updateAddressRegion,TResult? Function( CreateNewAddressSuccess value)?  createNewAddressSuccess,TResult? Function( GetAllAddressLoading value)?  getAllAddressLoading,TResult? Function( GetAllAddressError value)?  getAllAddressError,TResult? Function( GetAllAddressSuccess value)?  getAllAddressSuccess,TResult? Function( ChangeRegionAreaIndex value)?  changeRegionAreaIndex,TResult? Function( UpdateAddressLoading value)?  updateAddressLoading,TResult? Function( UpdateAddressError value)?  updateAddressError,TResult? Function( UpdateAddressSuccess value)?  updateAddressSuccess,TResult? Function( ChooseAddress value)?  chooseAddress,TResult? Function( RemoveAddressLoading value)?  removeAddressLoading,TResult? Function( RemoveAddressError value)?  removeAddressError,TResult? Function( RemoveAddressSuccess value)?  removeAddressSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CreateNewAddressLoading() when createNewAddressLoading != null:
return createNewAddressLoading(_that);case CreateNewAddressError() when createNewAddressError != null:
return createNewAddressError(_that);case UpdateAddressRegion() when updateAddressRegion != null:
return updateAddressRegion(_that);case CreateNewAddressSuccess() when createNewAddressSuccess != null:
return createNewAddressSuccess(_that);case GetAllAddressLoading() when getAllAddressLoading != null:
return getAllAddressLoading(_that);case GetAllAddressError() when getAllAddressError != null:
return getAllAddressError(_that);case GetAllAddressSuccess() when getAllAddressSuccess != null:
return getAllAddressSuccess(_that);case ChangeRegionAreaIndex() when changeRegionAreaIndex != null:
return changeRegionAreaIndex(_that);case UpdateAddressLoading() when updateAddressLoading != null:
return updateAddressLoading(_that);case UpdateAddressError() when updateAddressError != null:
return updateAddressError(_that);case UpdateAddressSuccess() when updateAddressSuccess != null:
return updateAddressSuccess(_that);case ChooseAddress() when chooseAddress != null:
return chooseAddress(_that);case RemoveAddressLoading() when removeAddressLoading != null:
return removeAddressLoading(_that);case RemoveAddressError() when removeAddressError != null:
return removeAddressError(_that);case RemoveAddressSuccess() when removeAddressSuccess != null:
return removeAddressSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  createNewAddressLoading,TResult Function( ApiErrorModel apiErrorModel)?  createNewAddressError,TResult Function( String message,  LatLng latLng,  List<MarkerData> markData)?  updateAddressRegion,TResult Function( CreateAddressResponse data)?  createNewAddressSuccess,TResult Function()?  getAllAddressLoading,TResult Function( ApiErrorModel apiErrorModel)?  getAllAddressError,TResult Function( GetAddressResponse data)?  getAllAddressSuccess,TResult Function( int index,  String alias)?  changeRegionAreaIndex,TResult Function()?  updateAddressLoading,TResult Function( ApiErrorModel apiErrorModel)?  updateAddressError,TResult Function( CreateAddressResponse data)?  updateAddressSuccess,TResult Function( int data)?  chooseAddress,TResult Function()?  removeAddressLoading,TResult Function( ApiErrorModel apiErrorModel)?  removeAddressError,TResult Function( ApiSuccessGeneralModel data,  List<GetAddressResponseData> getAddressResponseData)?  removeAddressSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CreateNewAddressLoading() when createNewAddressLoading != null:
return createNewAddressLoading();case CreateNewAddressError() when createNewAddressError != null:
return createNewAddressError(_that.apiErrorModel);case UpdateAddressRegion() when updateAddressRegion != null:
return updateAddressRegion(_that.message,_that.latLng,_that.markData);case CreateNewAddressSuccess() when createNewAddressSuccess != null:
return createNewAddressSuccess(_that.data);case GetAllAddressLoading() when getAllAddressLoading != null:
return getAllAddressLoading();case GetAllAddressError() when getAllAddressError != null:
return getAllAddressError(_that.apiErrorModel);case GetAllAddressSuccess() when getAllAddressSuccess != null:
return getAllAddressSuccess(_that.data);case ChangeRegionAreaIndex() when changeRegionAreaIndex != null:
return changeRegionAreaIndex(_that.index,_that.alias);case UpdateAddressLoading() when updateAddressLoading != null:
return updateAddressLoading();case UpdateAddressError() when updateAddressError != null:
return updateAddressError(_that.apiErrorModel);case UpdateAddressSuccess() when updateAddressSuccess != null:
return updateAddressSuccess(_that.data);case ChooseAddress() when chooseAddress != null:
return chooseAddress(_that.data);case RemoveAddressLoading() when removeAddressLoading != null:
return removeAddressLoading();case RemoveAddressError() when removeAddressError != null:
return removeAddressError(_that.apiErrorModel);case RemoveAddressSuccess() when removeAddressSuccess != null:
return removeAddressSuccess(_that.data,_that.getAddressResponseData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  createNewAddressLoading,required TResult Function( ApiErrorModel apiErrorModel)  createNewAddressError,required TResult Function( String message,  LatLng latLng,  List<MarkerData> markData)  updateAddressRegion,required TResult Function( CreateAddressResponse data)  createNewAddressSuccess,required TResult Function()  getAllAddressLoading,required TResult Function( ApiErrorModel apiErrorModel)  getAllAddressError,required TResult Function( GetAddressResponse data)  getAllAddressSuccess,required TResult Function( int index,  String alias)  changeRegionAreaIndex,required TResult Function()  updateAddressLoading,required TResult Function( ApiErrorModel apiErrorModel)  updateAddressError,required TResult Function( CreateAddressResponse data)  updateAddressSuccess,required TResult Function( int data)  chooseAddress,required TResult Function()  removeAddressLoading,required TResult Function( ApiErrorModel apiErrorModel)  removeAddressError,required TResult Function( ApiSuccessGeneralModel data,  List<GetAddressResponseData> getAddressResponseData)  removeAddressSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CreateNewAddressLoading():
return createNewAddressLoading();case CreateNewAddressError():
return createNewAddressError(_that.apiErrorModel);case UpdateAddressRegion():
return updateAddressRegion(_that.message,_that.latLng,_that.markData);case CreateNewAddressSuccess():
return createNewAddressSuccess(_that.data);case GetAllAddressLoading():
return getAllAddressLoading();case GetAllAddressError():
return getAllAddressError(_that.apiErrorModel);case GetAllAddressSuccess():
return getAllAddressSuccess(_that.data);case ChangeRegionAreaIndex():
return changeRegionAreaIndex(_that.index,_that.alias);case UpdateAddressLoading():
return updateAddressLoading();case UpdateAddressError():
return updateAddressError(_that.apiErrorModel);case UpdateAddressSuccess():
return updateAddressSuccess(_that.data);case ChooseAddress():
return chooseAddress(_that.data);case RemoveAddressLoading():
return removeAddressLoading();case RemoveAddressError():
return removeAddressError(_that.apiErrorModel);case RemoveAddressSuccess():
return removeAddressSuccess(_that.data,_that.getAddressResponseData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  createNewAddressLoading,TResult? Function( ApiErrorModel apiErrorModel)?  createNewAddressError,TResult? Function( String message,  LatLng latLng,  List<MarkerData> markData)?  updateAddressRegion,TResult? Function( CreateAddressResponse data)?  createNewAddressSuccess,TResult? Function()?  getAllAddressLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getAllAddressError,TResult? Function( GetAddressResponse data)?  getAllAddressSuccess,TResult? Function( int index,  String alias)?  changeRegionAreaIndex,TResult? Function()?  updateAddressLoading,TResult? Function( ApiErrorModel apiErrorModel)?  updateAddressError,TResult? Function( CreateAddressResponse data)?  updateAddressSuccess,TResult? Function( int data)?  chooseAddress,TResult? Function()?  removeAddressLoading,TResult? Function( ApiErrorModel apiErrorModel)?  removeAddressError,TResult? Function( ApiSuccessGeneralModel data,  List<GetAddressResponseData> getAddressResponseData)?  removeAddressSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CreateNewAddressLoading() when createNewAddressLoading != null:
return createNewAddressLoading();case CreateNewAddressError() when createNewAddressError != null:
return createNewAddressError(_that.apiErrorModel);case UpdateAddressRegion() when updateAddressRegion != null:
return updateAddressRegion(_that.message,_that.latLng,_that.markData);case CreateNewAddressSuccess() when createNewAddressSuccess != null:
return createNewAddressSuccess(_that.data);case GetAllAddressLoading() when getAllAddressLoading != null:
return getAllAddressLoading();case GetAllAddressError() when getAllAddressError != null:
return getAllAddressError(_that.apiErrorModel);case GetAllAddressSuccess() when getAllAddressSuccess != null:
return getAllAddressSuccess(_that.data);case ChangeRegionAreaIndex() when changeRegionAreaIndex != null:
return changeRegionAreaIndex(_that.index,_that.alias);case UpdateAddressLoading() when updateAddressLoading != null:
return updateAddressLoading();case UpdateAddressError() when updateAddressError != null:
return updateAddressError(_that.apiErrorModel);case UpdateAddressSuccess() when updateAddressSuccess != null:
return updateAddressSuccess(_that.data);case ChooseAddress() when chooseAddress != null:
return chooseAddress(_that.data);case RemoveAddressLoading() when removeAddressLoading != null:
return removeAddressLoading();case RemoveAddressError() when removeAddressError != null:
return removeAddressError(_that.apiErrorModel);case RemoveAddressSuccess() when removeAddressSuccess != null:
return removeAddressSuccess(_that.data,_that.getAddressResponseData);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UserAddressState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserAddressState.initial()';
}


}




/// @nodoc


class CreateNewAddressLoading implements UserAddressState {
  const CreateNewAddressLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewAddressLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserAddressState.createNewAddressLoading()';
}


}




/// @nodoc


class CreateNewAddressError implements UserAddressState {
  const CreateNewAddressError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNewAddressErrorCopyWith<CreateNewAddressError> get copyWith => _$CreateNewAddressErrorCopyWithImpl<CreateNewAddressError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewAddressError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'UserAddressState.createNewAddressError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $CreateNewAddressErrorCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $CreateNewAddressErrorCopyWith(CreateNewAddressError value, $Res Function(CreateNewAddressError) _then) = _$CreateNewAddressErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$CreateNewAddressErrorCopyWithImpl<$Res>
    implements $CreateNewAddressErrorCopyWith<$Res> {
  _$CreateNewAddressErrorCopyWithImpl(this._self, this._then);

  final CreateNewAddressError _self;
  final $Res Function(CreateNewAddressError) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(CreateNewAddressError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class UpdateAddressRegion implements UserAddressState {
  const UpdateAddressRegion({required this.message, required this.latLng, required final  List<MarkerData> markData}): _markData = markData;
  

 final  String message;
 final  LatLng latLng;
 final  List<MarkerData> _markData;
 List<MarkerData> get markData {
  if (_markData is EqualUnmodifiableListView) return _markData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_markData);
}


/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAddressRegionCopyWith<UpdateAddressRegion> get copyWith => _$UpdateAddressRegionCopyWithImpl<UpdateAddressRegion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAddressRegion&&(identical(other.message, message) || other.message == message)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&const DeepCollectionEquality().equals(other._markData, _markData));
}


@override
int get hashCode => Object.hash(runtimeType,message,latLng,const DeepCollectionEquality().hash(_markData));

@override
String toString() {
  return 'UserAddressState.updateAddressRegion(message: $message, latLng: $latLng, markData: $markData)';
}


}

/// @nodoc
abstract mixin class $UpdateAddressRegionCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $UpdateAddressRegionCopyWith(UpdateAddressRegion value, $Res Function(UpdateAddressRegion) _then) = _$UpdateAddressRegionCopyWithImpl;
@useResult
$Res call({
 String message, LatLng latLng, List<MarkerData> markData
});




}
/// @nodoc
class _$UpdateAddressRegionCopyWithImpl<$Res>
    implements $UpdateAddressRegionCopyWith<$Res> {
  _$UpdateAddressRegionCopyWithImpl(this._self, this._then);

  final UpdateAddressRegion _self;
  final $Res Function(UpdateAddressRegion) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? latLng = null,Object? markData = null,}) {
  return _then(UpdateAddressRegion(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,markData: null == markData ? _self._markData : markData // ignore: cast_nullable_to_non_nullable
as List<MarkerData>,
  ));
}


}

/// @nodoc


class CreateNewAddressSuccess implements UserAddressState {
  const CreateNewAddressSuccess(this.data);
  

 final  CreateAddressResponse data;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNewAddressSuccessCopyWith<CreateNewAddressSuccess> get copyWith => _$CreateNewAddressSuccessCopyWithImpl<CreateNewAddressSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewAddressSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserAddressState.createNewAddressSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $CreateNewAddressSuccessCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $CreateNewAddressSuccessCopyWith(CreateNewAddressSuccess value, $Res Function(CreateNewAddressSuccess) _then) = _$CreateNewAddressSuccessCopyWithImpl;
@useResult
$Res call({
 CreateAddressResponse data
});




}
/// @nodoc
class _$CreateNewAddressSuccessCopyWithImpl<$Res>
    implements $CreateNewAddressSuccessCopyWith<$Res> {
  _$CreateNewAddressSuccessCopyWithImpl(this._self, this._then);

  final CreateNewAddressSuccess _self;
  final $Res Function(CreateNewAddressSuccess) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(CreateNewAddressSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreateAddressResponse,
  ));
}


}

/// @nodoc


class GetAllAddressLoading implements UserAddressState {
  const GetAllAddressLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllAddressLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserAddressState.getAllAddressLoading()';
}


}




/// @nodoc


class GetAllAddressError implements UserAddressState {
  const GetAllAddressError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllAddressErrorCopyWith<GetAllAddressError> get copyWith => _$GetAllAddressErrorCopyWithImpl<GetAllAddressError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllAddressError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'UserAddressState.getAllAddressError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetAllAddressErrorCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $GetAllAddressErrorCopyWith(GetAllAddressError value, $Res Function(GetAllAddressError) _then) = _$GetAllAddressErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetAllAddressErrorCopyWithImpl<$Res>
    implements $GetAllAddressErrorCopyWith<$Res> {
  _$GetAllAddressErrorCopyWithImpl(this._self, this._then);

  final GetAllAddressError _self;
  final $Res Function(GetAllAddressError) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetAllAddressError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class GetAllAddressSuccess implements UserAddressState {
  const GetAllAddressSuccess(this.data);
  

 final  GetAddressResponse data;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllAddressSuccessCopyWith<GetAllAddressSuccess> get copyWith => _$GetAllAddressSuccessCopyWithImpl<GetAllAddressSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllAddressSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserAddressState.getAllAddressSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $GetAllAddressSuccessCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $GetAllAddressSuccessCopyWith(GetAllAddressSuccess value, $Res Function(GetAllAddressSuccess) _then) = _$GetAllAddressSuccessCopyWithImpl;
@useResult
$Res call({
 GetAddressResponse data
});




}
/// @nodoc
class _$GetAllAddressSuccessCopyWithImpl<$Res>
    implements $GetAllAddressSuccessCopyWith<$Res> {
  _$GetAllAddressSuccessCopyWithImpl(this._self, this._then);

  final GetAllAddressSuccess _self;
  final $Res Function(GetAllAddressSuccess) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(GetAllAddressSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as GetAddressResponse,
  ));
}


}

/// @nodoc


class ChangeRegionAreaIndex implements UserAddressState {
  const ChangeRegionAreaIndex(this.index, this.alias);
  

 final  int index;
 final  String alias;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeRegionAreaIndexCopyWith<ChangeRegionAreaIndex> get copyWith => _$ChangeRegionAreaIndexCopyWithImpl<ChangeRegionAreaIndex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeRegionAreaIndex&&(identical(other.index, index) || other.index == index)&&(identical(other.alias, alias) || other.alias == alias));
}


@override
int get hashCode => Object.hash(runtimeType,index,alias);

@override
String toString() {
  return 'UserAddressState.changeRegionAreaIndex(index: $index, alias: $alias)';
}


}

/// @nodoc
abstract mixin class $ChangeRegionAreaIndexCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $ChangeRegionAreaIndexCopyWith(ChangeRegionAreaIndex value, $Res Function(ChangeRegionAreaIndex) _then) = _$ChangeRegionAreaIndexCopyWithImpl;
@useResult
$Res call({
 int index, String alias
});




}
/// @nodoc
class _$ChangeRegionAreaIndexCopyWithImpl<$Res>
    implements $ChangeRegionAreaIndexCopyWith<$Res> {
  _$ChangeRegionAreaIndexCopyWithImpl(this._self, this._then);

  final ChangeRegionAreaIndex _self;
  final $Res Function(ChangeRegionAreaIndex) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,Object? alias = null,}) {
  return _then(ChangeRegionAreaIndex(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,null == alias ? _self.alias : alias // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateAddressLoading implements UserAddressState {
  const UpdateAddressLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAddressLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserAddressState.updateAddressLoading()';
}


}




/// @nodoc


class UpdateAddressError implements UserAddressState {
  const UpdateAddressError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAddressErrorCopyWith<UpdateAddressError> get copyWith => _$UpdateAddressErrorCopyWithImpl<UpdateAddressError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAddressError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'UserAddressState.updateAddressError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $UpdateAddressErrorCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $UpdateAddressErrorCopyWith(UpdateAddressError value, $Res Function(UpdateAddressError) _then) = _$UpdateAddressErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$UpdateAddressErrorCopyWithImpl<$Res>
    implements $UpdateAddressErrorCopyWith<$Res> {
  _$UpdateAddressErrorCopyWithImpl(this._self, this._then);

  final UpdateAddressError _self;
  final $Res Function(UpdateAddressError) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(UpdateAddressError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class UpdateAddressSuccess implements UserAddressState {
  const UpdateAddressSuccess(this.data);
  

 final  CreateAddressResponse data;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAddressSuccessCopyWith<UpdateAddressSuccess> get copyWith => _$UpdateAddressSuccessCopyWithImpl<UpdateAddressSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAddressSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserAddressState.updateAddressSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateAddressSuccessCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $UpdateAddressSuccessCopyWith(UpdateAddressSuccess value, $Res Function(UpdateAddressSuccess) _then) = _$UpdateAddressSuccessCopyWithImpl;
@useResult
$Res call({
 CreateAddressResponse data
});




}
/// @nodoc
class _$UpdateAddressSuccessCopyWithImpl<$Res>
    implements $UpdateAddressSuccessCopyWith<$Res> {
  _$UpdateAddressSuccessCopyWithImpl(this._self, this._then);

  final UpdateAddressSuccess _self;
  final $Res Function(UpdateAddressSuccess) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateAddressSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CreateAddressResponse,
  ));
}


}

/// @nodoc


class ChooseAddress implements UserAddressState {
  const ChooseAddress(this.data);
  

 final  int data;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChooseAddressCopyWith<ChooseAddress> get copyWith => _$ChooseAddressCopyWithImpl<ChooseAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChooseAddress&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'UserAddressState.chooseAddress(data: $data)';
}


}

/// @nodoc
abstract mixin class $ChooseAddressCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $ChooseAddressCopyWith(ChooseAddress value, $Res Function(ChooseAddress) _then) = _$ChooseAddressCopyWithImpl;
@useResult
$Res call({
 int data
});




}
/// @nodoc
class _$ChooseAddressCopyWithImpl<$Res>
    implements $ChooseAddressCopyWith<$Res> {
  _$ChooseAddressCopyWithImpl(this._self, this._then);

  final ChooseAddress _self;
  final $Res Function(ChooseAddress) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ChooseAddress(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class RemoveAddressLoading implements UserAddressState {
  const RemoveAddressLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveAddressLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserAddressState.removeAddressLoading()';
}


}




/// @nodoc


class RemoveAddressError implements UserAddressState {
  const RemoveAddressError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveAddressErrorCopyWith<RemoveAddressError> get copyWith => _$RemoveAddressErrorCopyWithImpl<RemoveAddressError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveAddressError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'UserAddressState.removeAddressError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $RemoveAddressErrorCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $RemoveAddressErrorCopyWith(RemoveAddressError value, $Res Function(RemoveAddressError) _then) = _$RemoveAddressErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$RemoveAddressErrorCopyWithImpl<$Res>
    implements $RemoveAddressErrorCopyWith<$Res> {
  _$RemoveAddressErrorCopyWithImpl(this._self, this._then);

  final RemoveAddressError _self;
  final $Res Function(RemoveAddressError) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(RemoveAddressError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class RemoveAddressSuccess implements UserAddressState {
  const RemoveAddressSuccess(this.data, final  List<GetAddressResponseData> getAddressResponseData): _getAddressResponseData = getAddressResponseData;
  

 final  ApiSuccessGeneralModel data;
 final  List<GetAddressResponseData> _getAddressResponseData;
 List<GetAddressResponseData> get getAddressResponseData {
  if (_getAddressResponseData is EqualUnmodifiableListView) return _getAddressResponseData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_getAddressResponseData);
}


/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveAddressSuccessCopyWith<RemoveAddressSuccess> get copyWith => _$RemoveAddressSuccessCopyWithImpl<RemoveAddressSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveAddressSuccess&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other._getAddressResponseData, _getAddressResponseData));
}


@override
int get hashCode => Object.hash(runtimeType,data,const DeepCollectionEquality().hash(_getAddressResponseData));

@override
String toString() {
  return 'UserAddressState.removeAddressSuccess(data: $data, getAddressResponseData: $getAddressResponseData)';
}


}

/// @nodoc
abstract mixin class $RemoveAddressSuccessCopyWith<$Res> implements $UserAddressStateCopyWith<$Res> {
  factory $RemoveAddressSuccessCopyWith(RemoveAddressSuccess value, $Res Function(RemoveAddressSuccess) _then) = _$RemoveAddressSuccessCopyWithImpl;
@useResult
$Res call({
 ApiSuccessGeneralModel data, List<GetAddressResponseData> getAddressResponseData
});




}
/// @nodoc
class _$RemoveAddressSuccessCopyWithImpl<$Res>
    implements $RemoveAddressSuccessCopyWith<$Res> {
  _$RemoveAddressSuccessCopyWithImpl(this._self, this._then);

  final RemoveAddressSuccess _self;
  final $Res Function(RemoveAddressSuccess) _then;

/// Create a copy of UserAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,Object? getAddressResponseData = null,}) {
  return _then(RemoveAddressSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ApiSuccessGeneralModel,null == getAddressResponseData ? _self._getAddressResponseData : getAddressResponseData // ignore: cast_nullable_to_non_nullable
as List<GetAddressResponseData>,
  ));
}


}

// dart format on
