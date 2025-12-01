// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_with_google_and_apple_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthenticationWithGoogleAndAppleState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationWithGoogleAndAppleState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationWithGoogleAndAppleState()';
}


}

/// @nodoc
class $AuthenticationWithGoogleAndAppleStateCopyWith<$Res>  {
$AuthenticationWithGoogleAndAppleStateCopyWith(AuthenticationWithGoogleAndAppleState _, $Res Function(AuthenticationWithGoogleAndAppleState) __);
}


/// Adds pattern-matching-related methods to [AuthenticationWithGoogleAndAppleState].
extension AuthenticationWithGoogleAndAppleStatePatterns on AuthenticationWithGoogleAndAppleState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( AuthenticationWithGoogleLoading value)?  authenticationWithGoogleLoading,TResult Function( AuthenticationWithGoogleSuccess value)?  authenticationWithGoogleSuccess,TResult Function( AuthenticationWithGoogleError value)?  authenticationWithGoogleError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AuthenticationWithGoogleLoading() when authenticationWithGoogleLoading != null:
return authenticationWithGoogleLoading(_that);case AuthenticationWithGoogleSuccess() when authenticationWithGoogleSuccess != null:
return authenticationWithGoogleSuccess(_that);case AuthenticationWithGoogleError() when authenticationWithGoogleError != null:
return authenticationWithGoogleError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( AuthenticationWithGoogleLoading value)  authenticationWithGoogleLoading,required TResult Function( AuthenticationWithGoogleSuccess value)  authenticationWithGoogleSuccess,required TResult Function( AuthenticationWithGoogleError value)  authenticationWithGoogleError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case AuthenticationWithGoogleLoading():
return authenticationWithGoogleLoading(_that);case AuthenticationWithGoogleSuccess():
return authenticationWithGoogleSuccess(_that);case AuthenticationWithGoogleError():
return authenticationWithGoogleError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( AuthenticationWithGoogleLoading value)?  authenticationWithGoogleLoading,TResult? Function( AuthenticationWithGoogleSuccess value)?  authenticationWithGoogleSuccess,TResult? Function( AuthenticationWithGoogleError value)?  authenticationWithGoogleError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case AuthenticationWithGoogleLoading() when authenticationWithGoogleLoading != null:
return authenticationWithGoogleLoading(_that);case AuthenticationWithGoogleSuccess() when authenticationWithGoogleSuccess != null:
return authenticationWithGoogleSuccess(_that);case AuthenticationWithGoogleError() when authenticationWithGoogleError != null:
return authenticationWithGoogleError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  authenticationWithGoogleLoading,TResult Function( AuthResponse auth)?  authenticationWithGoogleSuccess,TResult Function( ApiErrorModel apiErrorModel)?  authenticationWithGoogleError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AuthenticationWithGoogleLoading() when authenticationWithGoogleLoading != null:
return authenticationWithGoogleLoading();case AuthenticationWithGoogleSuccess() when authenticationWithGoogleSuccess != null:
return authenticationWithGoogleSuccess(_that.auth);case AuthenticationWithGoogleError() when authenticationWithGoogleError != null:
return authenticationWithGoogleError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  authenticationWithGoogleLoading,required TResult Function( AuthResponse auth)  authenticationWithGoogleSuccess,required TResult Function( ApiErrorModel apiErrorModel)  authenticationWithGoogleError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case AuthenticationWithGoogleLoading():
return authenticationWithGoogleLoading();case AuthenticationWithGoogleSuccess():
return authenticationWithGoogleSuccess(_that.auth);case AuthenticationWithGoogleError():
return authenticationWithGoogleError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  authenticationWithGoogleLoading,TResult? Function( AuthResponse auth)?  authenticationWithGoogleSuccess,TResult? Function( ApiErrorModel apiErrorModel)?  authenticationWithGoogleError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case AuthenticationWithGoogleLoading() when authenticationWithGoogleLoading != null:
return authenticationWithGoogleLoading();case AuthenticationWithGoogleSuccess() when authenticationWithGoogleSuccess != null:
return authenticationWithGoogleSuccess(_that.auth);case AuthenticationWithGoogleError() when authenticationWithGoogleError != null:
return authenticationWithGoogleError(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AuthenticationWithGoogleAndAppleState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationWithGoogleAndAppleState.initial()';
}


}




/// @nodoc


class AuthenticationWithGoogleLoading implements AuthenticationWithGoogleAndAppleState {
  const AuthenticationWithGoogleLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationWithGoogleLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthenticationWithGoogleAndAppleState.authenticationWithGoogleLoading()';
}


}




/// @nodoc


class AuthenticationWithGoogleSuccess implements AuthenticationWithGoogleAndAppleState {
  const AuthenticationWithGoogleSuccess(this.auth);
  

 final  AuthResponse auth;

/// Create a copy of AuthenticationWithGoogleAndAppleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationWithGoogleSuccessCopyWith<AuthenticationWithGoogleSuccess> get copyWith => _$AuthenticationWithGoogleSuccessCopyWithImpl<AuthenticationWithGoogleSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationWithGoogleSuccess&&(identical(other.auth, auth) || other.auth == auth));
}


@override
int get hashCode => Object.hash(runtimeType,auth);

@override
String toString() {
  return 'AuthenticationWithGoogleAndAppleState.authenticationWithGoogleSuccess(auth: $auth)';
}


}

/// @nodoc
abstract mixin class $AuthenticationWithGoogleSuccessCopyWith<$Res> implements $AuthenticationWithGoogleAndAppleStateCopyWith<$Res> {
  factory $AuthenticationWithGoogleSuccessCopyWith(AuthenticationWithGoogleSuccess value, $Res Function(AuthenticationWithGoogleSuccess) _then) = _$AuthenticationWithGoogleSuccessCopyWithImpl;
@useResult
$Res call({
 AuthResponse auth
});




}
/// @nodoc
class _$AuthenticationWithGoogleSuccessCopyWithImpl<$Res>
    implements $AuthenticationWithGoogleSuccessCopyWith<$Res> {
  _$AuthenticationWithGoogleSuccessCopyWithImpl(this._self, this._then);

  final AuthenticationWithGoogleSuccess _self;
  final $Res Function(AuthenticationWithGoogleSuccess) _then;

/// Create a copy of AuthenticationWithGoogleAndAppleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? auth = null,}) {
  return _then(AuthenticationWithGoogleSuccess(
null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as AuthResponse,
  ));
}


}

/// @nodoc


class AuthenticationWithGoogleError implements AuthenticationWithGoogleAndAppleState {
  const AuthenticationWithGoogleError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of AuthenticationWithGoogleAndAppleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticationWithGoogleErrorCopyWith<AuthenticationWithGoogleError> get copyWith => _$AuthenticationWithGoogleErrorCopyWithImpl<AuthenticationWithGoogleError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticationWithGoogleError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'AuthenticationWithGoogleAndAppleState.authenticationWithGoogleError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $AuthenticationWithGoogleErrorCopyWith<$Res> implements $AuthenticationWithGoogleAndAppleStateCopyWith<$Res> {
  factory $AuthenticationWithGoogleErrorCopyWith(AuthenticationWithGoogleError value, $Res Function(AuthenticationWithGoogleError) _then) = _$AuthenticationWithGoogleErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$AuthenticationWithGoogleErrorCopyWithImpl<$Res>
    implements $AuthenticationWithGoogleErrorCopyWith<$Res> {
  _$AuthenticationWithGoogleErrorCopyWithImpl(this._self, this._then);

  final AuthenticationWithGoogleError _self;
  final $Res Function(AuthenticationWithGoogleError) _then;

/// Create a copy of AuthenticationWithGoogleAndAppleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(AuthenticationWithGoogleError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
