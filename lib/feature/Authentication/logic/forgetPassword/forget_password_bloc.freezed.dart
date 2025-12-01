// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forget_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ForgetPasswordEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordEvent()';
}


}

/// @nodoc
class $ForgetPasswordEventCopyWith<$Res>  {
$ForgetPasswordEventCopyWith(ForgetPasswordEvent _, $Res Function(ForgetPasswordEvent) __);
}


/// Adds pattern-matching-related methods to [ForgetPasswordEvent].
extension ForgetPasswordEventPatterns on ForgetPasswordEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( UserForgetPasswordEmailAddressEvent value)?  userForgetPasswordEmailAddress,TResult Function( UserForgetPasswordButtonEvent value)?  userForgetPasswordButton,TResult Function( UserForgetPasswordOTPButtonEvent value)?  userForgetPasswordOTP,TResult Function( UserForgetPasswordVerifyButtonEvent value)?  userForgetPasswordVerifyButton,TResult Function( UserForgetNewPasswordEvent value)?  userForgetNewPassword,TResult Function( UserForgetNewPasswordButtonEvent value)?  userForgetNewPasswordButton,TResult Function( UserConfirmForgetNewPasswordEvent value)?  userConfirmForgetNewPassword,TResult Function( UserShowConfirmForgetNewPasswordEvent value)?  userShowConfirmForgetNewPassword,TResult Function( UserShowForgetNewPasswordEvent value)?  userShowForgetNewPassword,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case UserForgetPasswordEmailAddressEvent() when userForgetPasswordEmailAddress != null:
return userForgetPasswordEmailAddress(_that);case UserForgetPasswordButtonEvent() when userForgetPasswordButton != null:
return userForgetPasswordButton(_that);case UserForgetPasswordOTPButtonEvent() when userForgetPasswordOTP != null:
return userForgetPasswordOTP(_that);case UserForgetPasswordVerifyButtonEvent() when userForgetPasswordVerifyButton != null:
return userForgetPasswordVerifyButton(_that);case UserForgetNewPasswordEvent() when userForgetNewPassword != null:
return userForgetNewPassword(_that);case UserForgetNewPasswordButtonEvent() when userForgetNewPasswordButton != null:
return userForgetNewPasswordButton(_that);case UserConfirmForgetNewPasswordEvent() when userConfirmForgetNewPassword != null:
return userConfirmForgetNewPassword(_that);case UserShowConfirmForgetNewPasswordEvent() when userShowConfirmForgetNewPassword != null:
return userShowConfirmForgetNewPassword(_that);case UserShowForgetNewPasswordEvent() when userShowForgetNewPassword != null:
return userShowForgetNewPassword(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( UserForgetPasswordEmailAddressEvent value)  userForgetPasswordEmailAddress,required TResult Function( UserForgetPasswordButtonEvent value)  userForgetPasswordButton,required TResult Function( UserForgetPasswordOTPButtonEvent value)  userForgetPasswordOTP,required TResult Function( UserForgetPasswordVerifyButtonEvent value)  userForgetPasswordVerifyButton,required TResult Function( UserForgetNewPasswordEvent value)  userForgetNewPassword,required TResult Function( UserForgetNewPasswordButtonEvent value)  userForgetNewPasswordButton,required TResult Function( UserConfirmForgetNewPasswordEvent value)  userConfirmForgetNewPassword,required TResult Function( UserShowConfirmForgetNewPasswordEvent value)  userShowConfirmForgetNewPassword,required TResult Function( UserShowForgetNewPasswordEvent value)  userShowForgetNewPassword,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case UserForgetPasswordEmailAddressEvent():
return userForgetPasswordEmailAddress(_that);case UserForgetPasswordButtonEvent():
return userForgetPasswordButton(_that);case UserForgetPasswordOTPButtonEvent():
return userForgetPasswordOTP(_that);case UserForgetPasswordVerifyButtonEvent():
return userForgetPasswordVerifyButton(_that);case UserForgetNewPasswordEvent():
return userForgetNewPassword(_that);case UserForgetNewPasswordButtonEvent():
return userForgetNewPasswordButton(_that);case UserConfirmForgetNewPasswordEvent():
return userConfirmForgetNewPassword(_that);case UserShowConfirmForgetNewPasswordEvent():
return userShowConfirmForgetNewPassword(_that);case UserShowForgetNewPasswordEvent():
return userShowForgetNewPassword(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( UserForgetPasswordEmailAddressEvent value)?  userForgetPasswordEmailAddress,TResult? Function( UserForgetPasswordButtonEvent value)?  userForgetPasswordButton,TResult? Function( UserForgetPasswordOTPButtonEvent value)?  userForgetPasswordOTP,TResult? Function( UserForgetPasswordVerifyButtonEvent value)?  userForgetPasswordVerifyButton,TResult? Function( UserForgetNewPasswordEvent value)?  userForgetNewPassword,TResult? Function( UserForgetNewPasswordButtonEvent value)?  userForgetNewPasswordButton,TResult? Function( UserConfirmForgetNewPasswordEvent value)?  userConfirmForgetNewPassword,TResult? Function( UserShowConfirmForgetNewPasswordEvent value)?  userShowConfirmForgetNewPassword,TResult? Function( UserShowForgetNewPasswordEvent value)?  userShowForgetNewPassword,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case UserForgetPasswordEmailAddressEvent() when userForgetPasswordEmailAddress != null:
return userForgetPasswordEmailAddress(_that);case UserForgetPasswordButtonEvent() when userForgetPasswordButton != null:
return userForgetPasswordButton(_that);case UserForgetPasswordOTPButtonEvent() when userForgetPasswordOTP != null:
return userForgetPasswordOTP(_that);case UserForgetPasswordVerifyButtonEvent() when userForgetPasswordVerifyButton != null:
return userForgetPasswordVerifyButton(_that);case UserForgetNewPasswordEvent() when userForgetNewPassword != null:
return userForgetNewPassword(_that);case UserForgetNewPasswordButtonEvent() when userForgetNewPasswordButton != null:
return userForgetNewPasswordButton(_that);case UserConfirmForgetNewPasswordEvent() when userConfirmForgetNewPassword != null:
return userConfirmForgetNewPassword(_that);case UserShowConfirmForgetNewPasswordEvent() when userShowConfirmForgetNewPassword != null:
return userShowConfirmForgetNewPassword(_that);case UserShowForgetNewPasswordEvent() when userShowForgetNewPassword != null:
return userShowForgetNewPassword(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String value)?  userForgetPasswordEmailAddress,TResult Function()?  userForgetPasswordButton,TResult Function( String value)?  userForgetPasswordOTP,TResult Function()?  userForgetPasswordVerifyButton,TResult Function( String value)?  userForgetNewPassword,TResult Function()?  userForgetNewPasswordButton,TResult Function( String value)?  userConfirmForgetNewPassword,TResult Function()?  userShowConfirmForgetNewPassword,TResult Function()?  userShowForgetNewPassword,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case UserForgetPasswordEmailAddressEvent() when userForgetPasswordEmailAddress != null:
return userForgetPasswordEmailAddress(_that.value);case UserForgetPasswordButtonEvent() when userForgetPasswordButton != null:
return userForgetPasswordButton();case UserForgetPasswordOTPButtonEvent() when userForgetPasswordOTP != null:
return userForgetPasswordOTP(_that.value);case UserForgetPasswordVerifyButtonEvent() when userForgetPasswordVerifyButton != null:
return userForgetPasswordVerifyButton();case UserForgetNewPasswordEvent() when userForgetNewPassword != null:
return userForgetNewPassword(_that.value);case UserForgetNewPasswordButtonEvent() when userForgetNewPasswordButton != null:
return userForgetNewPasswordButton();case UserConfirmForgetNewPasswordEvent() when userConfirmForgetNewPassword != null:
return userConfirmForgetNewPassword(_that.value);case UserShowConfirmForgetNewPasswordEvent() when userShowConfirmForgetNewPassword != null:
return userShowConfirmForgetNewPassword();case UserShowForgetNewPasswordEvent() when userShowForgetNewPassword != null:
return userShowForgetNewPassword();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String value)  userForgetPasswordEmailAddress,required TResult Function()  userForgetPasswordButton,required TResult Function( String value)  userForgetPasswordOTP,required TResult Function()  userForgetPasswordVerifyButton,required TResult Function( String value)  userForgetNewPassword,required TResult Function()  userForgetNewPasswordButton,required TResult Function( String value)  userConfirmForgetNewPassword,required TResult Function()  userShowConfirmForgetNewPassword,required TResult Function()  userShowForgetNewPassword,}) {final _that = this;
switch (_that) {
case _Started():
return started();case UserForgetPasswordEmailAddressEvent():
return userForgetPasswordEmailAddress(_that.value);case UserForgetPasswordButtonEvent():
return userForgetPasswordButton();case UserForgetPasswordOTPButtonEvent():
return userForgetPasswordOTP(_that.value);case UserForgetPasswordVerifyButtonEvent():
return userForgetPasswordVerifyButton();case UserForgetNewPasswordEvent():
return userForgetNewPassword(_that.value);case UserForgetNewPasswordButtonEvent():
return userForgetNewPasswordButton();case UserConfirmForgetNewPasswordEvent():
return userConfirmForgetNewPassword(_that.value);case UserShowConfirmForgetNewPasswordEvent():
return userShowConfirmForgetNewPassword();case UserShowForgetNewPasswordEvent():
return userShowForgetNewPassword();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String value)?  userForgetPasswordEmailAddress,TResult? Function()?  userForgetPasswordButton,TResult? Function( String value)?  userForgetPasswordOTP,TResult? Function()?  userForgetPasswordVerifyButton,TResult? Function( String value)?  userForgetNewPassword,TResult? Function()?  userForgetNewPasswordButton,TResult? Function( String value)?  userConfirmForgetNewPassword,TResult? Function()?  userShowConfirmForgetNewPassword,TResult? Function()?  userShowForgetNewPassword,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case UserForgetPasswordEmailAddressEvent() when userForgetPasswordEmailAddress != null:
return userForgetPasswordEmailAddress(_that.value);case UserForgetPasswordButtonEvent() when userForgetPasswordButton != null:
return userForgetPasswordButton();case UserForgetPasswordOTPButtonEvent() when userForgetPasswordOTP != null:
return userForgetPasswordOTP(_that.value);case UserForgetPasswordVerifyButtonEvent() when userForgetPasswordVerifyButton != null:
return userForgetPasswordVerifyButton();case UserForgetNewPasswordEvent() when userForgetNewPassword != null:
return userForgetNewPassword(_that.value);case UserForgetNewPasswordButtonEvent() when userForgetNewPasswordButton != null:
return userForgetNewPasswordButton();case UserConfirmForgetNewPasswordEvent() when userConfirmForgetNewPassword != null:
return userConfirmForgetNewPassword(_that.value);case UserShowConfirmForgetNewPasswordEvent() when userShowConfirmForgetNewPassword != null:
return userShowConfirmForgetNewPassword();case UserShowForgetNewPasswordEvent() when userShowForgetNewPassword != null:
return userShowForgetNewPassword();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements ForgetPasswordEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordEvent.started()';
}


}




/// @nodoc


class UserForgetPasswordEmailAddressEvent implements ForgetPasswordEvent {
  const UserForgetPasswordEmailAddressEvent(this.value);
  

 final  String value;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserForgetPasswordEmailAddressEventCopyWith<UserForgetPasswordEmailAddressEvent> get copyWith => _$UserForgetPasswordEmailAddressEventCopyWithImpl<UserForgetPasswordEmailAddressEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserForgetPasswordEmailAddressEvent&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordEvent.userForgetPasswordEmailAddress(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserForgetPasswordEmailAddressEventCopyWith<$Res> implements $ForgetPasswordEventCopyWith<$Res> {
  factory $UserForgetPasswordEmailAddressEventCopyWith(UserForgetPasswordEmailAddressEvent value, $Res Function(UserForgetPasswordEmailAddressEvent) _then) = _$UserForgetPasswordEmailAddressEventCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserForgetPasswordEmailAddressEventCopyWithImpl<$Res>
    implements $UserForgetPasswordEmailAddressEventCopyWith<$Res> {
  _$UserForgetPasswordEmailAddressEventCopyWithImpl(this._self, this._then);

  final UserForgetPasswordEmailAddressEvent _self;
  final $Res Function(UserForgetPasswordEmailAddressEvent) _then;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserForgetPasswordEmailAddressEvent(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserForgetPasswordButtonEvent implements ForgetPasswordEvent {
  const UserForgetPasswordButtonEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserForgetPasswordButtonEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordEvent.userForgetPasswordButton()';
}


}




/// @nodoc


class UserForgetPasswordOTPButtonEvent implements ForgetPasswordEvent {
  const UserForgetPasswordOTPButtonEvent(this.value);
  

 final  String value;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserForgetPasswordOTPButtonEventCopyWith<UserForgetPasswordOTPButtonEvent> get copyWith => _$UserForgetPasswordOTPButtonEventCopyWithImpl<UserForgetPasswordOTPButtonEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserForgetPasswordOTPButtonEvent&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordEvent.userForgetPasswordOTP(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserForgetPasswordOTPButtonEventCopyWith<$Res> implements $ForgetPasswordEventCopyWith<$Res> {
  factory $UserForgetPasswordOTPButtonEventCopyWith(UserForgetPasswordOTPButtonEvent value, $Res Function(UserForgetPasswordOTPButtonEvent) _then) = _$UserForgetPasswordOTPButtonEventCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserForgetPasswordOTPButtonEventCopyWithImpl<$Res>
    implements $UserForgetPasswordOTPButtonEventCopyWith<$Res> {
  _$UserForgetPasswordOTPButtonEventCopyWithImpl(this._self, this._then);

  final UserForgetPasswordOTPButtonEvent _self;
  final $Res Function(UserForgetPasswordOTPButtonEvent) _then;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserForgetPasswordOTPButtonEvent(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserForgetPasswordVerifyButtonEvent implements ForgetPasswordEvent {
  const UserForgetPasswordVerifyButtonEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserForgetPasswordVerifyButtonEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordEvent.userForgetPasswordVerifyButton()';
}


}




/// @nodoc


class UserForgetNewPasswordEvent implements ForgetPasswordEvent {
  const UserForgetNewPasswordEvent(this.value);
  

 final  String value;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserForgetNewPasswordEventCopyWith<UserForgetNewPasswordEvent> get copyWith => _$UserForgetNewPasswordEventCopyWithImpl<UserForgetNewPasswordEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserForgetNewPasswordEvent&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordEvent.userForgetNewPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserForgetNewPasswordEventCopyWith<$Res> implements $ForgetPasswordEventCopyWith<$Res> {
  factory $UserForgetNewPasswordEventCopyWith(UserForgetNewPasswordEvent value, $Res Function(UserForgetNewPasswordEvent) _then) = _$UserForgetNewPasswordEventCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserForgetNewPasswordEventCopyWithImpl<$Res>
    implements $UserForgetNewPasswordEventCopyWith<$Res> {
  _$UserForgetNewPasswordEventCopyWithImpl(this._self, this._then);

  final UserForgetNewPasswordEvent _self;
  final $Res Function(UserForgetNewPasswordEvent) _then;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserForgetNewPasswordEvent(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserForgetNewPasswordButtonEvent implements ForgetPasswordEvent {
  const UserForgetNewPasswordButtonEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserForgetNewPasswordButtonEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordEvent.userForgetNewPasswordButton()';
}


}




/// @nodoc


class UserConfirmForgetNewPasswordEvent implements ForgetPasswordEvent {
  const UserConfirmForgetNewPasswordEvent(this.value);
  

 final  String value;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserConfirmForgetNewPasswordEventCopyWith<UserConfirmForgetNewPasswordEvent> get copyWith => _$UserConfirmForgetNewPasswordEventCopyWithImpl<UserConfirmForgetNewPasswordEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserConfirmForgetNewPasswordEvent&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordEvent.userConfirmForgetNewPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserConfirmForgetNewPasswordEventCopyWith<$Res> implements $ForgetPasswordEventCopyWith<$Res> {
  factory $UserConfirmForgetNewPasswordEventCopyWith(UserConfirmForgetNewPasswordEvent value, $Res Function(UserConfirmForgetNewPasswordEvent) _then) = _$UserConfirmForgetNewPasswordEventCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserConfirmForgetNewPasswordEventCopyWithImpl<$Res>
    implements $UserConfirmForgetNewPasswordEventCopyWith<$Res> {
  _$UserConfirmForgetNewPasswordEventCopyWithImpl(this._self, this._then);

  final UserConfirmForgetNewPasswordEvent _self;
  final $Res Function(UserConfirmForgetNewPasswordEvent) _then;

/// Create a copy of ForgetPasswordEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserConfirmForgetNewPasswordEvent(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserShowConfirmForgetNewPasswordEvent implements ForgetPasswordEvent {
  const UserShowConfirmForgetNewPasswordEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserShowConfirmForgetNewPasswordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordEvent.userShowConfirmForgetNewPassword()';
}


}




/// @nodoc


class UserShowForgetNewPasswordEvent implements ForgetPasswordEvent {
  const UserShowForgetNewPasswordEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserShowForgetNewPasswordEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordEvent.userShowForgetNewPassword()';
}


}




/// @nodoc
mixin _$ForgetPasswordState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState()';
}


}

/// @nodoc
class $ForgetPasswordStateCopyWith<$Res>  {
$ForgetPasswordStateCopyWith(ForgetPasswordState _, $Res Function(ForgetPasswordState) __);
}


/// Adds pattern-matching-related methods to [ForgetPasswordState].
extension ForgetPasswordStatePatterns on ForgetPasswordState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ForgetPasswordLoadingData value)?  loading,TResult Function( ForgetPasswordButtonErrorData value)?  error,TResult Function( ForgetPasswordButtonSuccessData value)?  success,TResult Function( UserForgetEmailAddress value)?  userForgetEmailAddress,TResult Function( ContinueForgetButtonValidator value)?  userForgetButtonValidator,TResult Function( VerifyCodeLoadingData value)?  verifyCodeLoading,TResult Function( VerifyCodeButtonErrorData value)?  verifyCodeError,TResult Function( VerifyCodeButtonSuccessData value)?  verifyCodeSuccess,TResult Function( OtpVerifyCode value)?  otpVerifyCode,TResult Function( VerifyButtonValidator value)?  verifyButtonValidator,TResult Function( NewPasswordLoadingData value)?  newPasswordLoading,TResult Function( NewPasswordButtonErrorData value)?  newPasswordError,TResult Function( NewPasswordButtonSuccessData value)?  newPasswordSuccess,TResult Function( UserNewPassword value)?  userNewPassword,TResult Function( UserConfirmNewPassword value)?  userConfirmNewPassword,TResult Function( ShowNewPassword value)?  showNewPassword,TResult Function( ShowConfirmNewPassword value)?  showConfirmNewPassword,TResult Function( CreateNewPasswordValidator value)?  createNewPasswordValidator,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ForgetPasswordLoadingData() when loading != null:
return loading(_that);case ForgetPasswordButtonErrorData() when error != null:
return error(_that);case ForgetPasswordButtonSuccessData() when success != null:
return success(_that);case UserForgetEmailAddress() when userForgetEmailAddress != null:
return userForgetEmailAddress(_that);case ContinueForgetButtonValidator() when userForgetButtonValidator != null:
return userForgetButtonValidator(_that);case VerifyCodeLoadingData() when verifyCodeLoading != null:
return verifyCodeLoading(_that);case VerifyCodeButtonErrorData() when verifyCodeError != null:
return verifyCodeError(_that);case VerifyCodeButtonSuccessData() when verifyCodeSuccess != null:
return verifyCodeSuccess(_that);case OtpVerifyCode() when otpVerifyCode != null:
return otpVerifyCode(_that);case VerifyButtonValidator() when verifyButtonValidator != null:
return verifyButtonValidator(_that);case NewPasswordLoadingData() when newPasswordLoading != null:
return newPasswordLoading(_that);case NewPasswordButtonErrorData() when newPasswordError != null:
return newPasswordError(_that);case NewPasswordButtonSuccessData() when newPasswordSuccess != null:
return newPasswordSuccess(_that);case UserNewPassword() when userNewPassword != null:
return userNewPassword(_that);case UserConfirmNewPassword() when userConfirmNewPassword != null:
return userConfirmNewPassword(_that);case ShowNewPassword() when showNewPassword != null:
return showNewPassword(_that);case ShowConfirmNewPassword() when showConfirmNewPassword != null:
return showConfirmNewPassword(_that);case CreateNewPasswordValidator() when createNewPasswordValidator != null:
return createNewPasswordValidator(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ForgetPasswordLoadingData value)  loading,required TResult Function( ForgetPasswordButtonErrorData value)  error,required TResult Function( ForgetPasswordButtonSuccessData value)  success,required TResult Function( UserForgetEmailAddress value)  userForgetEmailAddress,required TResult Function( ContinueForgetButtonValidator value)  userForgetButtonValidator,required TResult Function( VerifyCodeLoadingData value)  verifyCodeLoading,required TResult Function( VerifyCodeButtonErrorData value)  verifyCodeError,required TResult Function( VerifyCodeButtonSuccessData value)  verifyCodeSuccess,required TResult Function( OtpVerifyCode value)  otpVerifyCode,required TResult Function( VerifyButtonValidator value)  verifyButtonValidator,required TResult Function( NewPasswordLoadingData value)  newPasswordLoading,required TResult Function( NewPasswordButtonErrorData value)  newPasswordError,required TResult Function( NewPasswordButtonSuccessData value)  newPasswordSuccess,required TResult Function( UserNewPassword value)  userNewPassword,required TResult Function( UserConfirmNewPassword value)  userConfirmNewPassword,required TResult Function( ShowNewPassword value)  showNewPassword,required TResult Function( ShowConfirmNewPassword value)  showConfirmNewPassword,required TResult Function( CreateNewPasswordValidator value)  createNewPasswordValidator,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ForgetPasswordLoadingData():
return loading(_that);case ForgetPasswordButtonErrorData():
return error(_that);case ForgetPasswordButtonSuccessData():
return success(_that);case UserForgetEmailAddress():
return userForgetEmailAddress(_that);case ContinueForgetButtonValidator():
return userForgetButtonValidator(_that);case VerifyCodeLoadingData():
return verifyCodeLoading(_that);case VerifyCodeButtonErrorData():
return verifyCodeError(_that);case VerifyCodeButtonSuccessData():
return verifyCodeSuccess(_that);case OtpVerifyCode():
return otpVerifyCode(_that);case VerifyButtonValidator():
return verifyButtonValidator(_that);case NewPasswordLoadingData():
return newPasswordLoading(_that);case NewPasswordButtonErrorData():
return newPasswordError(_that);case NewPasswordButtonSuccessData():
return newPasswordSuccess(_that);case UserNewPassword():
return userNewPassword(_that);case UserConfirmNewPassword():
return userConfirmNewPassword(_that);case ShowNewPassword():
return showNewPassword(_that);case ShowConfirmNewPassword():
return showConfirmNewPassword(_that);case CreateNewPasswordValidator():
return createNewPasswordValidator(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ForgetPasswordLoadingData value)?  loading,TResult? Function( ForgetPasswordButtonErrorData value)?  error,TResult? Function( ForgetPasswordButtonSuccessData value)?  success,TResult? Function( UserForgetEmailAddress value)?  userForgetEmailAddress,TResult? Function( ContinueForgetButtonValidator value)?  userForgetButtonValidator,TResult? Function( VerifyCodeLoadingData value)?  verifyCodeLoading,TResult? Function( VerifyCodeButtonErrorData value)?  verifyCodeError,TResult? Function( VerifyCodeButtonSuccessData value)?  verifyCodeSuccess,TResult? Function( OtpVerifyCode value)?  otpVerifyCode,TResult? Function( VerifyButtonValidator value)?  verifyButtonValidator,TResult? Function( NewPasswordLoadingData value)?  newPasswordLoading,TResult? Function( NewPasswordButtonErrorData value)?  newPasswordError,TResult? Function( NewPasswordButtonSuccessData value)?  newPasswordSuccess,TResult? Function( UserNewPassword value)?  userNewPassword,TResult? Function( UserConfirmNewPassword value)?  userConfirmNewPassword,TResult? Function( ShowNewPassword value)?  showNewPassword,TResult? Function( ShowConfirmNewPassword value)?  showConfirmNewPassword,TResult? Function( CreateNewPasswordValidator value)?  createNewPasswordValidator,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ForgetPasswordLoadingData() when loading != null:
return loading(_that);case ForgetPasswordButtonErrorData() when error != null:
return error(_that);case ForgetPasswordButtonSuccessData() when success != null:
return success(_that);case UserForgetEmailAddress() when userForgetEmailAddress != null:
return userForgetEmailAddress(_that);case ContinueForgetButtonValidator() when userForgetButtonValidator != null:
return userForgetButtonValidator(_that);case VerifyCodeLoadingData() when verifyCodeLoading != null:
return verifyCodeLoading(_that);case VerifyCodeButtonErrorData() when verifyCodeError != null:
return verifyCodeError(_that);case VerifyCodeButtonSuccessData() when verifyCodeSuccess != null:
return verifyCodeSuccess(_that);case OtpVerifyCode() when otpVerifyCode != null:
return otpVerifyCode(_that);case VerifyButtonValidator() when verifyButtonValidator != null:
return verifyButtonValidator(_that);case NewPasswordLoadingData() when newPasswordLoading != null:
return newPasswordLoading(_that);case NewPasswordButtonErrorData() when newPasswordError != null:
return newPasswordError(_that);case NewPasswordButtonSuccessData() when newPasswordSuccess != null:
return newPasswordSuccess(_that);case UserNewPassword() when userNewPassword != null:
return userNewPassword(_that);case UserConfirmNewPassword() when userConfirmNewPassword != null:
return userConfirmNewPassword(_that);case ShowNewPassword() when showNewPassword != null:
return showNewPassword(_that);case ShowConfirmNewPassword() when showConfirmNewPassword != null:
return showConfirmNewPassword(_that);case CreateNewPasswordValidator() when createNewPasswordValidator != null:
return createNewPasswordValidator(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ApiErrorModel apiErrorModel)?  error,TResult Function( ApiSuccessGeneralModel data)?  success,TResult Function( String value)?  userForgetEmailAddress,TResult Function( bool value)?  userForgetButtonValidator,TResult Function()?  verifyCodeLoading,TResult Function( ApiErrorModel apiErrorModel)?  verifyCodeError,TResult Function( ApiSuccessGeneralModel data)?  verifyCodeSuccess,TResult Function( String? value)?  otpVerifyCode,TResult Function( bool value)?  verifyButtonValidator,TResult Function()?  newPasswordLoading,TResult Function( ApiErrorModel apiErrorModel)?  newPasswordError,TResult Function( AuthResponse data)?  newPasswordSuccess,TResult Function( String value)?  userNewPassword,TResult Function( String value)?  userConfirmNewPassword,TResult Function( bool value)?  showNewPassword,TResult Function( bool value)?  showConfirmNewPassword,TResult Function( bool value)?  createNewPasswordValidator,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ForgetPasswordLoadingData() when loading != null:
return loading();case ForgetPasswordButtonErrorData() when error != null:
return error(_that.apiErrorModel);case ForgetPasswordButtonSuccessData() when success != null:
return success(_that.data);case UserForgetEmailAddress() when userForgetEmailAddress != null:
return userForgetEmailAddress(_that.value);case ContinueForgetButtonValidator() when userForgetButtonValidator != null:
return userForgetButtonValidator(_that.value);case VerifyCodeLoadingData() when verifyCodeLoading != null:
return verifyCodeLoading();case VerifyCodeButtonErrorData() when verifyCodeError != null:
return verifyCodeError(_that.apiErrorModel);case VerifyCodeButtonSuccessData() when verifyCodeSuccess != null:
return verifyCodeSuccess(_that.data);case OtpVerifyCode() when otpVerifyCode != null:
return otpVerifyCode(_that.value);case VerifyButtonValidator() when verifyButtonValidator != null:
return verifyButtonValidator(_that.value);case NewPasswordLoadingData() when newPasswordLoading != null:
return newPasswordLoading();case NewPasswordButtonErrorData() when newPasswordError != null:
return newPasswordError(_that.apiErrorModel);case NewPasswordButtonSuccessData() when newPasswordSuccess != null:
return newPasswordSuccess(_that.data);case UserNewPassword() when userNewPassword != null:
return userNewPassword(_that.value);case UserConfirmNewPassword() when userConfirmNewPassword != null:
return userConfirmNewPassword(_that.value);case ShowNewPassword() when showNewPassword != null:
return showNewPassword(_that.value);case ShowConfirmNewPassword() when showConfirmNewPassword != null:
return showConfirmNewPassword(_that.value);case CreateNewPasswordValidator() when createNewPasswordValidator != null:
return createNewPasswordValidator(_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ApiErrorModel apiErrorModel)  error,required TResult Function( ApiSuccessGeneralModel data)  success,required TResult Function( String value)  userForgetEmailAddress,required TResult Function( bool value)  userForgetButtonValidator,required TResult Function()  verifyCodeLoading,required TResult Function( ApiErrorModel apiErrorModel)  verifyCodeError,required TResult Function( ApiSuccessGeneralModel data)  verifyCodeSuccess,required TResult Function( String? value)  otpVerifyCode,required TResult Function( bool value)  verifyButtonValidator,required TResult Function()  newPasswordLoading,required TResult Function( ApiErrorModel apiErrorModel)  newPasswordError,required TResult Function( AuthResponse data)  newPasswordSuccess,required TResult Function( String value)  userNewPassword,required TResult Function( String value)  userConfirmNewPassword,required TResult Function( bool value)  showNewPassword,required TResult Function( bool value)  showConfirmNewPassword,required TResult Function( bool value)  createNewPasswordValidator,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ForgetPasswordLoadingData():
return loading();case ForgetPasswordButtonErrorData():
return error(_that.apiErrorModel);case ForgetPasswordButtonSuccessData():
return success(_that.data);case UserForgetEmailAddress():
return userForgetEmailAddress(_that.value);case ContinueForgetButtonValidator():
return userForgetButtonValidator(_that.value);case VerifyCodeLoadingData():
return verifyCodeLoading();case VerifyCodeButtonErrorData():
return verifyCodeError(_that.apiErrorModel);case VerifyCodeButtonSuccessData():
return verifyCodeSuccess(_that.data);case OtpVerifyCode():
return otpVerifyCode(_that.value);case VerifyButtonValidator():
return verifyButtonValidator(_that.value);case NewPasswordLoadingData():
return newPasswordLoading();case NewPasswordButtonErrorData():
return newPasswordError(_that.apiErrorModel);case NewPasswordButtonSuccessData():
return newPasswordSuccess(_that.data);case UserNewPassword():
return userNewPassword(_that.value);case UserConfirmNewPassword():
return userConfirmNewPassword(_that.value);case ShowNewPassword():
return showNewPassword(_that.value);case ShowConfirmNewPassword():
return showConfirmNewPassword(_that.value);case CreateNewPasswordValidator():
return createNewPasswordValidator(_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ApiErrorModel apiErrorModel)?  error,TResult? Function( ApiSuccessGeneralModel data)?  success,TResult? Function( String value)?  userForgetEmailAddress,TResult? Function( bool value)?  userForgetButtonValidator,TResult? Function()?  verifyCodeLoading,TResult? Function( ApiErrorModel apiErrorModel)?  verifyCodeError,TResult? Function( ApiSuccessGeneralModel data)?  verifyCodeSuccess,TResult? Function( String? value)?  otpVerifyCode,TResult? Function( bool value)?  verifyButtonValidator,TResult? Function()?  newPasswordLoading,TResult? Function( ApiErrorModel apiErrorModel)?  newPasswordError,TResult? Function( AuthResponse data)?  newPasswordSuccess,TResult? Function( String value)?  userNewPassword,TResult? Function( String value)?  userConfirmNewPassword,TResult? Function( bool value)?  showNewPassword,TResult? Function( bool value)?  showConfirmNewPassword,TResult? Function( bool value)?  createNewPasswordValidator,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ForgetPasswordLoadingData() when loading != null:
return loading();case ForgetPasswordButtonErrorData() when error != null:
return error(_that.apiErrorModel);case ForgetPasswordButtonSuccessData() when success != null:
return success(_that.data);case UserForgetEmailAddress() when userForgetEmailAddress != null:
return userForgetEmailAddress(_that.value);case ContinueForgetButtonValidator() when userForgetButtonValidator != null:
return userForgetButtonValidator(_that.value);case VerifyCodeLoadingData() when verifyCodeLoading != null:
return verifyCodeLoading();case VerifyCodeButtonErrorData() when verifyCodeError != null:
return verifyCodeError(_that.apiErrorModel);case VerifyCodeButtonSuccessData() when verifyCodeSuccess != null:
return verifyCodeSuccess(_that.data);case OtpVerifyCode() when otpVerifyCode != null:
return otpVerifyCode(_that.value);case VerifyButtonValidator() when verifyButtonValidator != null:
return verifyButtonValidator(_that.value);case NewPasswordLoadingData() when newPasswordLoading != null:
return newPasswordLoading();case NewPasswordButtonErrorData() when newPasswordError != null:
return newPasswordError(_that.apiErrorModel);case NewPasswordButtonSuccessData() when newPasswordSuccess != null:
return newPasswordSuccess(_that.data);case UserNewPassword() when userNewPassword != null:
return userNewPassword(_that.value);case UserConfirmNewPassword() when userConfirmNewPassword != null:
return userConfirmNewPassword(_that.value);case ShowNewPassword() when showNewPassword != null:
return showNewPassword(_that.value);case ShowConfirmNewPassword() when showConfirmNewPassword != null:
return showConfirmNewPassword(_that.value);case CreateNewPasswordValidator() when createNewPasswordValidator != null:
return createNewPasswordValidator(_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ForgetPasswordState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.initial()';
}


}




/// @nodoc


class ForgetPasswordLoadingData implements ForgetPasswordState {
  const ForgetPasswordLoadingData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordLoadingData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.loading()';
}


}




/// @nodoc


class ForgetPasswordButtonErrorData implements ForgetPasswordState {
  const ForgetPasswordButtonErrorData(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordButtonErrorDataCopyWith<ForgetPasswordButtonErrorData> get copyWith => _$ForgetPasswordButtonErrorDataCopyWithImpl<ForgetPasswordButtonErrorData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordButtonErrorData&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'ForgetPasswordState.error(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordButtonErrorDataCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $ForgetPasswordButtonErrorDataCopyWith(ForgetPasswordButtonErrorData value, $Res Function(ForgetPasswordButtonErrorData) _then) = _$ForgetPasswordButtonErrorDataCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$ForgetPasswordButtonErrorDataCopyWithImpl<$Res>
    implements $ForgetPasswordButtonErrorDataCopyWith<$Res> {
  _$ForgetPasswordButtonErrorDataCopyWithImpl(this._self, this._then);

  final ForgetPasswordButtonErrorData _self;
  final $Res Function(ForgetPasswordButtonErrorData) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(ForgetPasswordButtonErrorData(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class ForgetPasswordButtonSuccessData implements ForgetPasswordState {
  const ForgetPasswordButtonSuccessData(this.data);
  

 final  ApiSuccessGeneralModel data;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForgetPasswordButtonSuccessDataCopyWith<ForgetPasswordButtonSuccessData> get copyWith => _$ForgetPasswordButtonSuccessDataCopyWithImpl<ForgetPasswordButtonSuccessData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForgetPasswordButtonSuccessData&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ForgetPasswordState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ForgetPasswordButtonSuccessDataCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $ForgetPasswordButtonSuccessDataCopyWith(ForgetPasswordButtonSuccessData value, $Res Function(ForgetPasswordButtonSuccessData) _then) = _$ForgetPasswordButtonSuccessDataCopyWithImpl;
@useResult
$Res call({
 ApiSuccessGeneralModel data
});




}
/// @nodoc
class _$ForgetPasswordButtonSuccessDataCopyWithImpl<$Res>
    implements $ForgetPasswordButtonSuccessDataCopyWith<$Res> {
  _$ForgetPasswordButtonSuccessDataCopyWithImpl(this._self, this._then);

  final ForgetPasswordButtonSuccessData _self;
  final $Res Function(ForgetPasswordButtonSuccessData) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ForgetPasswordButtonSuccessData(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ApiSuccessGeneralModel,
  ));
}


}

/// @nodoc


class UserForgetEmailAddress implements ForgetPasswordState {
  const UserForgetEmailAddress(this.value);
  

 final  String value;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserForgetEmailAddressCopyWith<UserForgetEmailAddress> get copyWith => _$UserForgetEmailAddressCopyWithImpl<UserForgetEmailAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserForgetEmailAddress&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordState.userForgetEmailAddress(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserForgetEmailAddressCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $UserForgetEmailAddressCopyWith(UserForgetEmailAddress value, $Res Function(UserForgetEmailAddress) _then) = _$UserForgetEmailAddressCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserForgetEmailAddressCopyWithImpl<$Res>
    implements $UserForgetEmailAddressCopyWith<$Res> {
  _$UserForgetEmailAddressCopyWithImpl(this._self, this._then);

  final UserForgetEmailAddress _self;
  final $Res Function(UserForgetEmailAddress) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserForgetEmailAddress(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ContinueForgetButtonValidator implements ForgetPasswordState {
  const ContinueForgetButtonValidator(this.value);
  

 final  bool value;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContinueForgetButtonValidatorCopyWith<ContinueForgetButtonValidator> get copyWith => _$ContinueForgetButtonValidatorCopyWithImpl<ContinueForgetButtonValidator>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContinueForgetButtonValidator&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordState.userForgetButtonValidator(value: $value)';
}


}

/// @nodoc
abstract mixin class $ContinueForgetButtonValidatorCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $ContinueForgetButtonValidatorCopyWith(ContinueForgetButtonValidator value, $Res Function(ContinueForgetButtonValidator) _then) = _$ContinueForgetButtonValidatorCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$ContinueForgetButtonValidatorCopyWithImpl<$Res>
    implements $ContinueForgetButtonValidatorCopyWith<$Res> {
  _$ContinueForgetButtonValidatorCopyWithImpl(this._self, this._then);

  final ContinueForgetButtonValidator _self;
  final $Res Function(ContinueForgetButtonValidator) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ContinueForgetButtonValidator(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class VerifyCodeLoadingData implements ForgetPasswordState {
  const VerifyCodeLoadingData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeLoadingData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.verifyCodeLoading()';
}


}




/// @nodoc


class VerifyCodeButtonErrorData implements ForgetPasswordState {
  const VerifyCodeButtonErrorData(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyCodeButtonErrorDataCopyWith<VerifyCodeButtonErrorData> get copyWith => _$VerifyCodeButtonErrorDataCopyWithImpl<VerifyCodeButtonErrorData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeButtonErrorData&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'ForgetPasswordState.verifyCodeError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $VerifyCodeButtonErrorDataCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $VerifyCodeButtonErrorDataCopyWith(VerifyCodeButtonErrorData value, $Res Function(VerifyCodeButtonErrorData) _then) = _$VerifyCodeButtonErrorDataCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$VerifyCodeButtonErrorDataCopyWithImpl<$Res>
    implements $VerifyCodeButtonErrorDataCopyWith<$Res> {
  _$VerifyCodeButtonErrorDataCopyWithImpl(this._self, this._then);

  final VerifyCodeButtonErrorData _self;
  final $Res Function(VerifyCodeButtonErrorData) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(VerifyCodeButtonErrorData(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class VerifyCodeButtonSuccessData implements ForgetPasswordState {
  const VerifyCodeButtonSuccessData(this.data);
  

 final  ApiSuccessGeneralModel data;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyCodeButtonSuccessDataCopyWith<VerifyCodeButtonSuccessData> get copyWith => _$VerifyCodeButtonSuccessDataCopyWithImpl<VerifyCodeButtonSuccessData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyCodeButtonSuccessData&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ForgetPasswordState.verifyCodeSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $VerifyCodeButtonSuccessDataCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $VerifyCodeButtonSuccessDataCopyWith(VerifyCodeButtonSuccessData value, $Res Function(VerifyCodeButtonSuccessData) _then) = _$VerifyCodeButtonSuccessDataCopyWithImpl;
@useResult
$Res call({
 ApiSuccessGeneralModel data
});




}
/// @nodoc
class _$VerifyCodeButtonSuccessDataCopyWithImpl<$Res>
    implements $VerifyCodeButtonSuccessDataCopyWith<$Res> {
  _$VerifyCodeButtonSuccessDataCopyWithImpl(this._self, this._then);

  final VerifyCodeButtonSuccessData _self;
  final $Res Function(VerifyCodeButtonSuccessData) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(VerifyCodeButtonSuccessData(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ApiSuccessGeneralModel,
  ));
}


}

/// @nodoc


class OtpVerifyCode implements ForgetPasswordState {
  const OtpVerifyCode(this.value);
  

 final  String? value;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpVerifyCodeCopyWith<OtpVerifyCode> get copyWith => _$OtpVerifyCodeCopyWithImpl<OtpVerifyCode>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpVerifyCode&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordState.otpVerifyCode(value: $value)';
}


}

/// @nodoc
abstract mixin class $OtpVerifyCodeCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $OtpVerifyCodeCopyWith(OtpVerifyCode value, $Res Function(OtpVerifyCode) _then) = _$OtpVerifyCodeCopyWithImpl;
@useResult
$Res call({
 String? value
});




}
/// @nodoc
class _$OtpVerifyCodeCopyWithImpl<$Res>
    implements $OtpVerifyCodeCopyWith<$Res> {
  _$OtpVerifyCodeCopyWithImpl(this._self, this._then);

  final OtpVerifyCode _self;
  final $Res Function(OtpVerifyCode) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = freezed,}) {
  return _then(OtpVerifyCode(
freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class VerifyButtonValidator implements ForgetPasswordState {
  const VerifyButtonValidator(this.value);
  

 final  bool value;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyButtonValidatorCopyWith<VerifyButtonValidator> get copyWith => _$VerifyButtonValidatorCopyWithImpl<VerifyButtonValidator>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyButtonValidator&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordState.verifyButtonValidator(value: $value)';
}


}

/// @nodoc
abstract mixin class $VerifyButtonValidatorCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $VerifyButtonValidatorCopyWith(VerifyButtonValidator value, $Res Function(VerifyButtonValidator) _then) = _$VerifyButtonValidatorCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$VerifyButtonValidatorCopyWithImpl<$Res>
    implements $VerifyButtonValidatorCopyWith<$Res> {
  _$VerifyButtonValidatorCopyWithImpl(this._self, this._then);

  final VerifyButtonValidator _self;
  final $Res Function(VerifyButtonValidator) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(VerifyButtonValidator(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class NewPasswordLoadingData implements ForgetPasswordState {
  const NewPasswordLoadingData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewPasswordLoadingData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ForgetPasswordState.newPasswordLoading()';
}


}




/// @nodoc


class NewPasswordButtonErrorData implements ForgetPasswordState {
  const NewPasswordButtonErrorData(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewPasswordButtonErrorDataCopyWith<NewPasswordButtonErrorData> get copyWith => _$NewPasswordButtonErrorDataCopyWithImpl<NewPasswordButtonErrorData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewPasswordButtonErrorData&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'ForgetPasswordState.newPasswordError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $NewPasswordButtonErrorDataCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $NewPasswordButtonErrorDataCopyWith(NewPasswordButtonErrorData value, $Res Function(NewPasswordButtonErrorData) _then) = _$NewPasswordButtonErrorDataCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$NewPasswordButtonErrorDataCopyWithImpl<$Res>
    implements $NewPasswordButtonErrorDataCopyWith<$Res> {
  _$NewPasswordButtonErrorDataCopyWithImpl(this._self, this._then);

  final NewPasswordButtonErrorData _self;
  final $Res Function(NewPasswordButtonErrorData) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(NewPasswordButtonErrorData(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class NewPasswordButtonSuccessData implements ForgetPasswordState {
  const NewPasswordButtonSuccessData(this.data);
  

 final  AuthResponse data;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewPasswordButtonSuccessDataCopyWith<NewPasswordButtonSuccessData> get copyWith => _$NewPasswordButtonSuccessDataCopyWithImpl<NewPasswordButtonSuccessData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewPasswordButtonSuccessData&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ForgetPasswordState.newPasswordSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $NewPasswordButtonSuccessDataCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $NewPasswordButtonSuccessDataCopyWith(NewPasswordButtonSuccessData value, $Res Function(NewPasswordButtonSuccessData) _then) = _$NewPasswordButtonSuccessDataCopyWithImpl;
@useResult
$Res call({
 AuthResponse data
});




}
/// @nodoc
class _$NewPasswordButtonSuccessDataCopyWithImpl<$Res>
    implements $NewPasswordButtonSuccessDataCopyWith<$Res> {
  _$NewPasswordButtonSuccessDataCopyWithImpl(this._self, this._then);

  final NewPasswordButtonSuccessData _self;
  final $Res Function(NewPasswordButtonSuccessData) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(NewPasswordButtonSuccessData(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthResponse,
  ));
}


}

/// @nodoc


class UserNewPassword implements ForgetPasswordState {
  const UserNewPassword(this.value);
  

 final  String value;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserNewPasswordCopyWith<UserNewPassword> get copyWith => _$UserNewPasswordCopyWithImpl<UserNewPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserNewPassword&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordState.userNewPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserNewPasswordCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $UserNewPasswordCopyWith(UserNewPassword value, $Res Function(UserNewPassword) _then) = _$UserNewPasswordCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserNewPasswordCopyWithImpl<$Res>
    implements $UserNewPasswordCopyWith<$Res> {
  _$UserNewPasswordCopyWithImpl(this._self, this._then);

  final UserNewPassword _self;
  final $Res Function(UserNewPassword) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserNewPassword(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserConfirmNewPassword implements ForgetPasswordState {
  const UserConfirmNewPassword(this.value);
  

 final  String value;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserConfirmNewPasswordCopyWith<UserConfirmNewPassword> get copyWith => _$UserConfirmNewPasswordCopyWithImpl<UserConfirmNewPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserConfirmNewPassword&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordState.userConfirmNewPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserConfirmNewPasswordCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $UserConfirmNewPasswordCopyWith(UserConfirmNewPassword value, $Res Function(UserConfirmNewPassword) _then) = _$UserConfirmNewPasswordCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserConfirmNewPasswordCopyWithImpl<$Res>
    implements $UserConfirmNewPasswordCopyWith<$Res> {
  _$UserConfirmNewPasswordCopyWithImpl(this._self, this._then);

  final UserConfirmNewPassword _self;
  final $Res Function(UserConfirmNewPassword) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserConfirmNewPassword(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ShowNewPassword implements ForgetPasswordState {
  const ShowNewPassword(this.value);
  

 final  bool value;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowNewPasswordCopyWith<ShowNewPassword> get copyWith => _$ShowNewPasswordCopyWithImpl<ShowNewPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowNewPassword&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordState.showNewPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $ShowNewPasswordCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $ShowNewPasswordCopyWith(ShowNewPassword value, $Res Function(ShowNewPassword) _then) = _$ShowNewPasswordCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$ShowNewPasswordCopyWithImpl<$Res>
    implements $ShowNewPasswordCopyWith<$Res> {
  _$ShowNewPasswordCopyWithImpl(this._self, this._then);

  final ShowNewPassword _self;
  final $Res Function(ShowNewPassword) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ShowNewPassword(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ShowConfirmNewPassword implements ForgetPasswordState {
  const ShowConfirmNewPassword(this.value);
  

 final  bool value;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowConfirmNewPasswordCopyWith<ShowConfirmNewPassword> get copyWith => _$ShowConfirmNewPasswordCopyWithImpl<ShowConfirmNewPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowConfirmNewPassword&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordState.showConfirmNewPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $ShowConfirmNewPasswordCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $ShowConfirmNewPasswordCopyWith(ShowConfirmNewPassword value, $Res Function(ShowConfirmNewPassword) _then) = _$ShowConfirmNewPasswordCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$ShowConfirmNewPasswordCopyWithImpl<$Res>
    implements $ShowConfirmNewPasswordCopyWith<$Res> {
  _$ShowConfirmNewPasswordCopyWithImpl(this._self, this._then);

  final ShowConfirmNewPassword _self;
  final $Res Function(ShowConfirmNewPassword) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ShowConfirmNewPassword(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CreateNewPasswordValidator implements ForgetPasswordState {
  const CreateNewPasswordValidator(this.value);
  

 final  bool value;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateNewPasswordValidatorCopyWith<CreateNewPasswordValidator> get copyWith => _$CreateNewPasswordValidatorCopyWithImpl<CreateNewPasswordValidator>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateNewPasswordValidator&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'ForgetPasswordState.createNewPasswordValidator(value: $value)';
}


}

/// @nodoc
abstract mixin class $CreateNewPasswordValidatorCopyWith<$Res> implements $ForgetPasswordStateCopyWith<$Res> {
  factory $CreateNewPasswordValidatorCopyWith(CreateNewPasswordValidator value, $Res Function(CreateNewPasswordValidator) _then) = _$CreateNewPasswordValidatorCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$CreateNewPasswordValidatorCopyWithImpl<$Res>
    implements $CreateNewPasswordValidatorCopyWith<$Res> {
  _$CreateNewPasswordValidatorCopyWithImpl(this._self, this._then);

  final CreateNewPasswordValidator _self;
  final $Res Function(CreateNewPasswordValidator) _then;

/// Create a copy of ForgetPasswordState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(CreateNewPasswordValidator(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
