// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState()';
}


}

/// @nodoc
class $CategoryStateCopyWith<$Res>  {
$CategoryStateCopyWith(CategoryState _, $Res Function(CategoryState) __);
}


/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetCategoriesLoading value)?  getCategoriesLoading,TResult Function( GetCategoriesError value)?  getCategoriesError,TResult Function( GetCategoriesSuccess value)?  getCategoriesSuccess,TResult Function( UpdateCategoriesLoading value)?  updateCategoriesLoading,TResult Function( UpdateCategoriesError value)?  updateCategoriesError,TResult Function( UpdateCategoriesSuccess value)?  updateCategoriesSuccess,TResult Function( CreateCategoriesLoading value)?  createCategoriesLoading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading(_that);case GetCategoriesError() when getCategoriesError != null:
return getCategoriesError(_that);case GetCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that);case UpdateCategoriesLoading() when updateCategoriesLoading != null:
return updateCategoriesLoading(_that);case UpdateCategoriesError() when updateCategoriesError != null:
return updateCategoriesError(_that);case UpdateCategoriesSuccess() when updateCategoriesSuccess != null:
return updateCategoriesSuccess(_that);case CreateCategoriesLoading() when createCategoriesLoading != null:
return createCategoriesLoading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetCategoriesLoading value)  getCategoriesLoading,required TResult Function( GetCategoriesError value)  getCategoriesError,required TResult Function( GetCategoriesSuccess value)  getCategoriesSuccess,required TResult Function( UpdateCategoriesLoading value)  updateCategoriesLoading,required TResult Function( UpdateCategoriesError value)  updateCategoriesError,required TResult Function( UpdateCategoriesSuccess value)  updateCategoriesSuccess,required TResult Function( CreateCategoriesLoading value)  createCategoriesLoading,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetCategoriesLoading():
return getCategoriesLoading(_that);case GetCategoriesError():
return getCategoriesError(_that);case GetCategoriesSuccess():
return getCategoriesSuccess(_that);case UpdateCategoriesLoading():
return updateCategoriesLoading(_that);case UpdateCategoriesError():
return updateCategoriesError(_that);case UpdateCategoriesSuccess():
return updateCategoriesSuccess(_that);case CreateCategoriesLoading():
return createCategoriesLoading(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetCategoriesLoading value)?  getCategoriesLoading,TResult? Function( GetCategoriesError value)?  getCategoriesError,TResult? Function( GetCategoriesSuccess value)?  getCategoriesSuccess,TResult? Function( UpdateCategoriesLoading value)?  updateCategoriesLoading,TResult? Function( UpdateCategoriesError value)?  updateCategoriesError,TResult? Function( UpdateCategoriesSuccess value)?  updateCategoriesSuccess,TResult? Function( CreateCategoriesLoading value)?  createCategoriesLoading,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading(_that);case GetCategoriesError() when getCategoriesError != null:
return getCategoriesError(_that);case GetCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that);case UpdateCategoriesLoading() when updateCategoriesLoading != null:
return updateCategoriesLoading(_that);case UpdateCategoriesError() when updateCategoriesError != null:
return updateCategoriesError(_that);case UpdateCategoriesSuccess() when updateCategoriesSuccess != null:
return updateCategoriesSuccess(_that);case CreateCategoriesLoading() when createCategoriesLoading != null:
return createCategoriesLoading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getCategoriesLoading,TResult Function( ApiErrorModel apiErrorModel)?  getCategoriesError,TResult Function( List<CategoryResponseData> data)?  getCategoriesSuccess,TResult Function( String id)?  updateCategoriesLoading,TResult Function( ApiErrorModel apiErrorModel)?  updateCategoriesError,TResult Function( List<CategoryResponseData> data)?  updateCategoriesSuccess,TResult Function()?  createCategoriesLoading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading();case GetCategoriesError() when getCategoriesError != null:
return getCategoriesError(_that.apiErrorModel);case GetCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that.data);case UpdateCategoriesLoading() when updateCategoriesLoading != null:
return updateCategoriesLoading(_that.id);case UpdateCategoriesError() when updateCategoriesError != null:
return updateCategoriesError(_that.apiErrorModel);case UpdateCategoriesSuccess() when updateCategoriesSuccess != null:
return updateCategoriesSuccess(_that.data);case CreateCategoriesLoading() when createCategoriesLoading != null:
return createCategoriesLoading();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getCategoriesLoading,required TResult Function( ApiErrorModel apiErrorModel)  getCategoriesError,required TResult Function( List<CategoryResponseData> data)  getCategoriesSuccess,required TResult Function( String id)  updateCategoriesLoading,required TResult Function( ApiErrorModel apiErrorModel)  updateCategoriesError,required TResult Function( List<CategoryResponseData> data)  updateCategoriesSuccess,required TResult Function()  createCategoriesLoading,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetCategoriesLoading():
return getCategoriesLoading();case GetCategoriesError():
return getCategoriesError(_that.apiErrorModel);case GetCategoriesSuccess():
return getCategoriesSuccess(_that.data);case UpdateCategoriesLoading():
return updateCategoriesLoading(_that.id);case UpdateCategoriesError():
return updateCategoriesError(_that.apiErrorModel);case UpdateCategoriesSuccess():
return updateCategoriesSuccess(_that.data);case CreateCategoriesLoading():
return createCategoriesLoading();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getCategoriesLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getCategoriesError,TResult? Function( List<CategoryResponseData> data)?  getCategoriesSuccess,TResult? Function( String id)?  updateCategoriesLoading,TResult? Function( ApiErrorModel apiErrorModel)?  updateCategoriesError,TResult? Function( List<CategoryResponseData> data)?  updateCategoriesSuccess,TResult? Function()?  createCategoriesLoading,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetCategoriesLoading() when getCategoriesLoading != null:
return getCategoriesLoading();case GetCategoriesError() when getCategoriesError != null:
return getCategoriesError(_that.apiErrorModel);case GetCategoriesSuccess() when getCategoriesSuccess != null:
return getCategoriesSuccess(_that.data);case UpdateCategoriesLoading() when updateCategoriesLoading != null:
return updateCategoriesLoading(_that.id);case UpdateCategoriesError() when updateCategoriesError != null:
return updateCategoriesError(_that.apiErrorModel);case UpdateCategoriesSuccess() when updateCategoriesSuccess != null:
return updateCategoriesSuccess(_that.data);case CreateCategoriesLoading() when createCategoriesLoading != null:
return createCategoriesLoading();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CategoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.initial()';
}


}




/// @nodoc


class GetCategoriesLoading implements CategoryState {
  const GetCategoriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.getCategoriesLoading()';
}


}




/// @nodoc


class GetCategoriesError implements CategoryState {
  const GetCategoriesError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCategoriesErrorCopyWith<GetCategoriesError> get copyWith => _$GetCategoriesErrorCopyWithImpl<GetCategoriesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoriesError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'CategoryState.getCategoriesError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetCategoriesErrorCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $GetCategoriesErrorCopyWith(GetCategoriesError value, $Res Function(GetCategoriesError) _then) = _$GetCategoriesErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetCategoriesErrorCopyWithImpl<$Res>
    implements $GetCategoriesErrorCopyWith<$Res> {
  _$GetCategoriesErrorCopyWithImpl(this._self, this._then);

  final GetCategoriesError _self;
  final $Res Function(GetCategoriesError) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetCategoriesError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class GetCategoriesSuccess implements CategoryState {
  const GetCategoriesSuccess(final  List<CategoryResponseData> data): _data = data;
  

 final  List<CategoryResponseData> _data;
 List<CategoryResponseData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCategoriesSuccessCopyWith<GetCategoriesSuccess> get copyWith => _$GetCategoriesSuccessCopyWithImpl<GetCategoriesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoriesSuccess&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CategoryState.getCategoriesSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $GetCategoriesSuccessCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $GetCategoriesSuccessCopyWith(GetCategoriesSuccess value, $Res Function(GetCategoriesSuccess) _then) = _$GetCategoriesSuccessCopyWithImpl;
@useResult
$Res call({
 List<CategoryResponseData> data
});




}
/// @nodoc
class _$GetCategoriesSuccessCopyWithImpl<$Res>
    implements $GetCategoriesSuccessCopyWith<$Res> {
  _$GetCategoriesSuccessCopyWithImpl(this._self, this._then);

  final GetCategoriesSuccess _self;
  final $Res Function(GetCategoriesSuccess) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(GetCategoriesSuccess(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CategoryResponseData>,
  ));
}


}

/// @nodoc


class UpdateCategoriesLoading implements CategoryState {
  const UpdateCategoriesLoading(this.id);
  

 final  String id;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCategoriesLoadingCopyWith<UpdateCategoriesLoading> get copyWith => _$UpdateCategoriesLoadingCopyWithImpl<UpdateCategoriesLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCategoriesLoading&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'CategoryState.updateCategoriesLoading(id: $id)';
}


}

/// @nodoc
abstract mixin class $UpdateCategoriesLoadingCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $UpdateCategoriesLoadingCopyWith(UpdateCategoriesLoading value, $Res Function(UpdateCategoriesLoading) _then) = _$UpdateCategoriesLoadingCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$UpdateCategoriesLoadingCopyWithImpl<$Res>
    implements $UpdateCategoriesLoadingCopyWith<$Res> {
  _$UpdateCategoriesLoadingCopyWithImpl(this._self, this._then);

  final UpdateCategoriesLoading _self;
  final $Res Function(UpdateCategoriesLoading) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(UpdateCategoriesLoading(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class UpdateCategoriesError implements CategoryState {
  const UpdateCategoriesError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCategoriesErrorCopyWith<UpdateCategoriesError> get copyWith => _$UpdateCategoriesErrorCopyWithImpl<UpdateCategoriesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCategoriesError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'CategoryState.updateCategoriesError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $UpdateCategoriesErrorCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $UpdateCategoriesErrorCopyWith(UpdateCategoriesError value, $Res Function(UpdateCategoriesError) _then) = _$UpdateCategoriesErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$UpdateCategoriesErrorCopyWithImpl<$Res>
    implements $UpdateCategoriesErrorCopyWith<$Res> {
  _$UpdateCategoriesErrorCopyWithImpl(this._self, this._then);

  final UpdateCategoriesError _self;
  final $Res Function(UpdateCategoriesError) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(UpdateCategoriesError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class UpdateCategoriesSuccess implements CategoryState {
  const UpdateCategoriesSuccess(final  List<CategoryResponseData> data): _data = data;
  

 final  List<CategoryResponseData> _data;
 List<CategoryResponseData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCategoriesSuccessCopyWith<UpdateCategoriesSuccess> get copyWith => _$UpdateCategoriesSuccessCopyWithImpl<UpdateCategoriesSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCategoriesSuccess&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CategoryState.updateCategoriesSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateCategoriesSuccessCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory $UpdateCategoriesSuccessCopyWith(UpdateCategoriesSuccess value, $Res Function(UpdateCategoriesSuccess) _then) = _$UpdateCategoriesSuccessCopyWithImpl;
@useResult
$Res call({
 List<CategoryResponseData> data
});




}
/// @nodoc
class _$UpdateCategoriesSuccessCopyWithImpl<$Res>
    implements $UpdateCategoriesSuccessCopyWith<$Res> {
  _$UpdateCategoriesSuccessCopyWithImpl(this._self, this._then);

  final UpdateCategoriesSuccess _self;
  final $Res Function(UpdateCategoriesSuccess) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateCategoriesSuccess(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CategoryResponseData>,
  ));
}


}

/// @nodoc


class CreateCategoriesLoading implements CategoryState {
  const CreateCategoriesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCategoriesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CategoryState.createCategoriesLoading()';
}


}




// dart format on
