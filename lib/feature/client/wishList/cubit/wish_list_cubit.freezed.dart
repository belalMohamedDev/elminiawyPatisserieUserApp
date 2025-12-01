// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wish_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WishListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WishListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WishListState()';
}


}

/// @nodoc
class $WishListStateCopyWith<$Res>  {
$WishListStateCopyWith(WishListState _, $Res Function(WishListState) __);
}


/// Adds pattern-matching-related methods to [WishListState].
extension WishListStatePatterns on WishListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetWishListLoading value)?  getWishListLoading,TResult Function( GetWishListError value)?  getWishListError,TResult Function( GetWishListSuccess value)?  getWishListSuccess,TResult Function( AddOrRemoveProductFromWishListLoading value)?  addOrRemoveProductFromWishListLoading,TResult Function( AddOrRemoveProductFromWishListError value)?  addOrRemoveProductFromWishListError,TResult Function( AddOrRemoveProductFromWishListSuccess value)?  addOrRemoveProductFromWishListSuccess,TResult Function( _UpdateFavoriteState value)?  updateFavoriteState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetWishListLoading() when getWishListLoading != null:
return getWishListLoading(_that);case GetWishListError() when getWishListError != null:
return getWishListError(_that);case GetWishListSuccess() when getWishListSuccess != null:
return getWishListSuccess(_that);case AddOrRemoveProductFromWishListLoading() when addOrRemoveProductFromWishListLoading != null:
return addOrRemoveProductFromWishListLoading(_that);case AddOrRemoveProductFromWishListError() when addOrRemoveProductFromWishListError != null:
return addOrRemoveProductFromWishListError(_that);case AddOrRemoveProductFromWishListSuccess() when addOrRemoveProductFromWishListSuccess != null:
return addOrRemoveProductFromWishListSuccess(_that);case _UpdateFavoriteState() when updateFavoriteState != null:
return updateFavoriteState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetWishListLoading value)  getWishListLoading,required TResult Function( GetWishListError value)  getWishListError,required TResult Function( GetWishListSuccess value)  getWishListSuccess,required TResult Function( AddOrRemoveProductFromWishListLoading value)  addOrRemoveProductFromWishListLoading,required TResult Function( AddOrRemoveProductFromWishListError value)  addOrRemoveProductFromWishListError,required TResult Function( AddOrRemoveProductFromWishListSuccess value)  addOrRemoveProductFromWishListSuccess,required TResult Function( _UpdateFavoriteState value)  updateFavoriteState,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetWishListLoading():
return getWishListLoading(_that);case GetWishListError():
return getWishListError(_that);case GetWishListSuccess():
return getWishListSuccess(_that);case AddOrRemoveProductFromWishListLoading():
return addOrRemoveProductFromWishListLoading(_that);case AddOrRemoveProductFromWishListError():
return addOrRemoveProductFromWishListError(_that);case AddOrRemoveProductFromWishListSuccess():
return addOrRemoveProductFromWishListSuccess(_that);case _UpdateFavoriteState():
return updateFavoriteState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetWishListLoading value)?  getWishListLoading,TResult? Function( GetWishListError value)?  getWishListError,TResult? Function( GetWishListSuccess value)?  getWishListSuccess,TResult? Function( AddOrRemoveProductFromWishListLoading value)?  addOrRemoveProductFromWishListLoading,TResult? Function( AddOrRemoveProductFromWishListError value)?  addOrRemoveProductFromWishListError,TResult? Function( AddOrRemoveProductFromWishListSuccess value)?  addOrRemoveProductFromWishListSuccess,TResult? Function( _UpdateFavoriteState value)?  updateFavoriteState,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetWishListLoading() when getWishListLoading != null:
return getWishListLoading(_that);case GetWishListError() when getWishListError != null:
return getWishListError(_that);case GetWishListSuccess() when getWishListSuccess != null:
return getWishListSuccess(_that);case AddOrRemoveProductFromWishListLoading() when addOrRemoveProductFromWishListLoading != null:
return addOrRemoveProductFromWishListLoading(_that);case AddOrRemoveProductFromWishListError() when addOrRemoveProductFromWishListError != null:
return addOrRemoveProductFromWishListError(_that);case AddOrRemoveProductFromWishListSuccess() when addOrRemoveProductFromWishListSuccess != null:
return addOrRemoveProductFromWishListSuccess(_that);case _UpdateFavoriteState() when updateFavoriteState != null:
return updateFavoriteState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getWishListLoading,TResult Function( ApiErrorModel apiErrorModel)?  getWishListError,TResult Function( ProductResponse data)?  getWishListSuccess,TResult Function()?  addOrRemoveProductFromWishListLoading,TResult Function( ApiErrorModel apiErrorModel)?  addOrRemoveProductFromWishListError,TResult Function( ProductResponse data)?  addOrRemoveProductFromWishListSuccess,TResult Function( Map<String, bool> favorites)?  updateFavoriteState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetWishListLoading() when getWishListLoading != null:
return getWishListLoading();case GetWishListError() when getWishListError != null:
return getWishListError(_that.apiErrorModel);case GetWishListSuccess() when getWishListSuccess != null:
return getWishListSuccess(_that.data);case AddOrRemoveProductFromWishListLoading() when addOrRemoveProductFromWishListLoading != null:
return addOrRemoveProductFromWishListLoading();case AddOrRemoveProductFromWishListError() when addOrRemoveProductFromWishListError != null:
return addOrRemoveProductFromWishListError(_that.apiErrorModel);case AddOrRemoveProductFromWishListSuccess() when addOrRemoveProductFromWishListSuccess != null:
return addOrRemoveProductFromWishListSuccess(_that.data);case _UpdateFavoriteState() when updateFavoriteState != null:
return updateFavoriteState(_that.favorites);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getWishListLoading,required TResult Function( ApiErrorModel apiErrorModel)  getWishListError,required TResult Function( ProductResponse data)  getWishListSuccess,required TResult Function()  addOrRemoveProductFromWishListLoading,required TResult Function( ApiErrorModel apiErrorModel)  addOrRemoveProductFromWishListError,required TResult Function( ProductResponse data)  addOrRemoveProductFromWishListSuccess,required TResult Function( Map<String, bool> favorites)  updateFavoriteState,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetWishListLoading():
return getWishListLoading();case GetWishListError():
return getWishListError(_that.apiErrorModel);case GetWishListSuccess():
return getWishListSuccess(_that.data);case AddOrRemoveProductFromWishListLoading():
return addOrRemoveProductFromWishListLoading();case AddOrRemoveProductFromWishListError():
return addOrRemoveProductFromWishListError(_that.apiErrorModel);case AddOrRemoveProductFromWishListSuccess():
return addOrRemoveProductFromWishListSuccess(_that.data);case _UpdateFavoriteState():
return updateFavoriteState(_that.favorites);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getWishListLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getWishListError,TResult? Function( ProductResponse data)?  getWishListSuccess,TResult? Function()?  addOrRemoveProductFromWishListLoading,TResult? Function( ApiErrorModel apiErrorModel)?  addOrRemoveProductFromWishListError,TResult? Function( ProductResponse data)?  addOrRemoveProductFromWishListSuccess,TResult? Function( Map<String, bool> favorites)?  updateFavoriteState,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetWishListLoading() when getWishListLoading != null:
return getWishListLoading();case GetWishListError() when getWishListError != null:
return getWishListError(_that.apiErrorModel);case GetWishListSuccess() when getWishListSuccess != null:
return getWishListSuccess(_that.data);case AddOrRemoveProductFromWishListLoading() when addOrRemoveProductFromWishListLoading != null:
return addOrRemoveProductFromWishListLoading();case AddOrRemoveProductFromWishListError() when addOrRemoveProductFromWishListError != null:
return addOrRemoveProductFromWishListError(_that.apiErrorModel);case AddOrRemoveProductFromWishListSuccess() when addOrRemoveProductFromWishListSuccess != null:
return addOrRemoveProductFromWishListSuccess(_that.data);case _UpdateFavoriteState() when updateFavoriteState != null:
return updateFavoriteState(_that.favorites);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements WishListState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WishListState.initial()';
}


}




/// @nodoc


class GetWishListLoading implements WishListState {
  const GetWishListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWishListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WishListState.getWishListLoading()';
}


}




/// @nodoc


class GetWishListError implements WishListState {
  const GetWishListError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetWishListErrorCopyWith<GetWishListError> get copyWith => _$GetWishListErrorCopyWithImpl<GetWishListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWishListError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'WishListState.getWishListError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetWishListErrorCopyWith<$Res> implements $WishListStateCopyWith<$Res> {
  factory $GetWishListErrorCopyWith(GetWishListError value, $Res Function(GetWishListError) _then) = _$GetWishListErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetWishListErrorCopyWithImpl<$Res>
    implements $GetWishListErrorCopyWith<$Res> {
  _$GetWishListErrorCopyWithImpl(this._self, this._then);

  final GetWishListError _self;
  final $Res Function(GetWishListError) _then;

/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetWishListError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class GetWishListSuccess implements WishListState {
  const GetWishListSuccess(this.data);
  

 final  ProductResponse data;

/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetWishListSuccessCopyWith<GetWishListSuccess> get copyWith => _$GetWishListSuccessCopyWithImpl<GetWishListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWishListSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'WishListState.getWishListSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $GetWishListSuccessCopyWith<$Res> implements $WishListStateCopyWith<$Res> {
  factory $GetWishListSuccessCopyWith(GetWishListSuccess value, $Res Function(GetWishListSuccess) _then) = _$GetWishListSuccessCopyWithImpl;
@useResult
$Res call({
 ProductResponse data
});




}
/// @nodoc
class _$GetWishListSuccessCopyWithImpl<$Res>
    implements $GetWishListSuccessCopyWith<$Res> {
  _$GetWishListSuccessCopyWithImpl(this._self, this._then);

  final GetWishListSuccess _self;
  final $Res Function(GetWishListSuccess) _then;

/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(GetWishListSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductResponse,
  ));
}


}

/// @nodoc


class AddOrRemoveProductFromWishListLoading implements WishListState {
  const AddOrRemoveProductFromWishListLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOrRemoveProductFromWishListLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WishListState.addOrRemoveProductFromWishListLoading()';
}


}




/// @nodoc


class AddOrRemoveProductFromWishListError implements WishListState {
  const AddOrRemoveProductFromWishListError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddOrRemoveProductFromWishListErrorCopyWith<AddOrRemoveProductFromWishListError> get copyWith => _$AddOrRemoveProductFromWishListErrorCopyWithImpl<AddOrRemoveProductFromWishListError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOrRemoveProductFromWishListError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'WishListState.addOrRemoveProductFromWishListError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $AddOrRemoveProductFromWishListErrorCopyWith<$Res> implements $WishListStateCopyWith<$Res> {
  factory $AddOrRemoveProductFromWishListErrorCopyWith(AddOrRemoveProductFromWishListError value, $Res Function(AddOrRemoveProductFromWishListError) _then) = _$AddOrRemoveProductFromWishListErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$AddOrRemoveProductFromWishListErrorCopyWithImpl<$Res>
    implements $AddOrRemoveProductFromWishListErrorCopyWith<$Res> {
  _$AddOrRemoveProductFromWishListErrorCopyWithImpl(this._self, this._then);

  final AddOrRemoveProductFromWishListError _self;
  final $Res Function(AddOrRemoveProductFromWishListError) _then;

/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(AddOrRemoveProductFromWishListError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class AddOrRemoveProductFromWishListSuccess implements WishListState {
  const AddOrRemoveProductFromWishListSuccess(this.data);
  

 final  ProductResponse data;

/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddOrRemoveProductFromWishListSuccessCopyWith<AddOrRemoveProductFromWishListSuccess> get copyWith => _$AddOrRemoveProductFromWishListSuccessCopyWithImpl<AddOrRemoveProductFromWishListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddOrRemoveProductFromWishListSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'WishListState.addOrRemoveProductFromWishListSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $AddOrRemoveProductFromWishListSuccessCopyWith<$Res> implements $WishListStateCopyWith<$Res> {
  factory $AddOrRemoveProductFromWishListSuccessCopyWith(AddOrRemoveProductFromWishListSuccess value, $Res Function(AddOrRemoveProductFromWishListSuccess) _then) = _$AddOrRemoveProductFromWishListSuccessCopyWithImpl;
@useResult
$Res call({
 ProductResponse data
});




}
/// @nodoc
class _$AddOrRemoveProductFromWishListSuccessCopyWithImpl<$Res>
    implements $AddOrRemoveProductFromWishListSuccessCopyWith<$Res> {
  _$AddOrRemoveProductFromWishListSuccessCopyWithImpl(this._self, this._then);

  final AddOrRemoveProductFromWishListSuccess _self;
  final $Res Function(AddOrRemoveProductFromWishListSuccess) _then;

/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(AddOrRemoveProductFromWishListSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductResponse,
  ));
}


}

/// @nodoc


class _UpdateFavoriteState implements WishListState {
  const _UpdateFavoriteState(final  Map<String, bool> favorites): _favorites = favorites;
  

 final  Map<String, bool> _favorites;
 Map<String, bool> get favorites {
  if (_favorites is EqualUnmodifiableMapView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_favorites);
}


/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateFavoriteStateCopyWith<_UpdateFavoriteState> get copyWith => __$UpdateFavoriteStateCopyWithImpl<_UpdateFavoriteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateFavoriteState&&const DeepCollectionEquality().equals(other._favorites, _favorites));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_favorites));

@override
String toString() {
  return 'WishListState.updateFavoriteState(favorites: $favorites)';
}


}

/// @nodoc
abstract mixin class _$UpdateFavoriteStateCopyWith<$Res> implements $WishListStateCopyWith<$Res> {
  factory _$UpdateFavoriteStateCopyWith(_UpdateFavoriteState value, $Res Function(_UpdateFavoriteState) _then) = __$UpdateFavoriteStateCopyWithImpl;
@useResult
$Res call({
 Map<String, bool> favorites
});




}
/// @nodoc
class __$UpdateFavoriteStateCopyWithImpl<$Res>
    implements _$UpdateFavoriteStateCopyWith<$Res> {
  __$UpdateFavoriteStateCopyWithImpl(this._self, this._then);

  final _UpdateFavoriteState _self;
  final $Res Function(_UpdateFavoriteState) _then;

/// Create a copy of WishListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? favorites = null,}) {
  return _then(_UpdateFavoriteState(
null == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as Map<String, bool>,
  ));
}


}

// dart format on
