// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_based_on_category_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductBasedOnCategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductBasedOnCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductBasedOnCategoryState()';
}


}

/// @nodoc
class $ProductBasedOnCategoryStateCopyWith<$Res>  {
$ProductBasedOnCategoryStateCopyWith(ProductBasedOnCategoryState _, $Res Function(ProductBasedOnCategoryState) __);
}


/// Adds pattern-matching-related methods to [ProductBasedOnCategoryState].
extension ProductBasedOnCategoryStatePatterns on ProductBasedOnCategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( GetProductBasedOnCategoryLoading value)?  getProductLoading,TResult Function( GetProductBasedOnCategoryError value)?  getProductError,TResult Function( GetProductBasedOnCategorySuccess value)?  getProductSuccess,TResult Function( FilterProductListSuccess value)?  filterProductListSuccess,TResult Function( ChangeCategoryIndex value)?  changeCategoryIndex,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetProductBasedOnCategoryLoading() when getProductLoading != null:
return getProductLoading(_that);case GetProductBasedOnCategoryError() when getProductError != null:
return getProductError(_that);case GetProductBasedOnCategorySuccess() when getProductSuccess != null:
return getProductSuccess(_that);case FilterProductListSuccess() when filterProductListSuccess != null:
return filterProductListSuccess(_that);case ChangeCategoryIndex() when changeCategoryIndex != null:
return changeCategoryIndex(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( GetProductBasedOnCategoryLoading value)  getProductLoading,required TResult Function( GetProductBasedOnCategoryError value)  getProductError,required TResult Function( GetProductBasedOnCategorySuccess value)  getProductSuccess,required TResult Function( FilterProductListSuccess value)  filterProductListSuccess,required TResult Function( ChangeCategoryIndex value)  changeCategoryIndex,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case GetProductBasedOnCategoryLoading():
return getProductLoading(_that);case GetProductBasedOnCategoryError():
return getProductError(_that);case GetProductBasedOnCategorySuccess():
return getProductSuccess(_that);case FilterProductListSuccess():
return filterProductListSuccess(_that);case ChangeCategoryIndex():
return changeCategoryIndex(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( GetProductBasedOnCategoryLoading value)?  getProductLoading,TResult? Function( GetProductBasedOnCategoryError value)?  getProductError,TResult? Function( GetProductBasedOnCategorySuccess value)?  getProductSuccess,TResult? Function( FilterProductListSuccess value)?  filterProductListSuccess,TResult? Function( ChangeCategoryIndex value)?  changeCategoryIndex,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case GetProductBasedOnCategoryLoading() when getProductLoading != null:
return getProductLoading(_that);case GetProductBasedOnCategoryError() when getProductError != null:
return getProductError(_that);case GetProductBasedOnCategorySuccess() when getProductSuccess != null:
return getProductSuccess(_that);case FilterProductListSuccess() when filterProductListSuccess != null:
return filterProductListSuccess(_that);case ChangeCategoryIndex() when changeCategoryIndex != null:
return changeCategoryIndex(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  getProductLoading,TResult Function( ApiErrorModel apiErrorModel)?  getProductError,TResult Function( GetProductsBasedOnCategory data)?  getProductSuccess,TResult Function( List<Products>? data)?  filterProductListSuccess,TResult Function( int index)?  changeCategoryIndex,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetProductBasedOnCategoryLoading() when getProductLoading != null:
return getProductLoading();case GetProductBasedOnCategoryError() when getProductError != null:
return getProductError(_that.apiErrorModel);case GetProductBasedOnCategorySuccess() when getProductSuccess != null:
return getProductSuccess(_that.data);case FilterProductListSuccess() when filterProductListSuccess != null:
return filterProductListSuccess(_that.data);case ChangeCategoryIndex() when changeCategoryIndex != null:
return changeCategoryIndex(_that.index);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  getProductLoading,required TResult Function( ApiErrorModel apiErrorModel)  getProductError,required TResult Function( GetProductsBasedOnCategory data)  getProductSuccess,required TResult Function( List<Products>? data)  filterProductListSuccess,required TResult Function( int index)  changeCategoryIndex,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case GetProductBasedOnCategoryLoading():
return getProductLoading();case GetProductBasedOnCategoryError():
return getProductError(_that.apiErrorModel);case GetProductBasedOnCategorySuccess():
return getProductSuccess(_that.data);case FilterProductListSuccess():
return filterProductListSuccess(_that.data);case ChangeCategoryIndex():
return changeCategoryIndex(_that.index);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  getProductLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getProductError,TResult? Function( GetProductsBasedOnCategory data)?  getProductSuccess,TResult? Function( List<Products>? data)?  filterProductListSuccess,TResult? Function( int index)?  changeCategoryIndex,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case GetProductBasedOnCategoryLoading() when getProductLoading != null:
return getProductLoading();case GetProductBasedOnCategoryError() when getProductError != null:
return getProductError(_that.apiErrorModel);case GetProductBasedOnCategorySuccess() when getProductSuccess != null:
return getProductSuccess(_that.data);case FilterProductListSuccess() when filterProductListSuccess != null:
return filterProductListSuccess(_that.data);case ChangeCategoryIndex() when changeCategoryIndex != null:
return changeCategoryIndex(_that.index);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ProductBasedOnCategoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductBasedOnCategoryState.initial()';
}


}




/// @nodoc


class GetProductBasedOnCategoryLoading implements ProductBasedOnCategoryState {
  const GetProductBasedOnCategoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductBasedOnCategoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductBasedOnCategoryState.getProductLoading()';
}


}




/// @nodoc


class GetProductBasedOnCategoryError implements ProductBasedOnCategoryState {
  const GetProductBasedOnCategoryError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of ProductBasedOnCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductBasedOnCategoryErrorCopyWith<GetProductBasedOnCategoryError> get copyWith => _$GetProductBasedOnCategoryErrorCopyWithImpl<GetProductBasedOnCategoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductBasedOnCategoryError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'ProductBasedOnCategoryState.getProductError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetProductBasedOnCategoryErrorCopyWith<$Res> implements $ProductBasedOnCategoryStateCopyWith<$Res> {
  factory $GetProductBasedOnCategoryErrorCopyWith(GetProductBasedOnCategoryError value, $Res Function(GetProductBasedOnCategoryError) _then) = _$GetProductBasedOnCategoryErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetProductBasedOnCategoryErrorCopyWithImpl<$Res>
    implements $GetProductBasedOnCategoryErrorCopyWith<$Res> {
  _$GetProductBasedOnCategoryErrorCopyWithImpl(this._self, this._then);

  final GetProductBasedOnCategoryError _self;
  final $Res Function(GetProductBasedOnCategoryError) _then;

/// Create a copy of ProductBasedOnCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetProductBasedOnCategoryError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class GetProductBasedOnCategorySuccess implements ProductBasedOnCategoryState {
  const GetProductBasedOnCategorySuccess(this.data);
  

 final  GetProductsBasedOnCategory data;

/// Create a copy of ProductBasedOnCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetProductBasedOnCategorySuccessCopyWith<GetProductBasedOnCategorySuccess> get copyWith => _$GetProductBasedOnCategorySuccessCopyWithImpl<GetProductBasedOnCategorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetProductBasedOnCategorySuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ProductBasedOnCategoryState.getProductSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $GetProductBasedOnCategorySuccessCopyWith<$Res> implements $ProductBasedOnCategoryStateCopyWith<$Res> {
  factory $GetProductBasedOnCategorySuccessCopyWith(GetProductBasedOnCategorySuccess value, $Res Function(GetProductBasedOnCategorySuccess) _then) = _$GetProductBasedOnCategorySuccessCopyWithImpl;
@useResult
$Res call({
 GetProductsBasedOnCategory data
});




}
/// @nodoc
class _$GetProductBasedOnCategorySuccessCopyWithImpl<$Res>
    implements $GetProductBasedOnCategorySuccessCopyWith<$Res> {
  _$GetProductBasedOnCategorySuccessCopyWithImpl(this._self, this._then);

  final GetProductBasedOnCategorySuccess _self;
  final $Res Function(GetProductBasedOnCategorySuccess) _then;

/// Create a copy of ProductBasedOnCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(GetProductBasedOnCategorySuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as GetProductsBasedOnCategory,
  ));
}


}

/// @nodoc


class FilterProductListSuccess implements ProductBasedOnCategoryState {
  const FilterProductListSuccess(final  List<Products>? data): _data = data;
  

 final  List<Products>? _data;
 List<Products>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductBasedOnCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterProductListSuccessCopyWith<FilterProductListSuccess> get copyWith => _$FilterProductListSuccessCopyWithImpl<FilterProductListSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterProductListSuccess&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ProductBasedOnCategoryState.filterProductListSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $FilterProductListSuccessCopyWith<$Res> implements $ProductBasedOnCategoryStateCopyWith<$Res> {
  factory $FilterProductListSuccessCopyWith(FilterProductListSuccess value, $Res Function(FilterProductListSuccess) _then) = _$FilterProductListSuccessCopyWithImpl;
@useResult
$Res call({
 List<Products>? data
});




}
/// @nodoc
class _$FilterProductListSuccessCopyWithImpl<$Res>
    implements $FilterProductListSuccessCopyWith<$Res> {
  _$FilterProductListSuccessCopyWithImpl(this._self, this._then);

  final FilterProductListSuccess _self;
  final $Res Function(FilterProductListSuccess) _then;

/// Create a copy of ProductBasedOnCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(FilterProductListSuccess(
freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Products>?,
  ));
}


}

/// @nodoc


class ChangeCategoryIndex implements ProductBasedOnCategoryState {
  const ChangeCategoryIndex(this.index);
  

 final  int index;

/// Create a copy of ProductBasedOnCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeCategoryIndexCopyWith<ChangeCategoryIndex> get copyWith => _$ChangeCategoryIndexCopyWithImpl<ChangeCategoryIndex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeCategoryIndex&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'ProductBasedOnCategoryState.changeCategoryIndex(index: $index)';
}


}

/// @nodoc
abstract mixin class $ChangeCategoryIndexCopyWith<$Res> implements $ProductBasedOnCategoryStateCopyWith<$Res> {
  factory $ChangeCategoryIndexCopyWith(ChangeCategoryIndex value, $Res Function(ChangeCategoryIndex) _then) = _$ChangeCategoryIndexCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$ChangeCategoryIndexCopyWithImpl<$Res>
    implements $ChangeCategoryIndexCopyWith<$Res> {
  _$ChangeCategoryIndexCopyWithImpl(this._self, this._then);

  final ChangeCategoryIndex _self;
  final $Res Function(ChangeCategoryIndex) _then;

/// Create a copy of ProductBasedOnCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(ChangeCategoryIndex(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
