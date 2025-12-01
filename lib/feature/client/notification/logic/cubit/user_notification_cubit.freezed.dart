// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserNotificationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserNotificationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserNotificationState()';
}


}

/// @nodoc
class $UserNotificationStateCopyWith<$Res>  {
$UserNotificationStateCopyWith(UserNotificationState _, $Res Function(UserNotificationState) __);
}


/// Adds pattern-matching-related methods to [UserNotificationState].
extension UserNotificationStatePatterns on UserNotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( UserNotificationLoading value)?  userNotificationLoading,TResult Function( UserNotificationLoaded value)?  userNotificationLoaded,TResult Function( UserNotificationError value)?  userNotificationError,TResult Function( DeleteUserNotificationLoaded value)?  deleteUserNotificationLoaded,TResult Function( DeleteUserNotificationLoading value)?  deleteUserNotificationLoading,TResult Function( DeleteUserNotificationError value)?  deleteUserNotificationError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UserNotificationLoading() when userNotificationLoading != null:
return userNotificationLoading(_that);case UserNotificationLoaded() when userNotificationLoaded != null:
return userNotificationLoaded(_that);case UserNotificationError() when userNotificationError != null:
return userNotificationError(_that);case DeleteUserNotificationLoaded() when deleteUserNotificationLoaded != null:
return deleteUserNotificationLoaded(_that);case DeleteUserNotificationLoading() when deleteUserNotificationLoading != null:
return deleteUserNotificationLoading(_that);case DeleteUserNotificationError() when deleteUserNotificationError != null:
return deleteUserNotificationError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( UserNotificationLoading value)  userNotificationLoading,required TResult Function( UserNotificationLoaded value)  userNotificationLoaded,required TResult Function( UserNotificationError value)  userNotificationError,required TResult Function( DeleteUserNotificationLoaded value)  deleteUserNotificationLoaded,required TResult Function( DeleteUserNotificationLoading value)  deleteUserNotificationLoading,required TResult Function( DeleteUserNotificationError value)  deleteUserNotificationError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case UserNotificationLoading():
return userNotificationLoading(_that);case UserNotificationLoaded():
return userNotificationLoaded(_that);case UserNotificationError():
return userNotificationError(_that);case DeleteUserNotificationLoaded():
return deleteUserNotificationLoaded(_that);case DeleteUserNotificationLoading():
return deleteUserNotificationLoading(_that);case DeleteUserNotificationError():
return deleteUserNotificationError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( UserNotificationLoading value)?  userNotificationLoading,TResult? Function( UserNotificationLoaded value)?  userNotificationLoaded,TResult? Function( UserNotificationError value)?  userNotificationError,TResult? Function( DeleteUserNotificationLoaded value)?  deleteUserNotificationLoaded,TResult? Function( DeleteUserNotificationLoading value)?  deleteUserNotificationLoading,TResult? Function( DeleteUserNotificationError value)?  deleteUserNotificationError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UserNotificationLoading() when userNotificationLoading != null:
return userNotificationLoading(_that);case UserNotificationLoaded() when userNotificationLoaded != null:
return userNotificationLoaded(_that);case UserNotificationError() when userNotificationError != null:
return userNotificationError(_that);case DeleteUserNotificationLoaded() when deleteUserNotificationLoaded != null:
return deleteUserNotificationLoaded(_that);case DeleteUserNotificationLoading() when deleteUserNotificationLoading != null:
return deleteUserNotificationLoading(_that);case DeleteUserNotificationError() when deleteUserNotificationError != null:
return deleteUserNotificationError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  userNotificationLoading,TResult Function( UserNotificationResponse userNotificationResponse)?  userNotificationLoaded,TResult Function( ApiErrorModel apiErrorModel)?  userNotificationError,TResult Function( UserNotificationResponse userNotificationResponse)?  deleteUserNotificationLoaded,TResult Function()?  deleteUserNotificationLoading,TResult Function( ApiErrorModel apiErrorModel)?  deleteUserNotificationError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UserNotificationLoading() when userNotificationLoading != null:
return userNotificationLoading();case UserNotificationLoaded() when userNotificationLoaded != null:
return userNotificationLoaded(_that.userNotificationResponse);case UserNotificationError() when userNotificationError != null:
return userNotificationError(_that.apiErrorModel);case DeleteUserNotificationLoaded() when deleteUserNotificationLoaded != null:
return deleteUserNotificationLoaded(_that.userNotificationResponse);case DeleteUserNotificationLoading() when deleteUserNotificationLoading != null:
return deleteUserNotificationLoading();case DeleteUserNotificationError() when deleteUserNotificationError != null:
return deleteUserNotificationError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  userNotificationLoading,required TResult Function( UserNotificationResponse userNotificationResponse)  userNotificationLoaded,required TResult Function( ApiErrorModel apiErrorModel)  userNotificationError,required TResult Function( UserNotificationResponse userNotificationResponse)  deleteUserNotificationLoaded,required TResult Function()  deleteUserNotificationLoading,required TResult Function( ApiErrorModel apiErrorModel)  deleteUserNotificationError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case UserNotificationLoading():
return userNotificationLoading();case UserNotificationLoaded():
return userNotificationLoaded(_that.userNotificationResponse);case UserNotificationError():
return userNotificationError(_that.apiErrorModel);case DeleteUserNotificationLoaded():
return deleteUserNotificationLoaded(_that.userNotificationResponse);case DeleteUserNotificationLoading():
return deleteUserNotificationLoading();case DeleteUserNotificationError():
return deleteUserNotificationError(_that.apiErrorModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  userNotificationLoading,TResult? Function( UserNotificationResponse userNotificationResponse)?  userNotificationLoaded,TResult? Function( ApiErrorModel apiErrorModel)?  userNotificationError,TResult? Function( UserNotificationResponse userNotificationResponse)?  deleteUserNotificationLoaded,TResult? Function()?  deleteUserNotificationLoading,TResult? Function( ApiErrorModel apiErrorModel)?  deleteUserNotificationError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UserNotificationLoading() when userNotificationLoading != null:
return userNotificationLoading();case UserNotificationLoaded() when userNotificationLoaded != null:
return userNotificationLoaded(_that.userNotificationResponse);case UserNotificationError() when userNotificationError != null:
return userNotificationError(_that.apiErrorModel);case DeleteUserNotificationLoaded() when deleteUserNotificationLoaded != null:
return deleteUserNotificationLoaded(_that.userNotificationResponse);case DeleteUserNotificationLoading() when deleteUserNotificationLoading != null:
return deleteUserNotificationLoading();case DeleteUserNotificationError() when deleteUserNotificationError != null:
return deleteUserNotificationError(_that.apiErrorModel);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UserNotificationState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserNotificationState.initial()';
}


}




/// @nodoc


class UserNotificationLoading implements UserNotificationState {
  const UserNotificationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserNotificationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserNotificationState.userNotificationLoading()';
}


}




/// @nodoc


class UserNotificationLoaded implements UserNotificationState {
  const UserNotificationLoaded(this.userNotificationResponse);
  

 final  UserNotificationResponse userNotificationResponse;

/// Create a copy of UserNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserNotificationLoadedCopyWith<UserNotificationLoaded> get copyWith => _$UserNotificationLoadedCopyWithImpl<UserNotificationLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserNotificationLoaded&&(identical(other.userNotificationResponse, userNotificationResponse) || other.userNotificationResponse == userNotificationResponse));
}


@override
int get hashCode => Object.hash(runtimeType,userNotificationResponse);

@override
String toString() {
  return 'UserNotificationState.userNotificationLoaded(userNotificationResponse: $userNotificationResponse)';
}


}

/// @nodoc
abstract mixin class $UserNotificationLoadedCopyWith<$Res> implements $UserNotificationStateCopyWith<$Res> {
  factory $UserNotificationLoadedCopyWith(UserNotificationLoaded value, $Res Function(UserNotificationLoaded) _then) = _$UserNotificationLoadedCopyWithImpl;
@useResult
$Res call({
 UserNotificationResponse userNotificationResponse
});




}
/// @nodoc
class _$UserNotificationLoadedCopyWithImpl<$Res>
    implements $UserNotificationLoadedCopyWith<$Res> {
  _$UserNotificationLoadedCopyWithImpl(this._self, this._then);

  final UserNotificationLoaded _self;
  final $Res Function(UserNotificationLoaded) _then;

/// Create a copy of UserNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userNotificationResponse = null,}) {
  return _then(UserNotificationLoaded(
null == userNotificationResponse ? _self.userNotificationResponse : userNotificationResponse // ignore: cast_nullable_to_non_nullable
as UserNotificationResponse,
  ));
}


}

/// @nodoc


class UserNotificationError implements UserNotificationState {
  const UserNotificationError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of UserNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserNotificationErrorCopyWith<UserNotificationError> get copyWith => _$UserNotificationErrorCopyWithImpl<UserNotificationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserNotificationError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'UserNotificationState.userNotificationError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $UserNotificationErrorCopyWith<$Res> implements $UserNotificationStateCopyWith<$Res> {
  factory $UserNotificationErrorCopyWith(UserNotificationError value, $Res Function(UserNotificationError) _then) = _$UserNotificationErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$UserNotificationErrorCopyWithImpl<$Res>
    implements $UserNotificationErrorCopyWith<$Res> {
  _$UserNotificationErrorCopyWithImpl(this._self, this._then);

  final UserNotificationError _self;
  final $Res Function(UserNotificationError) _then;

/// Create a copy of UserNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(UserNotificationError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class DeleteUserNotificationLoaded implements UserNotificationState {
  const DeleteUserNotificationLoaded(this.userNotificationResponse);
  

 final  UserNotificationResponse userNotificationResponse;

/// Create a copy of UserNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteUserNotificationLoadedCopyWith<DeleteUserNotificationLoaded> get copyWith => _$DeleteUserNotificationLoadedCopyWithImpl<DeleteUserNotificationLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUserNotificationLoaded&&(identical(other.userNotificationResponse, userNotificationResponse) || other.userNotificationResponse == userNotificationResponse));
}


@override
int get hashCode => Object.hash(runtimeType,userNotificationResponse);

@override
String toString() {
  return 'UserNotificationState.deleteUserNotificationLoaded(userNotificationResponse: $userNotificationResponse)';
}


}

/// @nodoc
abstract mixin class $DeleteUserNotificationLoadedCopyWith<$Res> implements $UserNotificationStateCopyWith<$Res> {
  factory $DeleteUserNotificationLoadedCopyWith(DeleteUserNotificationLoaded value, $Res Function(DeleteUserNotificationLoaded) _then) = _$DeleteUserNotificationLoadedCopyWithImpl;
@useResult
$Res call({
 UserNotificationResponse userNotificationResponse
});




}
/// @nodoc
class _$DeleteUserNotificationLoadedCopyWithImpl<$Res>
    implements $DeleteUserNotificationLoadedCopyWith<$Res> {
  _$DeleteUserNotificationLoadedCopyWithImpl(this._self, this._then);

  final DeleteUserNotificationLoaded _self;
  final $Res Function(DeleteUserNotificationLoaded) _then;

/// Create a copy of UserNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userNotificationResponse = null,}) {
  return _then(DeleteUserNotificationLoaded(
null == userNotificationResponse ? _self.userNotificationResponse : userNotificationResponse // ignore: cast_nullable_to_non_nullable
as UserNotificationResponse,
  ));
}


}

/// @nodoc


class DeleteUserNotificationLoading implements UserNotificationState {
  const DeleteUserNotificationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUserNotificationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserNotificationState.deleteUserNotificationLoading()';
}


}




/// @nodoc


class DeleteUserNotificationError implements UserNotificationState {
  const DeleteUserNotificationError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of UserNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteUserNotificationErrorCopyWith<DeleteUserNotificationError> get copyWith => _$DeleteUserNotificationErrorCopyWithImpl<DeleteUserNotificationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteUserNotificationError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'UserNotificationState.deleteUserNotificationError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $DeleteUserNotificationErrorCopyWith<$Res> implements $UserNotificationStateCopyWith<$Res> {
  factory $DeleteUserNotificationErrorCopyWith(DeleteUserNotificationError value, $Res Function(DeleteUserNotificationError) _then) = _$DeleteUserNotificationErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$DeleteUserNotificationErrorCopyWithImpl<$Res>
    implements $DeleteUserNotificationErrorCopyWith<$Res> {
  _$DeleteUserNotificationErrorCopyWithImpl(this._self, this._then);

  final DeleteUserNotificationError _self;
  final $Res Function(DeleteUserNotificationError) _then;

/// Create a copy of UserNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(DeleteUserNotificationError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on
