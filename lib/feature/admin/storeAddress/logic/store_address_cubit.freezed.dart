// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_address_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StoreAddressState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreAddressState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreAddressState()';
}


}

/// @nodoc
class $StoreAddressStateCopyWith<$Res>  {
$StoreAddressStateCopyWith(StoreAddressState _, $Res Function(StoreAddressState) __);
}


/// Adds pattern-matching-related methods to [StoreAddressState].
extension StoreAddressStatePatterns on StoreAddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetStoreAddressLoading value)?  getStoreAddressLoading,TResult Function( GetStoreAddressError value)?  getStoreAddressError,TResult Function( GetStoreAddressSuccess value)?  getStoreAddressSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetStoreAddressLoading() when getStoreAddressLoading != null:
return getStoreAddressLoading(_that);case GetStoreAddressError() when getStoreAddressError != null:
return getStoreAddressError(_that);case GetStoreAddressSuccess() when getStoreAddressSuccess != null:
return getStoreAddressSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetStoreAddressLoading value)  getStoreAddressLoading,required TResult Function( GetStoreAddressError value)  getStoreAddressError,required TResult Function( GetStoreAddressSuccess value)  getStoreAddressSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetStoreAddressLoading():
return getStoreAddressLoading(_that);case GetStoreAddressError():
return getStoreAddressError(_that);case GetStoreAddressSuccess():
return getStoreAddressSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetStoreAddressLoading value)?  getStoreAddressLoading,TResult? Function( GetStoreAddressError value)?  getStoreAddressError,TResult? Function( GetStoreAddressSuccess value)?  getStoreAddressSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetStoreAddressLoading() when getStoreAddressLoading != null:
return getStoreAddressLoading(_that);case GetStoreAddressError() when getStoreAddressError != null:
return getStoreAddressError(_that);case GetStoreAddressSuccess() when getStoreAddressSuccess != null:
return getStoreAddressSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getStoreAddressLoading,TResult Function( ApiErrorModel apiErrorModel)?  getStoreAddressError,TResult Function( BranchStoreAddressResponse data)?  getStoreAddressSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetStoreAddressLoading() when getStoreAddressLoading != null:
return getStoreAddressLoading();case GetStoreAddressError() when getStoreAddressError != null:
return getStoreAddressError(_that.apiErrorModel);case GetStoreAddressSuccess() when getStoreAddressSuccess != null:
return getStoreAddressSuccess(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getStoreAddressLoading,required TResult Function( ApiErrorModel apiErrorModel)  getStoreAddressError,required TResult Function( BranchStoreAddressResponse data)  getStoreAddressSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetStoreAddressLoading():
return getStoreAddressLoading();case GetStoreAddressError():
return getStoreAddressError(_that.apiErrorModel);case GetStoreAddressSuccess():
return getStoreAddressSuccess(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getStoreAddressLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getStoreAddressError,TResult? Function( BranchStoreAddressResponse data)?  getStoreAddressSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetStoreAddressLoading() when getStoreAddressLoading != null:
return getStoreAddressLoading();case GetStoreAddressError() when getStoreAddressError != null:
return getStoreAddressError(_that.apiErrorModel);case GetStoreAddressSuccess() when getStoreAddressSuccess != null:
return getStoreAddressSuccess(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements StoreAddressState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreAddressState.initial()';
}


}




/// @nodoc


class GetStoreAddressLoading implements StoreAddressState {
  const GetStoreAddressLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoreAddressLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StoreAddressState.getStoreAddressLoading()';
}


}




/// @nodoc


class GetStoreAddressError implements StoreAddressState {
  const GetStoreAddressError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of StoreAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetStoreAddressErrorCopyWith<GetStoreAddressError> get copyWith => _$GetStoreAddressErrorCopyWithImpl<GetStoreAddressError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoreAddressError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'StoreAddressState.getStoreAddressError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetStoreAddressErrorCopyWith<$Res> implements $StoreAddressStateCopyWith<$Res> {
  factory $GetStoreAddressErrorCopyWith(GetStoreAddressError value, $Res Function(GetStoreAddressError) _then) = _$GetStoreAddressErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetStoreAddressErrorCopyWithImpl<$Res>
    implements $GetStoreAddressErrorCopyWith<$Res> {
  _$GetStoreAddressErrorCopyWithImpl(this._self, this._then);

  final GetStoreAddressError _self;
  final $Res Function(GetStoreAddressError) _then;

/// Create a copy of StoreAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetStoreAddressError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class GetStoreAddressSuccess implements StoreAddressState {
  const GetStoreAddressSuccess(this.data);
  

 final  BranchStoreAddressResponse data;

/// Create a copy of StoreAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetStoreAddressSuccessCopyWith<GetStoreAddressSuccess> get copyWith => _$GetStoreAddressSuccessCopyWithImpl<GetStoreAddressSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStoreAddressSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'StoreAddressState.getStoreAddressSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $GetStoreAddressSuccessCopyWith<$Res> implements $StoreAddressStateCopyWith<$Res> {
  factory $GetStoreAddressSuccessCopyWith(GetStoreAddressSuccess value, $Res Function(GetStoreAddressSuccess) _then) = _$GetStoreAddressSuccessCopyWithImpl;
@useResult
$Res call({
 BranchStoreAddressResponse data
});




}
/// @nodoc
class _$GetStoreAddressSuccessCopyWithImpl<$Res>
    implements $GetStoreAddressSuccessCopyWith<$Res> {
  _$GetStoreAddressSuccessCopyWithImpl(this._self, this._then);

  final GetStoreAddressSuccess _self;
  final $Res Function(GetStoreAddressSuccess) _then;

/// Create a copy of StoreAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(GetStoreAddressSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BranchStoreAddressResponse,
  ));
}


}

// dart format on
