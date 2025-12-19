// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coupons_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CouponsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CouponsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponsState()';
}


}

/// @nodoc
class $CouponsStateCopyWith<$Res>  {
$CouponsStateCopyWith(CouponsState _, $Res Function(CouponsState) __);
}


/// Adds pattern-matching-related methods to [CouponsState].
extension CouponsStatePatterns on CouponsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetAllCouponsSuccess value)?  getAllCouponsSuccess,TResult Function( GetAllCouponsLoading value)?  getAllCouponsLoading,TResult Function( GetAllCouponsError value)?  getAllCouponsError,TResult Function( ActionLoading value)?  actionLoading,TResult Function( ActionSuccess value)?  actionSuccess,TResult Function( ActionError value)?  actionError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetAllCouponsSuccess() when getAllCouponsSuccess != null:
return getAllCouponsSuccess(_that);case GetAllCouponsLoading() when getAllCouponsLoading != null:
return getAllCouponsLoading(_that);case GetAllCouponsError() when getAllCouponsError != null:
return getAllCouponsError(_that);case ActionLoading() when actionLoading != null:
return actionLoading(_that);case ActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case ActionError() when actionError != null:
return actionError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetAllCouponsSuccess value)  getAllCouponsSuccess,required TResult Function( GetAllCouponsLoading value)  getAllCouponsLoading,required TResult Function( GetAllCouponsError value)  getAllCouponsError,required TResult Function( ActionLoading value)  actionLoading,required TResult Function( ActionSuccess value)  actionSuccess,required TResult Function( ActionError value)  actionError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetAllCouponsSuccess():
return getAllCouponsSuccess(_that);case GetAllCouponsLoading():
return getAllCouponsLoading(_that);case GetAllCouponsError():
return getAllCouponsError(_that);case ActionLoading():
return actionLoading(_that);case ActionSuccess():
return actionSuccess(_that);case ActionError():
return actionError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetAllCouponsSuccess value)?  getAllCouponsSuccess,TResult? Function( GetAllCouponsLoading value)?  getAllCouponsLoading,TResult? Function( GetAllCouponsError value)?  getAllCouponsError,TResult? Function( ActionLoading value)?  actionLoading,TResult? Function( ActionSuccess value)?  actionSuccess,TResult? Function( ActionError value)?  actionError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetAllCouponsSuccess() when getAllCouponsSuccess != null:
return getAllCouponsSuccess(_that);case GetAllCouponsLoading() when getAllCouponsLoading != null:
return getAllCouponsLoading(_that);case GetAllCouponsError() when getAllCouponsError != null:
return getAllCouponsError(_that);case ActionLoading() when actionLoading != null:
return actionLoading(_that);case ActionSuccess() when actionSuccess != null:
return actionSuccess(_that);case ActionError() when actionError != null:
return actionError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( CouponsResponse data)?  getAllCouponsSuccess,TResult Function()?  getAllCouponsLoading,TResult Function( ApiErrorModel apiErrorModel)?  getAllCouponsError,TResult Function()?  actionLoading,TResult Function()?  actionSuccess,TResult Function( ApiErrorModel apiErrorModel)?  actionError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetAllCouponsSuccess() when getAllCouponsSuccess != null:
return getAllCouponsSuccess(_that.data);case GetAllCouponsLoading() when getAllCouponsLoading != null:
return getAllCouponsLoading();case GetAllCouponsError() when getAllCouponsError != null:
return getAllCouponsError(_that.apiErrorModel);case ActionLoading() when actionLoading != null:
return actionLoading();case ActionSuccess() when actionSuccess != null:
return actionSuccess();case ActionError() when actionError != null:
return actionError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( CouponsResponse data)  getAllCouponsSuccess,required TResult Function()  getAllCouponsLoading,required TResult Function( ApiErrorModel apiErrorModel)  getAllCouponsError,required TResult Function()  actionLoading,required TResult Function()  actionSuccess,required TResult Function( ApiErrorModel apiErrorModel)  actionError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetAllCouponsSuccess():
return getAllCouponsSuccess(_that.data);case GetAllCouponsLoading():
return getAllCouponsLoading();case GetAllCouponsError():
return getAllCouponsError(_that.apiErrorModel);case ActionLoading():
return actionLoading();case ActionSuccess():
return actionSuccess();case ActionError():
return actionError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( CouponsResponse data)?  getAllCouponsSuccess,TResult? Function()?  getAllCouponsLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getAllCouponsError,TResult? Function()?  actionLoading,TResult? Function()?  actionSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  actionError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetAllCouponsSuccess() when getAllCouponsSuccess != null:
return getAllCouponsSuccess(_that.data);case GetAllCouponsLoading() when getAllCouponsLoading != null:
return getAllCouponsLoading();case GetAllCouponsError() when getAllCouponsError != null:
return getAllCouponsError(_that.apiErrorModel);case ActionLoading() when actionLoading != null:
return actionLoading();case ActionSuccess() when actionSuccess != null:
return actionSuccess();case ActionError() when actionError != null:
return actionError(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CouponsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponsState.initial()';
}


}




/// @nodoc


class GetAllCouponsSuccess implements CouponsState {
  const GetAllCouponsSuccess(this.data);
  

 final  CouponsResponse data;

/// Create a copy of CouponsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllCouponsSuccessCopyWith<GetAllCouponsSuccess> get copyWith => _$GetAllCouponsSuccessCopyWithImpl<GetAllCouponsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllCouponsSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'CouponsState.getAllCouponsSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $GetAllCouponsSuccessCopyWith<$Res> implements $CouponsStateCopyWith<$Res> {
  factory $GetAllCouponsSuccessCopyWith(GetAllCouponsSuccess value, $Res Function(GetAllCouponsSuccess) _then) = _$GetAllCouponsSuccessCopyWithImpl;
@useResult
$Res call({
 CouponsResponse data
});




}
/// @nodoc
class _$GetAllCouponsSuccessCopyWithImpl<$Res>
    implements $GetAllCouponsSuccessCopyWith<$Res> {
  _$GetAllCouponsSuccessCopyWithImpl(this._self, this._then);

  final GetAllCouponsSuccess _self;
  final $Res Function(GetAllCouponsSuccess) _then;

/// Create a copy of CouponsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(GetAllCouponsSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CouponsResponse,
  ));
}


}

/// @nodoc


class GetAllCouponsLoading implements CouponsState {
  const GetAllCouponsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllCouponsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponsState.getAllCouponsLoading()';
}


}




/// @nodoc


class GetAllCouponsError implements CouponsState {
  const GetAllCouponsError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of CouponsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllCouponsErrorCopyWith<GetAllCouponsError> get copyWith => _$GetAllCouponsErrorCopyWithImpl<GetAllCouponsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllCouponsError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'CouponsState.getAllCouponsError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetAllCouponsErrorCopyWith<$Res> implements $CouponsStateCopyWith<$Res> {
  factory $GetAllCouponsErrorCopyWith(GetAllCouponsError value, $Res Function(GetAllCouponsError) _then) = _$GetAllCouponsErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetAllCouponsErrorCopyWithImpl<$Res>
    implements $GetAllCouponsErrorCopyWith<$Res> {
  _$GetAllCouponsErrorCopyWithImpl(this._self, this._then);

  final GetAllCouponsError _self;
  final $Res Function(GetAllCouponsError) _then;

/// Create a copy of CouponsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetAllCouponsError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class ActionLoading implements CouponsState {
  const ActionLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponsState.actionLoading()';
}


}




/// @nodoc


class ActionSuccess implements CouponsState {
  const ActionSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CouponsState.actionSuccess()';
}


}




/// @nodoc


class ActionError implements CouponsState {
  const ActionError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of CouponsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionErrorCopyWith<ActionError> get copyWith => _$ActionErrorCopyWithImpl<ActionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'CouponsState.actionError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $ActionErrorCopyWith<$Res> implements $CouponsStateCopyWith<$Res> {
  factory $ActionErrorCopyWith(ActionError value, $Res Function(ActionError) _then) = _$ActionErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$ActionErrorCopyWithImpl<$Res>
    implements $ActionErrorCopyWith<$Res> {
  _$ActionErrorCopyWithImpl(this._self, this._then);

  final ActionError _self;
  final $Res Function(ActionError) _then;

/// Create a copy of CouponsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(ActionError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
