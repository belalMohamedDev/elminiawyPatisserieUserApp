// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_out_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LogOutState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogOutState()';
}


}

/// @nodoc
class $LogOutStateCopyWith<$Res>  {
$LogOutStateCopyWith(LogOutState _, $Res Function(LogOutState) __);
}


/// Adds pattern-matching-related methods to [LogOutState].
extension LogOutStatePatterns on LogOutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( LogOutLoading value)?  logOutLoading,TResult Function( LogOutError value)?  logOutError,TResult Function( LogOutSuccess value)?  logOutSuccess,TResult Function( GetUserNameStorageData value)?  getStorageData,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LogOutLoading() when logOutLoading != null:
return logOutLoading(_that);case LogOutError() when logOutError != null:
return logOutError(_that);case LogOutSuccess() when logOutSuccess != null:
return logOutSuccess(_that);case GetUserNameStorageData() when getStorageData != null:
return getStorageData(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( LogOutLoading value)  logOutLoading,required TResult Function( LogOutError value)  logOutError,required TResult Function( LogOutSuccess value)  logOutSuccess,required TResult Function( GetUserNameStorageData value)  getStorageData,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case LogOutLoading():
return logOutLoading(_that);case LogOutError():
return logOutError(_that);case LogOutSuccess():
return logOutSuccess(_that);case GetUserNameStorageData():
return getStorageData(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( LogOutLoading value)?  logOutLoading,TResult? Function( LogOutError value)?  logOutError,TResult? Function( LogOutSuccess value)?  logOutSuccess,TResult? Function( GetUserNameStorageData value)?  getStorageData,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case LogOutLoading() when logOutLoading != null:
return logOutLoading(_that);case LogOutError() when logOutError != null:
return logOutError(_that);case LogOutSuccess() when logOutSuccess != null:
return logOutSuccess(_that);case GetUserNameStorageData() when getStorageData != null:
return getStorageData(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  logOutLoading,TResult Function( ApiErrorModel apiErrorModel)?  logOutError,TResult Function( String successMessage)?  logOutSuccess,TResult Function( String userName)?  getStorageData,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LogOutLoading() when logOutLoading != null:
return logOutLoading();case LogOutError() when logOutError != null:
return logOutError(_that.apiErrorModel);case LogOutSuccess() when logOutSuccess != null:
return logOutSuccess(_that.successMessage);case GetUserNameStorageData() when getStorageData != null:
return getStorageData(_that.userName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  logOutLoading,required TResult Function( ApiErrorModel apiErrorModel)  logOutError,required TResult Function( String successMessage)  logOutSuccess,required TResult Function( String userName)  getStorageData,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case LogOutLoading():
return logOutLoading();case LogOutError():
return logOutError(_that.apiErrorModel);case LogOutSuccess():
return logOutSuccess(_that.successMessage);case GetUserNameStorageData():
return getStorageData(_that.userName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  logOutLoading,TResult? Function( ApiErrorModel apiErrorModel)?  logOutError,TResult? Function( String successMessage)?  logOutSuccess,TResult? Function( String userName)?  getStorageData,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case LogOutLoading() when logOutLoading != null:
return logOutLoading();case LogOutError() when logOutError != null:
return logOutError(_that.apiErrorModel);case LogOutSuccess() when logOutSuccess != null:
return logOutSuccess(_that.successMessage);case GetUserNameStorageData() when getStorageData != null:
return getStorageData(_that.userName);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements LogOutState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogOutState.initial()';
}


}




/// @nodoc


class LogOutLoading implements LogOutState {
  const LogOutLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOutLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LogOutState.logOutLoading()';
}


}




/// @nodoc


class LogOutError implements LogOutState {
  const LogOutError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of LogOutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogOutErrorCopyWith<LogOutError> get copyWith => _$LogOutErrorCopyWithImpl<LogOutError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOutError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'LogOutState.logOutError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $LogOutErrorCopyWith<$Res> implements $LogOutStateCopyWith<$Res> {
  factory $LogOutErrorCopyWith(LogOutError value, $Res Function(LogOutError) _then) = _$LogOutErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$LogOutErrorCopyWithImpl<$Res>
    implements $LogOutErrorCopyWith<$Res> {
  _$LogOutErrorCopyWithImpl(this._self, this._then);

  final LogOutError _self;
  final $Res Function(LogOutError) _then;

/// Create a copy of LogOutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(LogOutError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class LogOutSuccess implements LogOutState {
  const LogOutSuccess({required this.successMessage});
  

 final  String successMessage;

/// Create a copy of LogOutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogOutSuccessCopyWith<LogOutSuccess> get copyWith => _$LogOutSuccessCopyWithImpl<LogOutSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogOutSuccess&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,successMessage);

@override
String toString() {
  return 'LogOutState.logOutSuccess(successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $LogOutSuccessCopyWith<$Res> implements $LogOutStateCopyWith<$Res> {
  factory $LogOutSuccessCopyWith(LogOutSuccess value, $Res Function(LogOutSuccess) _then) = _$LogOutSuccessCopyWithImpl;
@useResult
$Res call({
 String successMessage
});




}
/// @nodoc
class _$LogOutSuccessCopyWithImpl<$Res>
    implements $LogOutSuccessCopyWith<$Res> {
  _$LogOutSuccessCopyWithImpl(this._self, this._then);

  final LogOutSuccess _self;
  final $Res Function(LogOutSuccess) _then;

/// Create a copy of LogOutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? successMessage = null,}) {
  return _then(LogOutSuccess(
successMessage: null == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GetUserNameStorageData implements LogOutState {
  const GetUserNameStorageData(this.userName);
  

 final  String userName;

/// Create a copy of LogOutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetUserNameStorageDataCopyWith<GetUserNameStorageData> get copyWith => _$GetUserNameStorageDataCopyWithImpl<GetUserNameStorageData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetUserNameStorageData&&(identical(other.userName, userName) || other.userName == userName));
}


@override
int get hashCode => Object.hash(runtimeType,userName);

@override
String toString() {
  return 'LogOutState.getStorageData(userName: $userName)';
}


}

/// @nodoc
abstract mixin class $GetUserNameStorageDataCopyWith<$Res> implements $LogOutStateCopyWith<$Res> {
  factory $GetUserNameStorageDataCopyWith(GetUserNameStorageData value, $Res Function(GetUserNameStorageData) _then) = _$GetUserNameStorageDataCopyWithImpl;
@useResult
$Res call({
 String userName
});




}
/// @nodoc
class _$GetUserNameStorageDataCopyWithImpl<$Res>
    implements $GetUserNameStorageDataCopyWith<$Res> {
  _$GetUserNameStorageDataCopyWithImpl(this._self, this._then);

  final GetUserNameStorageData _self;
  final $Res Function(GetUserNameStorageData) _then;

/// Create a copy of LogOutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userName = null,}) {
  return _then(GetUserNameStorageData(
null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
