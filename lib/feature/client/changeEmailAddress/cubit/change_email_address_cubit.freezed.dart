// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_email_address_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangeEmailAddressState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeEmailAddressState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangeEmailAddressState()';
}


}

/// @nodoc
class $ChangeEmailAddressStateCopyWith<$Res>  {
$ChangeEmailAddressStateCopyWith(ChangeEmailAddressState _, $Res Function(ChangeEmailAddressState) __);
}


/// Adds pattern-matching-related methods to [ChangeEmailAddressState].
extension ChangeEmailAddressStatePatterns on ChangeEmailAddressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ChangeEmailAddressLoading value)?  changeEmailAddressLoading,TResult Function( ChangeEmailAddressError value)?  changeEmailAddressError,TResult Function( ChangeEmailAddressSuccess value)?  changeEmailAddressSuccess,TResult Function( ChangePasswordVisibilityState value)?  changePasswordVisibilityState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ChangeEmailAddressLoading() when changeEmailAddressLoading != null:
return changeEmailAddressLoading(_that);case ChangeEmailAddressError() when changeEmailAddressError != null:
return changeEmailAddressError(_that);case ChangeEmailAddressSuccess() when changeEmailAddressSuccess != null:
return changeEmailAddressSuccess(_that);case ChangePasswordVisibilityState() when changePasswordVisibilityState != null:
return changePasswordVisibilityState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ChangeEmailAddressLoading value)  changeEmailAddressLoading,required TResult Function( ChangeEmailAddressError value)  changeEmailAddressError,required TResult Function( ChangeEmailAddressSuccess value)  changeEmailAddressSuccess,required TResult Function( ChangePasswordVisibilityState value)  changePasswordVisibilityState,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ChangeEmailAddressLoading():
return changeEmailAddressLoading(_that);case ChangeEmailAddressError():
return changeEmailAddressError(_that);case ChangeEmailAddressSuccess():
return changeEmailAddressSuccess(_that);case ChangePasswordVisibilityState():
return changePasswordVisibilityState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ChangeEmailAddressLoading value)?  changeEmailAddressLoading,TResult? Function( ChangeEmailAddressError value)?  changeEmailAddressError,TResult? Function( ChangeEmailAddressSuccess value)?  changeEmailAddressSuccess,TResult? Function( ChangePasswordVisibilityState value)?  changePasswordVisibilityState,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ChangeEmailAddressLoading() when changeEmailAddressLoading != null:
return changeEmailAddressLoading(_that);case ChangeEmailAddressError() when changeEmailAddressError != null:
return changeEmailAddressError(_that);case ChangeEmailAddressSuccess() when changeEmailAddressSuccess != null:
return changeEmailAddressSuccess(_that);case ChangePasswordVisibilityState() when changePasswordVisibilityState != null:
return changePasswordVisibilityState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  changeEmailAddressLoading,TResult Function( ApiErrorModel apiErrorModel)?  changeEmailAddressError,TResult Function( UpdateEmailAddressResponse data)?  changeEmailAddressSuccess,TResult Function( bool isPasswordVisible)?  changePasswordVisibilityState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ChangeEmailAddressLoading() when changeEmailAddressLoading != null:
return changeEmailAddressLoading();case ChangeEmailAddressError() when changeEmailAddressError != null:
return changeEmailAddressError(_that.apiErrorModel);case ChangeEmailAddressSuccess() when changeEmailAddressSuccess != null:
return changeEmailAddressSuccess(_that.data);case ChangePasswordVisibilityState() when changePasswordVisibilityState != null:
return changePasswordVisibilityState(_that.isPasswordVisible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  changeEmailAddressLoading,required TResult Function( ApiErrorModel apiErrorModel)  changeEmailAddressError,required TResult Function( UpdateEmailAddressResponse data)  changeEmailAddressSuccess,required TResult Function( bool isPasswordVisible)  changePasswordVisibilityState,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ChangeEmailAddressLoading():
return changeEmailAddressLoading();case ChangeEmailAddressError():
return changeEmailAddressError(_that.apiErrorModel);case ChangeEmailAddressSuccess():
return changeEmailAddressSuccess(_that.data);case ChangePasswordVisibilityState():
return changePasswordVisibilityState(_that.isPasswordVisible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  changeEmailAddressLoading,TResult? Function( ApiErrorModel apiErrorModel)?  changeEmailAddressError,TResult? Function( UpdateEmailAddressResponse data)?  changeEmailAddressSuccess,TResult? Function( bool isPasswordVisible)?  changePasswordVisibilityState,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ChangeEmailAddressLoading() when changeEmailAddressLoading != null:
return changeEmailAddressLoading();case ChangeEmailAddressError() when changeEmailAddressError != null:
return changeEmailAddressError(_that.apiErrorModel);case ChangeEmailAddressSuccess() when changeEmailAddressSuccess != null:
return changeEmailAddressSuccess(_that.data);case ChangePasswordVisibilityState() when changePasswordVisibilityState != null:
return changePasswordVisibilityState(_that.isPasswordVisible);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ChangeEmailAddressState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangeEmailAddressState.initial()';
}


}




/// @nodoc


class ChangeEmailAddressLoading implements ChangeEmailAddressState {
  const ChangeEmailAddressLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeEmailAddressLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangeEmailAddressState.changeEmailAddressLoading()';
}


}




/// @nodoc


class ChangeEmailAddressError implements ChangeEmailAddressState {
  const ChangeEmailAddressError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of ChangeEmailAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeEmailAddressErrorCopyWith<ChangeEmailAddressError> get copyWith => _$ChangeEmailAddressErrorCopyWithImpl<ChangeEmailAddressError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeEmailAddressError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'ChangeEmailAddressState.changeEmailAddressError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $ChangeEmailAddressErrorCopyWith<$Res> implements $ChangeEmailAddressStateCopyWith<$Res> {
  factory $ChangeEmailAddressErrorCopyWith(ChangeEmailAddressError value, $Res Function(ChangeEmailAddressError) _then) = _$ChangeEmailAddressErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$ChangeEmailAddressErrorCopyWithImpl<$Res>
    implements $ChangeEmailAddressErrorCopyWith<$Res> {
  _$ChangeEmailAddressErrorCopyWithImpl(this._self, this._then);

  final ChangeEmailAddressError _self;
  final $Res Function(ChangeEmailAddressError) _then;

/// Create a copy of ChangeEmailAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(ChangeEmailAddressError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class ChangeEmailAddressSuccess implements ChangeEmailAddressState {
  const ChangeEmailAddressSuccess(this.data);
  

 final  UpdateEmailAddressResponse data;

/// Create a copy of ChangeEmailAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeEmailAddressSuccessCopyWith<ChangeEmailAddressSuccess> get copyWith => _$ChangeEmailAddressSuccessCopyWithImpl<ChangeEmailAddressSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeEmailAddressSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ChangeEmailAddressState.changeEmailAddressSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $ChangeEmailAddressSuccessCopyWith<$Res> implements $ChangeEmailAddressStateCopyWith<$Res> {
  factory $ChangeEmailAddressSuccessCopyWith(ChangeEmailAddressSuccess value, $Res Function(ChangeEmailAddressSuccess) _then) = _$ChangeEmailAddressSuccessCopyWithImpl;
@useResult
$Res call({
 UpdateEmailAddressResponse data
});




}
/// @nodoc
class _$ChangeEmailAddressSuccessCopyWithImpl<$Res>
    implements $ChangeEmailAddressSuccessCopyWith<$Res> {
  _$ChangeEmailAddressSuccessCopyWithImpl(this._self, this._then);

  final ChangeEmailAddressSuccess _self;
  final $Res Function(ChangeEmailAddressSuccess) _then;

/// Create a copy of ChangeEmailAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ChangeEmailAddressSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UpdateEmailAddressResponse,
  ));
}


}

/// @nodoc


class ChangePasswordVisibilityState implements ChangeEmailAddressState {
  const ChangePasswordVisibilityState(this.isPasswordVisible);
  

 final  bool isPasswordVisible;

/// Create a copy of ChangeEmailAddressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordVisibilityStateCopyWith<ChangePasswordVisibilityState> get copyWith => _$ChangePasswordVisibilityStateCopyWithImpl<ChangePasswordVisibilityState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordVisibilityState&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible));
}


@override
int get hashCode => Object.hash(runtimeType,isPasswordVisible);

@override
String toString() {
  return 'ChangeEmailAddressState.changePasswordVisibilityState(isPasswordVisible: $isPasswordVisible)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordVisibilityStateCopyWith<$Res> implements $ChangeEmailAddressStateCopyWith<$Res> {
  factory $ChangePasswordVisibilityStateCopyWith(ChangePasswordVisibilityState value, $Res Function(ChangePasswordVisibilityState) _then) = _$ChangePasswordVisibilityStateCopyWithImpl;
@useResult
$Res call({
 bool isPasswordVisible
});




}
/// @nodoc
class _$ChangePasswordVisibilityStateCopyWithImpl<$Res>
    implements $ChangePasswordVisibilityStateCopyWith<$Res> {
  _$ChangePasswordVisibilityStateCopyWithImpl(this._self, this._then);

  final ChangePasswordVisibilityState _self;
  final $Res Function(ChangePasswordVisibilityState) _then;

/// Create a copy of ChangeEmailAddressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPasswordVisible = null,}) {
  return _then(ChangePasswordVisibilityState(
null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
