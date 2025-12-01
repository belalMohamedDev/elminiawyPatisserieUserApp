// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState()';
}


}

/// @nodoc
class $ProductStateCopyWith<$Res>  {
$ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}


/// Adds pattern-matching-related methods to [ProductState].
extension ProductStatePatterns on ProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetNewProductLoading value)?  getNewProductLoading,TResult Function( GetNewProductError value)?  getNewProductError,TResult Function( GetNewProductSuccess value)?  getNewProductSuccess,TResult Function( AddNewProductItemToList value)?  addNewProductItemToList,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetNewProductLoading() when getNewProductLoading != null:
return getNewProductLoading(_that);case GetNewProductError() when getNewProductError != null:
return getNewProductError(_that);case GetNewProductSuccess() when getNewProductSuccess != null:
return getNewProductSuccess(_that);case AddNewProductItemToList() when addNewProductItemToList != null:
return addNewProductItemToList(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetNewProductLoading value)  getNewProductLoading,required TResult Function( GetNewProductError value)  getNewProductError,required TResult Function( GetNewProductSuccess value)  getNewProductSuccess,required TResult Function( AddNewProductItemToList value)  addNewProductItemToList,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetNewProductLoading():
return getNewProductLoading(_that);case GetNewProductError():
return getNewProductError(_that);case GetNewProductSuccess():
return getNewProductSuccess(_that);case AddNewProductItemToList():
return addNewProductItemToList(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetNewProductLoading value)?  getNewProductLoading,TResult? Function( GetNewProductError value)?  getNewProductError,TResult? Function( GetNewProductSuccess value)?  getNewProductSuccess,TResult? Function( AddNewProductItemToList value)?  addNewProductItemToList,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetNewProductLoading() when getNewProductLoading != null:
return getNewProductLoading(_that);case GetNewProductError() when getNewProductError != null:
return getNewProductError(_that);case GetNewProductSuccess() when getNewProductSuccess != null:
return getNewProductSuccess(_that);case AddNewProductItemToList() when addNewProductItemToList != null:
return addNewProductItemToList(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getNewProductLoading,TResult Function( ApiErrorModel apiErrorModel)?  getNewProductError,TResult Function( ProductResponse data)?  getNewProductSuccess,TResult Function( List<DataProductResponse> getFoundData)?  addNewProductItemToList,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetNewProductLoading() when getNewProductLoading != null:
return getNewProductLoading();case GetNewProductError() when getNewProductError != null:
return getNewProductError(_that.apiErrorModel);case GetNewProductSuccess() when getNewProductSuccess != null:
return getNewProductSuccess(_that.data);case AddNewProductItemToList() when addNewProductItemToList != null:
return addNewProductItemToList(_that.getFoundData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getNewProductLoading,required TResult Function( ApiErrorModel apiErrorModel)  getNewProductError,required TResult Function( ProductResponse data)  getNewProductSuccess,required TResult Function( List<DataProductResponse> getFoundData)  addNewProductItemToList,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetNewProductLoading():
return getNewProductLoading();case GetNewProductError():
return getNewProductError(_that.apiErrorModel);case GetNewProductSuccess():
return getNewProductSuccess(_that.data);case AddNewProductItemToList():
return addNewProductItemToList(_that.getFoundData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getNewProductLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getNewProductError,TResult? Function( ProductResponse data)?  getNewProductSuccess,TResult? Function( List<DataProductResponse> getFoundData)?  addNewProductItemToList,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetNewProductLoading() when getNewProductLoading != null:
return getNewProductLoading();case GetNewProductError() when getNewProductError != null:
return getNewProductError(_that.apiErrorModel);case GetNewProductSuccess() when getNewProductSuccess != null:
return getNewProductSuccess(_that.data);case AddNewProductItemToList() when addNewProductItemToList != null:
return addNewProductItemToList(_that.getFoundData);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.initial()';
}


}




/// @nodoc


class GetNewProductLoading implements ProductState {
  const GetNewProductLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNewProductLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductState.getNewProductLoading()';
}


}




/// @nodoc


class GetNewProductError implements ProductState {
  const GetNewProductError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetNewProductErrorCopyWith<GetNewProductError> get copyWith => _$GetNewProductErrorCopyWithImpl<GetNewProductError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNewProductError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'ProductState.getNewProductError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetNewProductErrorCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $GetNewProductErrorCopyWith(GetNewProductError value, $Res Function(GetNewProductError) _then) = _$GetNewProductErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetNewProductErrorCopyWithImpl<$Res>
    implements $GetNewProductErrorCopyWith<$Res> {
  _$GetNewProductErrorCopyWithImpl(this._self, this._then);

  final GetNewProductError _self;
  final $Res Function(GetNewProductError) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetNewProductError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class GetNewProductSuccess implements ProductState {
  const GetNewProductSuccess(this.data);
  

 final  ProductResponse data;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetNewProductSuccessCopyWith<GetNewProductSuccess> get copyWith => _$GetNewProductSuccessCopyWithImpl<GetNewProductSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetNewProductSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ProductState.getNewProductSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $GetNewProductSuccessCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $GetNewProductSuccessCopyWith(GetNewProductSuccess value, $Res Function(GetNewProductSuccess) _then) = _$GetNewProductSuccessCopyWithImpl;
@useResult
$Res call({
 ProductResponse data
});




}
/// @nodoc
class _$GetNewProductSuccessCopyWithImpl<$Res>
    implements $GetNewProductSuccessCopyWith<$Res> {
  _$GetNewProductSuccessCopyWithImpl(this._self, this._then);

  final GetNewProductSuccess _self;
  final $Res Function(GetNewProductSuccess) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(GetNewProductSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductResponse,
  ));
}


}

/// @nodoc


class AddNewProductItemToList implements ProductState {
  const AddNewProductItemToList(final  List<DataProductResponse> getFoundData): _getFoundData = getFoundData;
  

 final  List<DataProductResponse> _getFoundData;
 List<DataProductResponse> get getFoundData {
  if (_getFoundData is EqualUnmodifiableListView) return _getFoundData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_getFoundData);
}


/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddNewProductItemToListCopyWith<AddNewProductItemToList> get copyWith => _$AddNewProductItemToListCopyWithImpl<AddNewProductItemToList>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNewProductItemToList&&const DeepCollectionEquality().equals(other._getFoundData, _getFoundData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_getFoundData));

@override
String toString() {
  return 'ProductState.addNewProductItemToList(getFoundData: $getFoundData)';
}


}

/// @nodoc
abstract mixin class $AddNewProductItemToListCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory $AddNewProductItemToListCopyWith(AddNewProductItemToList value, $Res Function(AddNewProductItemToList) _then) = _$AddNewProductItemToListCopyWithImpl;
@useResult
$Res call({
 List<DataProductResponse> getFoundData
});




}
/// @nodoc
class _$AddNewProductItemToListCopyWithImpl<$Res>
    implements $AddNewProductItemToListCopyWith<$Res> {
  _$AddNewProductItemToListCopyWithImpl(this._self, this._then);

  final AddNewProductItemToList _self;
  final $Res Function(AddNewProductItemToList) _then;

/// Create a copy of ProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? getFoundData = null,}) {
  return _then(AddNewProductItemToList(
null == getFoundData ? _self._getFoundData : getFoundData // ignore: cast_nullable_to_non_nullable
as List<DataProductResponse>,
  ));
}


}

// dart format on
