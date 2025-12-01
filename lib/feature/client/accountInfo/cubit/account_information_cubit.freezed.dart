// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_information_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountInformationState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountInformationState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountInformationState()';
}


}

/// @nodoc
class $AccountInformationStateCopyWith<$Res>  {
$AccountInformationStateCopyWith(AccountInformationState _, $Res Function(AccountInformationState) __);
}


/// Adds pattern-matching-related methods to [AccountInformationState].
extension AccountInformationStatePatterns on AccountInformationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( UpdateAccountInformationLoading value)?  updateAccountInformationLoading,TResult Function( UpdateAccountInformationError value)?  updateAccountInformationError,TResult Function( UpdateAccountInformationSuccess value)?  updateAccountInformationSuccess,TResult Function( GetStorageData value)?  getStorageData,TResult Function( ChangeEnablTextFormField value)?  changeEnablTextFormField,TResult Function( NoChangesDetected value)?  noChangesDetected,TResult Function( DeleteAccountLoading value)?  deleteAccountLoading,TResult Function( DeleteAccountError value)?  deleteAccountError,TResult Function( DeleteAccountSuccess value)?  deleteAccountSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UpdateAccountInformationLoading() when updateAccountInformationLoading != null:
return updateAccountInformationLoading(_that);case UpdateAccountInformationError() when updateAccountInformationError != null:
return updateAccountInformationError(_that);case UpdateAccountInformationSuccess() when updateAccountInformationSuccess != null:
return updateAccountInformationSuccess(_that);case GetStorageData() when getStorageData != null:
return getStorageData(_that);case ChangeEnablTextFormField() when changeEnablTextFormField != null:
return changeEnablTextFormField(_that);case NoChangesDetected() when noChangesDetected != null:
return noChangesDetected(_that);case DeleteAccountLoading() when deleteAccountLoading != null:
return deleteAccountLoading(_that);case DeleteAccountError() when deleteAccountError != null:
return deleteAccountError(_that);case DeleteAccountSuccess() when deleteAccountSuccess != null:
return deleteAccountSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( UpdateAccountInformationLoading value)  updateAccountInformationLoading,required TResult Function( UpdateAccountInformationError value)  updateAccountInformationError,required TResult Function( UpdateAccountInformationSuccess value)  updateAccountInformationSuccess,required TResult Function( GetStorageData value)  getStorageData,required TResult Function( ChangeEnablTextFormField value)  changeEnablTextFormField,required TResult Function( NoChangesDetected value)  noChangesDetected,required TResult Function( DeleteAccountLoading value)  deleteAccountLoading,required TResult Function( DeleteAccountError value)  deleteAccountError,required TResult Function( DeleteAccountSuccess value)  deleteAccountSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case UpdateAccountInformationLoading():
return updateAccountInformationLoading(_that);case UpdateAccountInformationError():
return updateAccountInformationError(_that);case UpdateAccountInformationSuccess():
return updateAccountInformationSuccess(_that);case GetStorageData():
return getStorageData(_that);case ChangeEnablTextFormField():
return changeEnablTextFormField(_that);case NoChangesDetected():
return noChangesDetected(_that);case DeleteAccountLoading():
return deleteAccountLoading(_that);case DeleteAccountError():
return deleteAccountError(_that);case DeleteAccountSuccess():
return deleteAccountSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( UpdateAccountInformationLoading value)?  updateAccountInformationLoading,TResult? Function( UpdateAccountInformationError value)?  updateAccountInformationError,TResult? Function( UpdateAccountInformationSuccess value)?  updateAccountInformationSuccess,TResult? Function( GetStorageData value)?  getStorageData,TResult? Function( ChangeEnablTextFormField value)?  changeEnablTextFormField,TResult? Function( NoChangesDetected value)?  noChangesDetected,TResult? Function( DeleteAccountLoading value)?  deleteAccountLoading,TResult? Function( DeleteAccountError value)?  deleteAccountError,TResult? Function( DeleteAccountSuccess value)?  deleteAccountSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case UpdateAccountInformationLoading() when updateAccountInformationLoading != null:
return updateAccountInformationLoading(_that);case UpdateAccountInformationError() when updateAccountInformationError != null:
return updateAccountInformationError(_that);case UpdateAccountInformationSuccess() when updateAccountInformationSuccess != null:
return updateAccountInformationSuccess(_that);case GetStorageData() when getStorageData != null:
return getStorageData(_that);case ChangeEnablTextFormField() when changeEnablTextFormField != null:
return changeEnablTextFormField(_that);case NoChangesDetected() when noChangesDetected != null:
return noChangesDetected(_that);case DeleteAccountLoading() when deleteAccountLoading != null:
return deleteAccountLoading(_that);case DeleteAccountError() when deleteAccountError != null:
return deleteAccountError(_that);case DeleteAccountSuccess() when deleteAccountSuccess != null:
return deleteAccountSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  updateAccountInformationLoading,TResult Function( ApiErrorModel apiErrorModel)?  updateAccountInformationError,TResult Function( UpdateAccountInformationResponse data)?  updateAccountInformationSuccess,TResult Function( String userEmail,  String userName,  String userPhone)?  getStorageData,TResult Function( bool enable)?  changeEnablTextFormField,TResult Function()?  noChangesDetected,TResult Function()?  deleteAccountLoading,TResult Function( ApiErrorModel apiErrorModel)?  deleteAccountError,TResult Function( ApiSuccessGeneralModel data)?  deleteAccountSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UpdateAccountInformationLoading() when updateAccountInformationLoading != null:
return updateAccountInformationLoading();case UpdateAccountInformationError() when updateAccountInformationError != null:
return updateAccountInformationError(_that.apiErrorModel);case UpdateAccountInformationSuccess() when updateAccountInformationSuccess != null:
return updateAccountInformationSuccess(_that.data);case GetStorageData() when getStorageData != null:
return getStorageData(_that.userEmail,_that.userName,_that.userPhone);case ChangeEnablTextFormField() when changeEnablTextFormField != null:
return changeEnablTextFormField(_that.enable);case NoChangesDetected() when noChangesDetected != null:
return noChangesDetected();case DeleteAccountLoading() when deleteAccountLoading != null:
return deleteAccountLoading();case DeleteAccountError() when deleteAccountError != null:
return deleteAccountError(_that.apiErrorModel);case DeleteAccountSuccess() when deleteAccountSuccess != null:
return deleteAccountSuccess(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  updateAccountInformationLoading,required TResult Function( ApiErrorModel apiErrorModel)  updateAccountInformationError,required TResult Function( UpdateAccountInformationResponse data)  updateAccountInformationSuccess,required TResult Function( String userEmail,  String userName,  String userPhone)  getStorageData,required TResult Function( bool enable)  changeEnablTextFormField,required TResult Function()  noChangesDetected,required TResult Function()  deleteAccountLoading,required TResult Function( ApiErrorModel apiErrorModel)  deleteAccountError,required TResult Function( ApiSuccessGeneralModel data)  deleteAccountSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case UpdateAccountInformationLoading():
return updateAccountInformationLoading();case UpdateAccountInformationError():
return updateAccountInformationError(_that.apiErrorModel);case UpdateAccountInformationSuccess():
return updateAccountInformationSuccess(_that.data);case GetStorageData():
return getStorageData(_that.userEmail,_that.userName,_that.userPhone);case ChangeEnablTextFormField():
return changeEnablTextFormField(_that.enable);case NoChangesDetected():
return noChangesDetected();case DeleteAccountLoading():
return deleteAccountLoading();case DeleteAccountError():
return deleteAccountError(_that.apiErrorModel);case DeleteAccountSuccess():
return deleteAccountSuccess(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  updateAccountInformationLoading,TResult? Function( ApiErrorModel apiErrorModel)?  updateAccountInformationError,TResult? Function( UpdateAccountInformationResponse data)?  updateAccountInformationSuccess,TResult? Function( String userEmail,  String userName,  String userPhone)?  getStorageData,TResult? Function( bool enable)?  changeEnablTextFormField,TResult? Function()?  noChangesDetected,TResult? Function()?  deleteAccountLoading,TResult? Function( ApiErrorModel apiErrorModel)?  deleteAccountError,TResult? Function( ApiSuccessGeneralModel data)?  deleteAccountSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case UpdateAccountInformationLoading() when updateAccountInformationLoading != null:
return updateAccountInformationLoading();case UpdateAccountInformationError() when updateAccountInformationError != null:
return updateAccountInformationError(_that.apiErrorModel);case UpdateAccountInformationSuccess() when updateAccountInformationSuccess != null:
return updateAccountInformationSuccess(_that.data);case GetStorageData() when getStorageData != null:
return getStorageData(_that.userEmail,_that.userName,_that.userPhone);case ChangeEnablTextFormField() when changeEnablTextFormField != null:
return changeEnablTextFormField(_that.enable);case NoChangesDetected() when noChangesDetected != null:
return noChangesDetected();case DeleteAccountLoading() when deleteAccountLoading != null:
return deleteAccountLoading();case DeleteAccountError() when deleteAccountError != null:
return deleteAccountError(_that.apiErrorModel);case DeleteAccountSuccess() when deleteAccountSuccess != null:
return deleteAccountSuccess(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AccountInformationState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountInformationState.initial()';
}


}




/// @nodoc


class UpdateAccountInformationLoading implements AccountInformationState {
  const UpdateAccountInformationLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountInformationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountInformationState.updateAccountInformationLoading()';
}


}




/// @nodoc


class UpdateAccountInformationError implements AccountInformationState {
  const UpdateAccountInformationError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAccountInformationErrorCopyWith<UpdateAccountInformationError> get copyWith => _$UpdateAccountInformationErrorCopyWithImpl<UpdateAccountInformationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountInformationError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'AccountInformationState.updateAccountInformationError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $UpdateAccountInformationErrorCopyWith<$Res> implements $AccountInformationStateCopyWith<$Res> {
  factory $UpdateAccountInformationErrorCopyWith(UpdateAccountInformationError value, $Res Function(UpdateAccountInformationError) _then) = _$UpdateAccountInformationErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$UpdateAccountInformationErrorCopyWithImpl<$Res>
    implements $UpdateAccountInformationErrorCopyWith<$Res> {
  _$UpdateAccountInformationErrorCopyWithImpl(this._self, this._then);

  final UpdateAccountInformationError _self;
  final $Res Function(UpdateAccountInformationError) _then;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(UpdateAccountInformationError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class UpdateAccountInformationSuccess implements AccountInformationState {
  const UpdateAccountInformationSuccess(this.data);
  

 final  UpdateAccountInformationResponse data;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAccountInformationSuccessCopyWith<UpdateAccountInformationSuccess> get copyWith => _$UpdateAccountInformationSuccessCopyWithImpl<UpdateAccountInformationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAccountInformationSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AccountInformationState.updateAccountInformationSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateAccountInformationSuccessCopyWith<$Res> implements $AccountInformationStateCopyWith<$Res> {
  factory $UpdateAccountInformationSuccessCopyWith(UpdateAccountInformationSuccess value, $Res Function(UpdateAccountInformationSuccess) _then) = _$UpdateAccountInformationSuccessCopyWithImpl;
@useResult
$Res call({
 UpdateAccountInformationResponse data
});




}
/// @nodoc
class _$UpdateAccountInformationSuccessCopyWithImpl<$Res>
    implements $UpdateAccountInformationSuccessCopyWith<$Res> {
  _$UpdateAccountInformationSuccessCopyWithImpl(this._self, this._then);

  final UpdateAccountInformationSuccess _self;
  final $Res Function(UpdateAccountInformationSuccess) _then;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateAccountInformationSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UpdateAccountInformationResponse,
  ));
}


}

/// @nodoc


class GetStorageData implements AccountInformationState {
  const GetStorageData(this.userEmail, this.userName, this.userPhone);
  

 final  String userEmail;
 final  String userName;
 final  String userPhone;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetStorageDataCopyWith<GetStorageData> get copyWith => _$GetStorageDataCopyWithImpl<GetStorageData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetStorageData&&(identical(other.userEmail, userEmail) || other.userEmail == userEmail)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.userPhone, userPhone) || other.userPhone == userPhone));
}


@override
int get hashCode => Object.hash(runtimeType,userEmail,userName,userPhone);

@override
String toString() {
  return 'AccountInformationState.getStorageData(userEmail: $userEmail, userName: $userName, userPhone: $userPhone)';
}


}

/// @nodoc
abstract mixin class $GetStorageDataCopyWith<$Res> implements $AccountInformationStateCopyWith<$Res> {
  factory $GetStorageDataCopyWith(GetStorageData value, $Res Function(GetStorageData) _then) = _$GetStorageDataCopyWithImpl;
@useResult
$Res call({
 String userEmail, String userName, String userPhone
});




}
/// @nodoc
class _$GetStorageDataCopyWithImpl<$Res>
    implements $GetStorageDataCopyWith<$Res> {
  _$GetStorageDataCopyWithImpl(this._self, this._then);

  final GetStorageData _self;
  final $Res Function(GetStorageData) _then;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userEmail = null,Object? userName = null,Object? userPhone = null,}) {
  return _then(GetStorageData(
null == userEmail ? _self.userEmail : userEmail // ignore: cast_nullable_to_non_nullable
as String,null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,null == userPhone ? _self.userPhone : userPhone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ChangeEnablTextFormField implements AccountInformationState {
  const ChangeEnablTextFormField(this.enable);
  

 final  bool enable;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeEnablTextFormFieldCopyWith<ChangeEnablTextFormField> get copyWith => _$ChangeEnablTextFormFieldCopyWithImpl<ChangeEnablTextFormField>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeEnablTextFormField&&(identical(other.enable, enable) || other.enable == enable));
}


@override
int get hashCode => Object.hash(runtimeType,enable);

@override
String toString() {
  return 'AccountInformationState.changeEnablTextFormField(enable: $enable)';
}


}

/// @nodoc
abstract mixin class $ChangeEnablTextFormFieldCopyWith<$Res> implements $AccountInformationStateCopyWith<$Res> {
  factory $ChangeEnablTextFormFieldCopyWith(ChangeEnablTextFormField value, $Res Function(ChangeEnablTextFormField) _then) = _$ChangeEnablTextFormFieldCopyWithImpl;
@useResult
$Res call({
 bool enable
});




}
/// @nodoc
class _$ChangeEnablTextFormFieldCopyWithImpl<$Res>
    implements $ChangeEnablTextFormFieldCopyWith<$Res> {
  _$ChangeEnablTextFormFieldCopyWithImpl(this._self, this._then);

  final ChangeEnablTextFormField _self;
  final $Res Function(ChangeEnablTextFormField) _then;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? enable = null,}) {
  return _then(ChangeEnablTextFormField(
null == enable ? _self.enable : enable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class NoChangesDetected implements AccountInformationState {
  const NoChangesDetected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoChangesDetected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountInformationState.noChangesDetected()';
}


}




/// @nodoc


class DeleteAccountLoading implements AccountInformationState {
  const DeleteAccountLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAccountLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountInformationState.deleteAccountLoading()';
}


}




/// @nodoc


class DeleteAccountError implements AccountInformationState {
  const DeleteAccountError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAccountErrorCopyWith<DeleteAccountError> get copyWith => _$DeleteAccountErrorCopyWithImpl<DeleteAccountError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAccountError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'AccountInformationState.deleteAccountError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $DeleteAccountErrorCopyWith<$Res> implements $AccountInformationStateCopyWith<$Res> {
  factory $DeleteAccountErrorCopyWith(DeleteAccountError value, $Res Function(DeleteAccountError) _then) = _$DeleteAccountErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$DeleteAccountErrorCopyWithImpl<$Res>
    implements $DeleteAccountErrorCopyWith<$Res> {
  _$DeleteAccountErrorCopyWithImpl(this._self, this._then);

  final DeleteAccountError _self;
  final $Res Function(DeleteAccountError) _then;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(DeleteAccountError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class DeleteAccountSuccess implements AccountInformationState {
  const DeleteAccountSuccess(this.data);
  

 final  ApiSuccessGeneralModel data;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteAccountSuccessCopyWith<DeleteAccountSuccess> get copyWith => _$DeleteAccountSuccessCopyWithImpl<DeleteAccountSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteAccountSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AccountInformationState.deleteAccountSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $DeleteAccountSuccessCopyWith<$Res> implements $AccountInformationStateCopyWith<$Res> {
  factory $DeleteAccountSuccessCopyWith(DeleteAccountSuccess value, $Res Function(DeleteAccountSuccess) _then) = _$DeleteAccountSuccessCopyWithImpl;
@useResult
$Res call({
 ApiSuccessGeneralModel data
});




}
/// @nodoc
class _$DeleteAccountSuccessCopyWithImpl<$Res>
    implements $DeleteAccountSuccessCopyWith<$Res> {
  _$DeleteAccountSuccessCopyWithImpl(this._self, this._then);

  final DeleteAccountSuccess _self;
  final $Res Function(DeleteAccountSuccess) _then;

/// Create a copy of AccountInformationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(DeleteAccountSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ApiSuccessGeneralModel,
  ));
}


}

// dart format on
