// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminProductState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminProductState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProductState()';
}


}

/// @nodoc
class $AdminProductStateCopyWith<$Res>  {
$AdminProductStateCopyWith(AdminProductState _, $Res Function(AdminProductState) __);
}


/// Adds pattern-matching-related methods to [AdminProductState].
extension AdminProductStatePatterns on AdminProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SelectedRangeState value)?  selectedRangeState,TResult Function( SelectedOptionState value)?  selectedOptionState,TResult Function( GetAllProductLoading value)?  getAllProductLoading,TResult Function( GetAllProductError value)?  getAllProductError,TResult Function( GetAllProductSuccess value)?  getAllProductSuccess,TResult Function( AllProductSLoadingFromPagination value)?  getAllProductSFromPaginationLoadingState,TResult Function( ImagePicked value)?  imagePicked,TResult Function( UpdateProductLoading value)?  updateProductLoading,TResult Function( UpdateProductError value)?  updateProductError,TResult Function( UpdateProductSuccess value)?  updateProductSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SelectedRangeState() when selectedRangeState != null:
return selectedRangeState(_that);case SelectedOptionState() when selectedOptionState != null:
return selectedOptionState(_that);case GetAllProductLoading() when getAllProductLoading != null:
return getAllProductLoading(_that);case GetAllProductError() when getAllProductError != null:
return getAllProductError(_that);case GetAllProductSuccess() when getAllProductSuccess != null:
return getAllProductSuccess(_that);case AllProductSLoadingFromPagination() when getAllProductSFromPaginationLoadingState != null:
return getAllProductSFromPaginationLoadingState(_that);case ImagePicked() when imagePicked != null:
return imagePicked(_that);case UpdateProductLoading() when updateProductLoading != null:
return updateProductLoading(_that);case UpdateProductError() when updateProductError != null:
return updateProductError(_that);case UpdateProductSuccess() when updateProductSuccess != null:
return updateProductSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SelectedRangeState value)  selectedRangeState,required TResult Function( SelectedOptionState value)  selectedOptionState,required TResult Function( GetAllProductLoading value)  getAllProductLoading,required TResult Function( GetAllProductError value)  getAllProductError,required TResult Function( GetAllProductSuccess value)  getAllProductSuccess,required TResult Function( AllProductSLoadingFromPagination value)  getAllProductSFromPaginationLoadingState,required TResult Function( ImagePicked value)  imagePicked,required TResult Function( UpdateProductLoading value)  updateProductLoading,required TResult Function( UpdateProductError value)  updateProductError,required TResult Function( UpdateProductSuccess value)  updateProductSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SelectedRangeState():
return selectedRangeState(_that);case SelectedOptionState():
return selectedOptionState(_that);case GetAllProductLoading():
return getAllProductLoading(_that);case GetAllProductError():
return getAllProductError(_that);case GetAllProductSuccess():
return getAllProductSuccess(_that);case AllProductSLoadingFromPagination():
return getAllProductSFromPaginationLoadingState(_that);case ImagePicked():
return imagePicked(_that);case UpdateProductLoading():
return updateProductLoading(_that);case UpdateProductError():
return updateProductError(_that);case UpdateProductSuccess():
return updateProductSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SelectedRangeState value)?  selectedRangeState,TResult? Function( SelectedOptionState value)?  selectedOptionState,TResult? Function( GetAllProductLoading value)?  getAllProductLoading,TResult? Function( GetAllProductError value)?  getAllProductError,TResult? Function( GetAllProductSuccess value)?  getAllProductSuccess,TResult? Function( AllProductSLoadingFromPagination value)?  getAllProductSFromPaginationLoadingState,TResult? Function( ImagePicked value)?  imagePicked,TResult? Function( UpdateProductLoading value)?  updateProductLoading,TResult? Function( UpdateProductError value)?  updateProductError,TResult? Function( UpdateProductSuccess value)?  updateProductSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SelectedRangeState() when selectedRangeState != null:
return selectedRangeState(_that);case SelectedOptionState() when selectedOptionState != null:
return selectedOptionState(_that);case GetAllProductLoading() when getAllProductLoading != null:
return getAllProductLoading(_that);case GetAllProductError() when getAllProductError != null:
return getAllProductError(_that);case GetAllProductSuccess() when getAllProductSuccess != null:
return getAllProductSuccess(_that);case AllProductSLoadingFromPagination() when getAllProductSFromPaginationLoadingState != null:
return getAllProductSFromPaginationLoadingState(_that);case ImagePicked() when imagePicked != null:
return imagePicked(_that);case UpdateProductLoading() when updateProductLoading != null:
return updateProductLoading(_that);case UpdateProductError() when updateProductError != null:
return updateProductError(_that);case UpdateProductSuccess() when updateProductSuccess != null:
return updateProductSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( RangeValues selectedRange)?  selectedRangeState,TResult Function( int selectedOption)?  selectedOptionState,TResult Function()?  getAllProductLoading,TResult Function( ApiErrorModel apiErrorModel)?  getAllProductError,TResult Function( ProductResponse data)?  getAllProductSuccess,TResult Function()?  getAllProductSFromPaginationLoadingState,TResult Function()?  imagePicked,TResult Function()?  updateProductLoading,TResult Function( ApiErrorModel apiErrorModel)?  updateProductError,TResult Function( List<DataProductResponse> data)?  updateProductSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SelectedRangeState() when selectedRangeState != null:
return selectedRangeState(_that.selectedRange);case SelectedOptionState() when selectedOptionState != null:
return selectedOptionState(_that.selectedOption);case GetAllProductLoading() when getAllProductLoading != null:
return getAllProductLoading();case GetAllProductError() when getAllProductError != null:
return getAllProductError(_that.apiErrorModel);case GetAllProductSuccess() when getAllProductSuccess != null:
return getAllProductSuccess(_that.data);case AllProductSLoadingFromPagination() when getAllProductSFromPaginationLoadingState != null:
return getAllProductSFromPaginationLoadingState();case ImagePicked() when imagePicked != null:
return imagePicked();case UpdateProductLoading() when updateProductLoading != null:
return updateProductLoading();case UpdateProductError() when updateProductError != null:
return updateProductError(_that.apiErrorModel);case UpdateProductSuccess() when updateProductSuccess != null:
return updateProductSuccess(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( RangeValues selectedRange)  selectedRangeState,required TResult Function( int selectedOption)  selectedOptionState,required TResult Function()  getAllProductLoading,required TResult Function( ApiErrorModel apiErrorModel)  getAllProductError,required TResult Function( ProductResponse data)  getAllProductSuccess,required TResult Function()  getAllProductSFromPaginationLoadingState,required TResult Function()  imagePicked,required TResult Function()  updateProductLoading,required TResult Function( ApiErrorModel apiErrorModel)  updateProductError,required TResult Function( List<DataProductResponse> data)  updateProductSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SelectedRangeState():
return selectedRangeState(_that.selectedRange);case SelectedOptionState():
return selectedOptionState(_that.selectedOption);case GetAllProductLoading():
return getAllProductLoading();case GetAllProductError():
return getAllProductError(_that.apiErrorModel);case GetAllProductSuccess():
return getAllProductSuccess(_that.data);case AllProductSLoadingFromPagination():
return getAllProductSFromPaginationLoadingState();case ImagePicked():
return imagePicked();case UpdateProductLoading():
return updateProductLoading();case UpdateProductError():
return updateProductError(_that.apiErrorModel);case UpdateProductSuccess():
return updateProductSuccess(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( RangeValues selectedRange)?  selectedRangeState,TResult? Function( int selectedOption)?  selectedOptionState,TResult? Function()?  getAllProductLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getAllProductError,TResult? Function( ProductResponse data)?  getAllProductSuccess,TResult? Function()?  getAllProductSFromPaginationLoadingState,TResult? Function()?  imagePicked,TResult? Function()?  updateProductLoading,TResult? Function( ApiErrorModel apiErrorModel)?  updateProductError,TResult? Function( List<DataProductResponse> data)?  updateProductSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SelectedRangeState() when selectedRangeState != null:
return selectedRangeState(_that.selectedRange);case SelectedOptionState() when selectedOptionState != null:
return selectedOptionState(_that.selectedOption);case GetAllProductLoading() when getAllProductLoading != null:
return getAllProductLoading();case GetAllProductError() when getAllProductError != null:
return getAllProductError(_that.apiErrorModel);case GetAllProductSuccess() when getAllProductSuccess != null:
return getAllProductSuccess(_that.data);case AllProductSLoadingFromPagination() when getAllProductSFromPaginationLoadingState != null:
return getAllProductSFromPaginationLoadingState();case ImagePicked() when imagePicked != null:
return imagePicked();case UpdateProductLoading() when updateProductLoading != null:
return updateProductLoading();case UpdateProductError() when updateProductError != null:
return updateProductError(_that.apiErrorModel);case UpdateProductSuccess() when updateProductSuccess != null:
return updateProductSuccess(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AdminProductState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProductState.initial()';
}


}




/// @nodoc


class SelectedRangeState implements AdminProductState {
  const SelectedRangeState(this.selectedRange);
  

 final  RangeValues selectedRange;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedRangeStateCopyWith<SelectedRangeState> get copyWith => _$SelectedRangeStateCopyWithImpl<SelectedRangeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedRangeState&&(identical(other.selectedRange, selectedRange) || other.selectedRange == selectedRange));
}


@override
int get hashCode => Object.hash(runtimeType,selectedRange);

@override
String toString() {
  return 'AdminProductState.selectedRangeState(selectedRange: $selectedRange)';
}


}

/// @nodoc
abstract mixin class $SelectedRangeStateCopyWith<$Res> implements $AdminProductStateCopyWith<$Res> {
  factory $SelectedRangeStateCopyWith(SelectedRangeState value, $Res Function(SelectedRangeState) _then) = _$SelectedRangeStateCopyWithImpl;
@useResult
$Res call({
 RangeValues selectedRange
});




}
/// @nodoc
class _$SelectedRangeStateCopyWithImpl<$Res>
    implements $SelectedRangeStateCopyWith<$Res> {
  _$SelectedRangeStateCopyWithImpl(this._self, this._then);

  final SelectedRangeState _self;
  final $Res Function(SelectedRangeState) _then;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedRange = null,}) {
  return _then(SelectedRangeState(
null == selectedRange ? _self.selectedRange : selectedRange // ignore: cast_nullable_to_non_nullable
as RangeValues,
  ));
}


}

/// @nodoc


class SelectedOptionState implements AdminProductState {
  const SelectedOptionState(this.selectedOption);
  

 final  int selectedOption;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedOptionStateCopyWith<SelectedOptionState> get copyWith => _$SelectedOptionStateCopyWithImpl<SelectedOptionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedOptionState&&(identical(other.selectedOption, selectedOption) || other.selectedOption == selectedOption));
}


@override
int get hashCode => Object.hash(runtimeType,selectedOption);

@override
String toString() {
  return 'AdminProductState.selectedOptionState(selectedOption: $selectedOption)';
}


}

/// @nodoc
abstract mixin class $SelectedOptionStateCopyWith<$Res> implements $AdminProductStateCopyWith<$Res> {
  factory $SelectedOptionStateCopyWith(SelectedOptionState value, $Res Function(SelectedOptionState) _then) = _$SelectedOptionStateCopyWithImpl;
@useResult
$Res call({
 int selectedOption
});




}
/// @nodoc
class _$SelectedOptionStateCopyWithImpl<$Res>
    implements $SelectedOptionStateCopyWith<$Res> {
  _$SelectedOptionStateCopyWithImpl(this._self, this._then);

  final SelectedOptionState _self;
  final $Res Function(SelectedOptionState) _then;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedOption = null,}) {
  return _then(SelectedOptionState(
null == selectedOption ? _self.selectedOption : selectedOption // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GetAllProductLoading implements AdminProductState {
  const GetAllProductLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllProductLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProductState.getAllProductLoading()';
}


}




/// @nodoc


class GetAllProductError implements AdminProductState {
  const GetAllProductError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllProductErrorCopyWith<GetAllProductError> get copyWith => _$GetAllProductErrorCopyWithImpl<GetAllProductError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllProductError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'AdminProductState.getAllProductError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetAllProductErrorCopyWith<$Res> implements $AdminProductStateCopyWith<$Res> {
  factory $GetAllProductErrorCopyWith(GetAllProductError value, $Res Function(GetAllProductError) _then) = _$GetAllProductErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetAllProductErrorCopyWithImpl<$Res>
    implements $GetAllProductErrorCopyWith<$Res> {
  _$GetAllProductErrorCopyWithImpl(this._self, this._then);

  final GetAllProductError _self;
  final $Res Function(GetAllProductError) _then;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetAllProductError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class GetAllProductSuccess implements AdminProductState {
  const GetAllProductSuccess(this.data);
  

 final  ProductResponse data;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetAllProductSuccessCopyWith<GetAllProductSuccess> get copyWith => _$GetAllProductSuccessCopyWithImpl<GetAllProductSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetAllProductSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'AdminProductState.getAllProductSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $GetAllProductSuccessCopyWith<$Res> implements $AdminProductStateCopyWith<$Res> {
  factory $GetAllProductSuccessCopyWith(GetAllProductSuccess value, $Res Function(GetAllProductSuccess) _then) = _$GetAllProductSuccessCopyWithImpl;
@useResult
$Res call({
 ProductResponse data
});




}
/// @nodoc
class _$GetAllProductSuccessCopyWithImpl<$Res>
    implements $GetAllProductSuccessCopyWith<$Res> {
  _$GetAllProductSuccessCopyWithImpl(this._self, this._then);

  final GetAllProductSuccess _self;
  final $Res Function(GetAllProductSuccess) _then;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(GetAllProductSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductResponse,
  ));
}


}

/// @nodoc


class AllProductSLoadingFromPagination implements AdminProductState {
  const AllProductSLoadingFromPagination();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AllProductSLoadingFromPagination);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProductState.getAllProductSFromPaginationLoadingState()';
}


}




/// @nodoc


class ImagePicked implements AdminProductState {
  const ImagePicked();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImagePicked);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProductState.imagePicked()';
}


}




/// @nodoc


class UpdateProductLoading implements AdminProductState {
  const UpdateProductLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AdminProductState.updateProductLoading()';
}


}




/// @nodoc


class UpdateProductError implements AdminProductState {
  const UpdateProductError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProductErrorCopyWith<UpdateProductError> get copyWith => _$UpdateProductErrorCopyWithImpl<UpdateProductError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'AdminProductState.updateProductError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $UpdateProductErrorCopyWith<$Res> implements $AdminProductStateCopyWith<$Res> {
  factory $UpdateProductErrorCopyWith(UpdateProductError value, $Res Function(UpdateProductError) _then) = _$UpdateProductErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$UpdateProductErrorCopyWithImpl<$Res>
    implements $UpdateProductErrorCopyWith<$Res> {
  _$UpdateProductErrorCopyWithImpl(this._self, this._then);

  final UpdateProductError _self;
  final $Res Function(UpdateProductError) _then;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(UpdateProductError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class UpdateProductSuccess implements AdminProductState {
  const UpdateProductSuccess(final  List<DataProductResponse> data): _data = data;
  

 final  List<DataProductResponse> _data;
 List<DataProductResponse> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProductSuccessCopyWith<UpdateProductSuccess> get copyWith => _$UpdateProductSuccessCopyWithImpl<UpdateProductSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProductSuccess&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'AdminProductState.updateProductSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $UpdateProductSuccessCopyWith<$Res> implements $AdminProductStateCopyWith<$Res> {
  factory $UpdateProductSuccessCopyWith(UpdateProductSuccess value, $Res Function(UpdateProductSuccess) _then) = _$UpdateProductSuccessCopyWithImpl;
@useResult
$Res call({
 List<DataProductResponse> data
});




}
/// @nodoc
class _$UpdateProductSuccessCopyWithImpl<$Res>
    implements $UpdateProductSuccessCopyWith<$Res> {
  _$UpdateProductSuccessCopyWithImpl(this._self, this._then);

  final UpdateProductSuccess _self;
  final $Res Function(UpdateProductSuccess) _then;

/// Create a copy of AdminProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(UpdateProductSuccess(
null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DataProductResponse>,
  ));
}


}

// dart format on
