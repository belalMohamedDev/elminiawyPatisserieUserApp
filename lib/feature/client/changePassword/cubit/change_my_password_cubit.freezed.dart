// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_my_password_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangeMyPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeMyPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangeMyPasswordState()';
}


}

/// @nodoc
class $ChangeMyPasswordStateCopyWith<$Res>  {
$ChangeMyPasswordStateCopyWith(ChangeMyPasswordState _, $Res Function(ChangeMyPasswordState) __);
}


/// Adds pattern-matching-related methods to [ChangeMyPasswordState].
extension ChangeMyPasswordStatePatterns on ChangeMyPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ChangeMyPasswordLoading value)?  changeMyPasswordLoading,TResult Function( ChangeMyPasswordError value)?  changeMyPasswordError,TResult Function( ChangeMyPasswordSuccess value)?  changeMyPasswordSuccess,TResult Function( ChangeMyPasswordTextColorUpdated value)?  changeMyPasswordTextColorUpdated,TResult Function( ChangePasswordVisibilitylookState value)?  changePasswordVisibilityState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ChangeMyPasswordLoading() when changeMyPasswordLoading != null:
return changeMyPasswordLoading(_that);case ChangeMyPasswordError() when changeMyPasswordError != null:
return changeMyPasswordError(_that);case ChangeMyPasswordSuccess() when changeMyPasswordSuccess != null:
return changeMyPasswordSuccess(_that);case ChangeMyPasswordTextColorUpdated() when changeMyPasswordTextColorUpdated != null:
return changeMyPasswordTextColorUpdated(_that);case ChangePasswordVisibilitylookState() when changePasswordVisibilityState != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ChangeMyPasswordLoading value)  changeMyPasswordLoading,required TResult Function( ChangeMyPasswordError value)  changeMyPasswordError,required TResult Function( ChangeMyPasswordSuccess value)  changeMyPasswordSuccess,required TResult Function( ChangeMyPasswordTextColorUpdated value)  changeMyPasswordTextColorUpdated,required TResult Function( ChangePasswordVisibilitylookState value)  changePasswordVisibilityState,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ChangeMyPasswordLoading():
return changeMyPasswordLoading(_that);case ChangeMyPasswordError():
return changeMyPasswordError(_that);case ChangeMyPasswordSuccess():
return changeMyPasswordSuccess(_that);case ChangeMyPasswordTextColorUpdated():
return changeMyPasswordTextColorUpdated(_that);case ChangePasswordVisibilitylookState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ChangeMyPasswordLoading value)?  changeMyPasswordLoading,TResult? Function( ChangeMyPasswordError value)?  changeMyPasswordError,TResult? Function( ChangeMyPasswordSuccess value)?  changeMyPasswordSuccess,TResult? Function( ChangeMyPasswordTextColorUpdated value)?  changeMyPasswordTextColorUpdated,TResult? Function( ChangePasswordVisibilitylookState value)?  changePasswordVisibilityState,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ChangeMyPasswordLoading() when changeMyPasswordLoading != null:
return changeMyPasswordLoading(_that);case ChangeMyPasswordError() when changeMyPasswordError != null:
return changeMyPasswordError(_that);case ChangeMyPasswordSuccess() when changeMyPasswordSuccess != null:
return changeMyPasswordSuccess(_that);case ChangeMyPasswordTextColorUpdated() when changeMyPasswordTextColorUpdated != null:
return changeMyPasswordTextColorUpdated(_that);case ChangePasswordVisibilitylookState() when changePasswordVisibilityState != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  changeMyPasswordLoading,TResult Function( ApiErrorModel apiErrorModel)?  changeMyPasswordError,TResult Function( AuthResponse data)?  changeMyPasswordSuccess,TResult Function( Color lengthTextColor,  Color upperCaseTextColor,  Color lowerCaseTextColor,  Color numberTextColor,  Color specialCharTextColor)?  changeMyPasswordTextColorUpdated,TResult Function( bool isPasswordVisible)?  changePasswordVisibilityState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ChangeMyPasswordLoading() when changeMyPasswordLoading != null:
return changeMyPasswordLoading();case ChangeMyPasswordError() when changeMyPasswordError != null:
return changeMyPasswordError(_that.apiErrorModel);case ChangeMyPasswordSuccess() when changeMyPasswordSuccess != null:
return changeMyPasswordSuccess(_that.data);case ChangeMyPasswordTextColorUpdated() when changeMyPasswordTextColorUpdated != null:
return changeMyPasswordTextColorUpdated(_that.lengthTextColor,_that.upperCaseTextColor,_that.lowerCaseTextColor,_that.numberTextColor,_that.specialCharTextColor);case ChangePasswordVisibilitylookState() when changePasswordVisibilityState != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  changeMyPasswordLoading,required TResult Function( ApiErrorModel apiErrorModel)  changeMyPasswordError,required TResult Function( AuthResponse data)  changeMyPasswordSuccess,required TResult Function( Color lengthTextColor,  Color upperCaseTextColor,  Color lowerCaseTextColor,  Color numberTextColor,  Color specialCharTextColor)  changeMyPasswordTextColorUpdated,required TResult Function( bool isPasswordVisible)  changePasswordVisibilityState,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ChangeMyPasswordLoading():
return changeMyPasswordLoading();case ChangeMyPasswordError():
return changeMyPasswordError(_that.apiErrorModel);case ChangeMyPasswordSuccess():
return changeMyPasswordSuccess(_that.data);case ChangeMyPasswordTextColorUpdated():
return changeMyPasswordTextColorUpdated(_that.lengthTextColor,_that.upperCaseTextColor,_that.lowerCaseTextColor,_that.numberTextColor,_that.specialCharTextColor);case ChangePasswordVisibilitylookState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  changeMyPasswordLoading,TResult? Function( ApiErrorModel apiErrorModel)?  changeMyPasswordError,TResult? Function( AuthResponse data)?  changeMyPasswordSuccess,TResult? Function( Color lengthTextColor,  Color upperCaseTextColor,  Color lowerCaseTextColor,  Color numberTextColor,  Color specialCharTextColor)?  changeMyPasswordTextColorUpdated,TResult? Function( bool isPasswordVisible)?  changePasswordVisibilityState,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ChangeMyPasswordLoading() when changeMyPasswordLoading != null:
return changeMyPasswordLoading();case ChangeMyPasswordError() when changeMyPasswordError != null:
return changeMyPasswordError(_that.apiErrorModel);case ChangeMyPasswordSuccess() when changeMyPasswordSuccess != null:
return changeMyPasswordSuccess(_that.data);case ChangeMyPasswordTextColorUpdated() when changeMyPasswordTextColorUpdated != null:
return changeMyPasswordTextColorUpdated(_that.lengthTextColor,_that.upperCaseTextColor,_that.lowerCaseTextColor,_that.numberTextColor,_that.specialCharTextColor);case ChangePasswordVisibilitylookState() when changePasswordVisibilityState != null:
return changePasswordVisibilityState(_that.isPasswordVisible);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ChangeMyPasswordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangeMyPasswordState.initial()';
}


}




/// @nodoc


class ChangeMyPasswordLoading implements ChangeMyPasswordState {
  const ChangeMyPasswordLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeMyPasswordLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChangeMyPasswordState.changeMyPasswordLoading()';
}


}




/// @nodoc


class ChangeMyPasswordError implements ChangeMyPasswordState {
  const ChangeMyPasswordError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of ChangeMyPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeMyPasswordErrorCopyWith<ChangeMyPasswordError> get copyWith => _$ChangeMyPasswordErrorCopyWithImpl<ChangeMyPasswordError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeMyPasswordError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'ChangeMyPasswordState.changeMyPasswordError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $ChangeMyPasswordErrorCopyWith<$Res> implements $ChangeMyPasswordStateCopyWith<$Res> {
  factory $ChangeMyPasswordErrorCopyWith(ChangeMyPasswordError value, $Res Function(ChangeMyPasswordError) _then) = _$ChangeMyPasswordErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$ChangeMyPasswordErrorCopyWithImpl<$Res>
    implements $ChangeMyPasswordErrorCopyWith<$Res> {
  _$ChangeMyPasswordErrorCopyWithImpl(this._self, this._then);

  final ChangeMyPasswordError _self;
  final $Res Function(ChangeMyPasswordError) _then;

/// Create a copy of ChangeMyPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(ChangeMyPasswordError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class ChangeMyPasswordSuccess implements ChangeMyPasswordState {
  const ChangeMyPasswordSuccess(this.data);
  

 final  AuthResponse data;

/// Create a copy of ChangeMyPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeMyPasswordSuccessCopyWith<ChangeMyPasswordSuccess> get copyWith => _$ChangeMyPasswordSuccessCopyWithImpl<ChangeMyPasswordSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeMyPasswordSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ChangeMyPasswordState.changeMyPasswordSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $ChangeMyPasswordSuccessCopyWith<$Res> implements $ChangeMyPasswordStateCopyWith<$Res> {
  factory $ChangeMyPasswordSuccessCopyWith(ChangeMyPasswordSuccess value, $Res Function(ChangeMyPasswordSuccess) _then) = _$ChangeMyPasswordSuccessCopyWithImpl;
@useResult
$Res call({
 AuthResponse data
});




}
/// @nodoc
class _$ChangeMyPasswordSuccessCopyWithImpl<$Res>
    implements $ChangeMyPasswordSuccessCopyWith<$Res> {
  _$ChangeMyPasswordSuccessCopyWithImpl(this._self, this._then);

  final ChangeMyPasswordSuccess _self;
  final $Res Function(ChangeMyPasswordSuccess) _then;

/// Create a copy of ChangeMyPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ChangeMyPasswordSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthResponse,
  ));
}


}

/// @nodoc


class ChangeMyPasswordTextColorUpdated implements ChangeMyPasswordState {
  const ChangeMyPasswordTextColorUpdated(this.lengthTextColor, this.upperCaseTextColor, this.lowerCaseTextColor, this.numberTextColor, this.specialCharTextColor);
  

 final  Color lengthTextColor;
 final  Color upperCaseTextColor;
 final  Color lowerCaseTextColor;
 final  Color numberTextColor;
 final  Color specialCharTextColor;

/// Create a copy of ChangeMyPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeMyPasswordTextColorUpdatedCopyWith<ChangeMyPasswordTextColorUpdated> get copyWith => _$ChangeMyPasswordTextColorUpdatedCopyWithImpl<ChangeMyPasswordTextColorUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeMyPasswordTextColorUpdated&&(identical(other.lengthTextColor, lengthTextColor) || other.lengthTextColor == lengthTextColor)&&(identical(other.upperCaseTextColor, upperCaseTextColor) || other.upperCaseTextColor == upperCaseTextColor)&&(identical(other.lowerCaseTextColor, lowerCaseTextColor) || other.lowerCaseTextColor == lowerCaseTextColor)&&(identical(other.numberTextColor, numberTextColor) || other.numberTextColor == numberTextColor)&&(identical(other.specialCharTextColor, specialCharTextColor) || other.specialCharTextColor == specialCharTextColor));
}


@override
int get hashCode => Object.hash(runtimeType,lengthTextColor,upperCaseTextColor,lowerCaseTextColor,numberTextColor,specialCharTextColor);

@override
String toString() {
  return 'ChangeMyPasswordState.changeMyPasswordTextColorUpdated(lengthTextColor: $lengthTextColor, upperCaseTextColor: $upperCaseTextColor, lowerCaseTextColor: $lowerCaseTextColor, numberTextColor: $numberTextColor, specialCharTextColor: $specialCharTextColor)';
}


}

/// @nodoc
abstract mixin class $ChangeMyPasswordTextColorUpdatedCopyWith<$Res> implements $ChangeMyPasswordStateCopyWith<$Res> {
  factory $ChangeMyPasswordTextColorUpdatedCopyWith(ChangeMyPasswordTextColorUpdated value, $Res Function(ChangeMyPasswordTextColorUpdated) _then) = _$ChangeMyPasswordTextColorUpdatedCopyWithImpl;
@useResult
$Res call({
 Color lengthTextColor, Color upperCaseTextColor, Color lowerCaseTextColor, Color numberTextColor, Color specialCharTextColor
});




}
/// @nodoc
class _$ChangeMyPasswordTextColorUpdatedCopyWithImpl<$Res>
    implements $ChangeMyPasswordTextColorUpdatedCopyWith<$Res> {
  _$ChangeMyPasswordTextColorUpdatedCopyWithImpl(this._self, this._then);

  final ChangeMyPasswordTextColorUpdated _self;
  final $Res Function(ChangeMyPasswordTextColorUpdated) _then;

/// Create a copy of ChangeMyPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lengthTextColor = null,Object? upperCaseTextColor = null,Object? lowerCaseTextColor = null,Object? numberTextColor = null,Object? specialCharTextColor = null,}) {
  return _then(ChangeMyPasswordTextColorUpdated(
null == lengthTextColor ? _self.lengthTextColor : lengthTextColor // ignore: cast_nullable_to_non_nullable
as Color,null == upperCaseTextColor ? _self.upperCaseTextColor : upperCaseTextColor // ignore: cast_nullable_to_non_nullable
as Color,null == lowerCaseTextColor ? _self.lowerCaseTextColor : lowerCaseTextColor // ignore: cast_nullable_to_non_nullable
as Color,null == numberTextColor ? _self.numberTextColor : numberTextColor // ignore: cast_nullable_to_non_nullable
as Color,null == specialCharTextColor ? _self.specialCharTextColor : specialCharTextColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

/// @nodoc


class ChangePasswordVisibilitylookState implements ChangeMyPasswordState {
  const ChangePasswordVisibilitylookState(this.isPasswordVisible);
  

 final  bool isPasswordVisible;

/// Create a copy of ChangeMyPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangePasswordVisibilitylookStateCopyWith<ChangePasswordVisibilitylookState> get copyWith => _$ChangePasswordVisibilitylookStateCopyWithImpl<ChangePasswordVisibilitylookState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangePasswordVisibilitylookState&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible));
}


@override
int get hashCode => Object.hash(runtimeType,isPasswordVisible);

@override
String toString() {
  return 'ChangeMyPasswordState.changePasswordVisibilityState(isPasswordVisible: $isPasswordVisible)';
}


}

/// @nodoc
abstract mixin class $ChangePasswordVisibilitylookStateCopyWith<$Res> implements $ChangeMyPasswordStateCopyWith<$Res> {
  factory $ChangePasswordVisibilitylookStateCopyWith(ChangePasswordVisibilitylookState value, $Res Function(ChangePasswordVisibilitylookState) _then) = _$ChangePasswordVisibilitylookStateCopyWithImpl;
@useResult
$Res call({
 bool isPasswordVisible
});




}
/// @nodoc
class _$ChangePasswordVisibilitylookStateCopyWithImpl<$Res>
    implements $ChangePasswordVisibilitylookStateCopyWith<$Res> {
  _$ChangePasswordVisibilitylookStateCopyWithImpl(this._self, this._then);

  final ChangePasswordVisibilitylookState _self;
  final $Res Function(ChangePasswordVisibilitylookState) _then;

/// Create a copy of ChangeMyPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPasswordVisible = null,}) {
  return _then(ChangePasswordVisibilitylookState(
null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
