// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( UserLoginEmailAddress value)?  userLoginEmailAddress,TResult Function( UserLoginPassword value)?  userLoginPassword,TResult Function( UserShowLoginPassword value)?  userShowLoginPassword,TResult Function( UserLoginButton value)?  userLoginButton,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case UserLoginEmailAddress() when userLoginEmailAddress != null:
return userLoginEmailAddress(_that);case UserLoginPassword() when userLoginPassword != null:
return userLoginPassword(_that);case UserShowLoginPassword() when userShowLoginPassword != null:
return userShowLoginPassword(_that);case UserLoginButton() when userLoginButton != null:
return userLoginButton(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( UserLoginEmailAddress value)  userLoginEmailAddress,required TResult Function( UserLoginPassword value)  userLoginPassword,required TResult Function( UserShowLoginPassword value)  userShowLoginPassword,required TResult Function( UserLoginButton value)  userLoginButton,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case UserLoginEmailAddress():
return userLoginEmailAddress(_that);case UserLoginPassword():
return userLoginPassword(_that);case UserShowLoginPassword():
return userShowLoginPassword(_that);case UserLoginButton():
return userLoginButton(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( UserLoginEmailAddress value)?  userLoginEmailAddress,TResult? Function( UserLoginPassword value)?  userLoginPassword,TResult? Function( UserShowLoginPassword value)?  userShowLoginPassword,TResult? Function( UserLoginButton value)?  userLoginButton,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case UserLoginEmailAddress() when userLoginEmailAddress != null:
return userLoginEmailAddress(_that);case UserLoginPassword() when userLoginPassword != null:
return userLoginPassword(_that);case UserShowLoginPassword() when userShowLoginPassword != null:
return userShowLoginPassword(_that);case UserLoginButton() when userLoginButton != null:
return userLoginButton(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String value)?  userLoginEmailAddress,TResult Function( String value)?  userLoginPassword,TResult Function()?  userShowLoginPassword,TResult Function()?  userLoginButton,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case UserLoginEmailAddress() when userLoginEmailAddress != null:
return userLoginEmailAddress(_that.value);case UserLoginPassword() when userLoginPassword != null:
return userLoginPassword(_that.value);case UserShowLoginPassword() when userShowLoginPassword != null:
return userShowLoginPassword();case UserLoginButton() when userLoginButton != null:
return userLoginButton();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String value)  userLoginEmailAddress,required TResult Function( String value)  userLoginPassword,required TResult Function()  userShowLoginPassword,required TResult Function()  userLoginButton,}) {final _that = this;
switch (_that) {
case _Started():
return started();case UserLoginEmailAddress():
return userLoginEmailAddress(_that.value);case UserLoginPassword():
return userLoginPassword(_that.value);case UserShowLoginPassword():
return userShowLoginPassword();case UserLoginButton():
return userLoginButton();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String value)?  userLoginEmailAddress,TResult? Function( String value)?  userLoginPassword,TResult? Function()?  userShowLoginPassword,TResult? Function()?  userLoginButton,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case UserLoginEmailAddress() when userLoginEmailAddress != null:
return userLoginEmailAddress(_that.value);case UserLoginPassword() when userLoginPassword != null:
return userLoginPassword(_that.value);case UserShowLoginPassword() when userShowLoginPassword != null:
return userShowLoginPassword();case UserLoginButton() when userLoginButton != null:
return userLoginButton();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements LoginEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.started()';
}


}




/// @nodoc


class UserLoginEmailAddress implements LoginEvent {
  const UserLoginEmailAddress(this.value);
  

 final  String value;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoginEmailAddressCopyWith<UserLoginEmailAddress> get copyWith => _$UserLoginEmailAddressCopyWithImpl<UserLoginEmailAddress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoginEmailAddress&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginEvent.userLoginEmailAddress(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserLoginEmailAddressCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $UserLoginEmailAddressCopyWith(UserLoginEmailAddress value, $Res Function(UserLoginEmailAddress) _then) = _$UserLoginEmailAddressCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserLoginEmailAddressCopyWithImpl<$Res>
    implements $UserLoginEmailAddressCopyWith<$Res> {
  _$UserLoginEmailAddressCopyWithImpl(this._self, this._then);

  final UserLoginEmailAddress _self;
  final $Res Function(UserLoginEmailAddress) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserLoginEmailAddress(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserLoginPassword implements LoginEvent {
  const UserLoginPassword(this.value);
  

 final  String value;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoginPasswordCopyWith<UserLoginPassword> get copyWith => _$UserLoginPasswordCopyWithImpl<UserLoginPassword>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoginPassword&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginEvent.userLoginPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserLoginPasswordCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $UserLoginPasswordCopyWith(UserLoginPassword value, $Res Function(UserLoginPassword) _then) = _$UserLoginPasswordCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserLoginPasswordCopyWithImpl<$Res>
    implements $UserLoginPasswordCopyWith<$Res> {
  _$UserLoginPasswordCopyWithImpl(this._self, this._then);

  final UserLoginPassword _self;
  final $Res Function(UserLoginPassword) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserLoginPassword(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserShowLoginPassword implements LoginEvent {
  const UserShowLoginPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserShowLoginPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.userShowLoginPassword()';
}


}




/// @nodoc


class UserLoginButton implements LoginEvent {
  const UserLoginButton();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoginButton);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.userLoginButton()';
}


}




/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( UserLoginEmailAddressState value)?  userLoginEmailAddress,TResult Function( UserLoginPasswordState value)?  userLoginPassword,TResult Function( ShowUserPasswordState value)?  showUserPassword,TResult Function( ButtonLoginVaildation value)?  buttonLoginVaildation,TResult Function( LoginButtonLoadingData value)?  loading,TResult Function( LoginButtonErrorData value)?  error,TResult Function( LoginButtonSuccessData value)?  suceess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UserLoginEmailAddressState() when userLoginEmailAddress != null:
return userLoginEmailAddress(_that);case UserLoginPasswordState() when userLoginPassword != null:
return userLoginPassword(_that);case ShowUserPasswordState() when showUserPassword != null:
return showUserPassword(_that);case ButtonLoginVaildation() when buttonLoginVaildation != null:
return buttonLoginVaildation(_that);case LoginButtonLoadingData() when loading != null:
return loading(_that);case LoginButtonErrorData() when error != null:
return error(_that);case LoginButtonSuccessData() when suceess != null:
return suceess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( UserLoginEmailAddressState value)  userLoginEmailAddress,required TResult Function( UserLoginPasswordState value)  userLoginPassword,required TResult Function( ShowUserPasswordState value)  showUserPassword,required TResult Function( ButtonLoginVaildation value)  buttonLoginVaildation,required TResult Function( LoginButtonLoadingData value)  loading,required TResult Function( LoginButtonErrorData value)  error,required TResult Function( LoginButtonSuccessData value)  suceess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case UserLoginEmailAddressState():
return userLoginEmailAddress(_that);case UserLoginPasswordState():
return userLoginPassword(_that);case ShowUserPasswordState():
return showUserPassword(_that);case ButtonLoginVaildation():
return buttonLoginVaildation(_that);case LoginButtonLoadingData():
return loading(_that);case LoginButtonErrorData():
return error(_that);case LoginButtonSuccessData():
return suceess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( UserLoginEmailAddressState value)?  userLoginEmailAddress,TResult? Function( UserLoginPasswordState value)?  userLoginPassword,TResult? Function( ShowUserPasswordState value)?  showUserPassword,TResult? Function( ButtonLoginVaildation value)?  buttonLoginVaildation,TResult? Function( LoginButtonLoadingData value)?  loading,TResult? Function( LoginButtonErrorData value)?  error,TResult? Function( LoginButtonSuccessData value)?  suceess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UserLoginEmailAddressState() when userLoginEmailAddress != null:
return userLoginEmailAddress(_that);case UserLoginPasswordState() when userLoginPassword != null:
return userLoginPassword(_that);case ShowUserPasswordState() when showUserPassword != null:
return showUserPassword(_that);case ButtonLoginVaildation() when buttonLoginVaildation != null:
return buttonLoginVaildation(_that);case LoginButtonLoadingData() when loading != null:
return loading(_that);case LoginButtonErrorData() when error != null:
return error(_that);case LoginButtonSuccessData() when suceess != null:
return suceess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String value)?  userLoginEmailAddress,TResult Function( String value)?  userLoginPassword,TResult Function( bool value)?  showUserPassword,TResult Function( bool value)?  buttonLoginVaildation,TResult Function()?  loading,TResult Function( ApiErrorModel apiErrorModel)?  error,TResult Function( AuthResponse data)?  suceess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UserLoginEmailAddressState() when userLoginEmailAddress != null:
return userLoginEmailAddress(_that.value);case UserLoginPasswordState() when userLoginPassword != null:
return userLoginPassword(_that.value);case ShowUserPasswordState() when showUserPassword != null:
return showUserPassword(_that.value);case ButtonLoginVaildation() when buttonLoginVaildation != null:
return buttonLoginVaildation(_that.value);case LoginButtonLoadingData() when loading != null:
return loading();case LoginButtonErrorData() when error != null:
return error(_that.apiErrorModel);case LoginButtonSuccessData() when suceess != null:
return suceess(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String value)  userLoginEmailAddress,required TResult Function( String value)  userLoginPassword,required TResult Function( bool value)  showUserPassword,required TResult Function( bool value)  buttonLoginVaildation,required TResult Function()  loading,required TResult Function( ApiErrorModel apiErrorModel)  error,required TResult Function( AuthResponse data)  suceess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case UserLoginEmailAddressState():
return userLoginEmailAddress(_that.value);case UserLoginPasswordState():
return userLoginPassword(_that.value);case ShowUserPasswordState():
return showUserPassword(_that.value);case ButtonLoginVaildation():
return buttonLoginVaildation(_that.value);case LoginButtonLoadingData():
return loading();case LoginButtonErrorData():
return error(_that.apiErrorModel);case LoginButtonSuccessData():
return suceess(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String value)?  userLoginEmailAddress,TResult? Function( String value)?  userLoginPassword,TResult? Function( bool value)?  showUserPassword,TResult? Function( bool value)?  buttonLoginVaildation,TResult? Function()?  loading,TResult? Function( ApiErrorModel apiErrorModel)?  error,TResult? Function( AuthResponse data)?  suceess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UserLoginEmailAddressState() when userLoginEmailAddress != null:
return userLoginEmailAddress(_that.value);case UserLoginPasswordState() when userLoginPassword != null:
return userLoginPassword(_that.value);case ShowUserPasswordState() when showUserPassword != null:
return showUserPassword(_that.value);case ButtonLoginVaildation() when buttonLoginVaildation != null:
return buttonLoginVaildation(_that.value);case LoginButtonLoadingData() when loading != null:
return loading();case LoginButtonErrorData() when error != null:
return error(_that.apiErrorModel);case LoginButtonSuccessData() when suceess != null:
return suceess(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LoginState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.initial()';
}


}




/// @nodoc


class UserLoginEmailAddressState implements LoginState {
  const UserLoginEmailAddressState(this.value);
  

 final  String value;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoginEmailAddressStateCopyWith<UserLoginEmailAddressState> get copyWith => _$UserLoginEmailAddressStateCopyWithImpl<UserLoginEmailAddressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoginEmailAddressState&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginState.userLoginEmailAddress(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserLoginEmailAddressStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $UserLoginEmailAddressStateCopyWith(UserLoginEmailAddressState value, $Res Function(UserLoginEmailAddressState) _then) = _$UserLoginEmailAddressStateCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserLoginEmailAddressStateCopyWithImpl<$Res>
    implements $UserLoginEmailAddressStateCopyWith<$Res> {
  _$UserLoginEmailAddressStateCopyWithImpl(this._self, this._then);

  final UserLoginEmailAddressState _self;
  final $Res Function(UserLoginEmailAddressState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserLoginEmailAddressState(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UserLoginPasswordState implements LoginState {
  const UserLoginPasswordState(this.value);
  

 final  String value;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLoginPasswordStateCopyWith<UserLoginPasswordState> get copyWith => _$UserLoginPasswordStateCopyWithImpl<UserLoginPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLoginPasswordState&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginState.userLoginPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $UserLoginPasswordStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $UserLoginPasswordStateCopyWith(UserLoginPasswordState value, $Res Function(UserLoginPasswordState) _then) = _$UserLoginPasswordStateCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$UserLoginPasswordStateCopyWithImpl<$Res>
    implements $UserLoginPasswordStateCopyWith<$Res> {
  _$UserLoginPasswordStateCopyWithImpl(this._self, this._then);

  final UserLoginPasswordState _self;
  final $Res Function(UserLoginPasswordState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(UserLoginPasswordState(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ShowUserPasswordState implements LoginState {
  const ShowUserPasswordState(this.value);
  

 final  bool value;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowUserPasswordStateCopyWith<ShowUserPasswordState> get copyWith => _$ShowUserPasswordStateCopyWithImpl<ShowUserPasswordState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowUserPasswordState&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginState.showUserPassword(value: $value)';
}


}

/// @nodoc
abstract mixin class $ShowUserPasswordStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $ShowUserPasswordStateCopyWith(ShowUserPasswordState value, $Res Function(ShowUserPasswordState) _then) = _$ShowUserPasswordStateCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$ShowUserPasswordStateCopyWithImpl<$Res>
    implements $ShowUserPasswordStateCopyWith<$Res> {
  _$ShowUserPasswordStateCopyWithImpl(this._self, this._then);

  final ShowUserPasswordState _self;
  final $Res Function(ShowUserPasswordState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ShowUserPasswordState(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ButtonLoginVaildation implements LoginState {
  const ButtonLoginVaildation(this.value);
  

 final  bool value;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ButtonLoginVaildationCopyWith<ButtonLoginVaildation> get copyWith => _$ButtonLoginVaildationCopyWithImpl<ButtonLoginVaildation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ButtonLoginVaildation&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginState.buttonLoginVaildation(value: $value)';
}


}

/// @nodoc
abstract mixin class $ButtonLoginVaildationCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $ButtonLoginVaildationCopyWith(ButtonLoginVaildation value, $Res Function(ButtonLoginVaildation) _then) = _$ButtonLoginVaildationCopyWithImpl;
@useResult
$Res call({
 bool value
});




}
/// @nodoc
class _$ButtonLoginVaildationCopyWithImpl<$Res>
    implements $ButtonLoginVaildationCopyWith<$Res> {
  _$ButtonLoginVaildationCopyWithImpl(this._self, this._then);

  final ButtonLoginVaildation _self;
  final $Res Function(ButtonLoginVaildation) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(ButtonLoginVaildation(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LoginButtonLoadingData implements LoginState {
  const LoginButtonLoadingData();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginButtonLoadingData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginState.loading()';
}


}




/// @nodoc


class LoginButtonErrorData implements LoginState {
  const LoginButtonErrorData(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginButtonErrorDataCopyWith<LoginButtonErrorData> get copyWith => _$LoginButtonErrorDataCopyWithImpl<LoginButtonErrorData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginButtonErrorData&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'LoginState.error(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $LoginButtonErrorDataCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginButtonErrorDataCopyWith(LoginButtonErrorData value, $Res Function(LoginButtonErrorData) _then) = _$LoginButtonErrorDataCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$LoginButtonErrorDataCopyWithImpl<$Res>
    implements $LoginButtonErrorDataCopyWith<$Res> {
  _$LoginButtonErrorDataCopyWithImpl(this._self, this._then);

  final LoginButtonErrorData _self;
  final $Res Function(LoginButtonErrorData) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(LoginButtonErrorData(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class LoginButtonSuccessData implements LoginState {
  const LoginButtonSuccessData(this.data);
  

 final  AuthResponse data;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginButtonSuccessDataCopyWith<LoginButtonSuccessData> get copyWith => _$LoginButtonSuccessDataCopyWithImpl<LoginButtonSuccessData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginButtonSuccessData&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'LoginState.suceess(data: $data)';
}


}

/// @nodoc
abstract mixin class $LoginButtonSuccessDataCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginButtonSuccessDataCopyWith(LoginButtonSuccessData value, $Res Function(LoginButtonSuccessData) _then) = _$LoginButtonSuccessDataCopyWithImpl;
@useResult
$Res call({
 AuthResponse data
});




}
/// @nodoc
class _$LoginButtonSuccessDataCopyWithImpl<$Res>
    implements $LoginButtonSuccessDataCopyWith<$Res> {
  _$LoginButtonSuccessDataCopyWithImpl(this._self, this._then);

  final LoginButtonSuccessData _self;
  final $Res Function(LoginButtonSuccessData) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(LoginButtonSuccessData(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AuthResponse,
  ));
}


}

// dart format on
