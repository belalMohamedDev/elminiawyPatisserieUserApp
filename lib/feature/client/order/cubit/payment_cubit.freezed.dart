// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PaymentState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState()';
}


}

/// @nodoc
class $PaymentStateCopyWith<$Res>  {
$PaymentStateCopyWith(PaymentState _, $Res Function(PaymentState) __);
}


/// Adds pattern-matching-related methods to [PaymentState].
extension PaymentStatePatterns on PaymentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ChangeShippingIndex value)?  changeShippingIndex,TResult Function( ChoosePayment value)?  choosePayment,TResult Function( CreateCashOrderLoading value)?  createCashOrderLoading,TResult Function( CreateCashOrderError value)?  createCashOrderError,TResult Function( CreateCashOrderSuccess value)?  createCashOrderSuccess,TResult Function( GetCompleteOrdersLoading value)?  getCompleteOrdersLoading,TResult Function( GetCompleteOrdersError value)?  getCompleteOrdersError,TResult Function( GetCompleteOrdersSuccess value)?  getCompleteOrdersSuccess,TResult Function( OrderTypeChanged value)?  orderTypeChanged,TResult Function( GetPendingOrdersLoading value)?  getPendingOrdersLoading,TResult Function( GetPendingOrdersError value)?  getPendingOrdersError,TResult Function( GetPendingOrdersSuccess value)?  getPendingOrdersSuccess,TResult Function( AddPaymentOrdersLoading value)?  addPaymentOrdersLoading,TResult Function( AddPaymentOrdersError value)?  addPaymentOrdersError,TResult Function( AddPaymentOrdersSuccess value)?  addPaymentOrdersSuccess,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ChangeShippingIndex() when changeShippingIndex != null:
return changeShippingIndex(_that);case ChoosePayment() when choosePayment != null:
return choosePayment(_that);case CreateCashOrderLoading() when createCashOrderLoading != null:
return createCashOrderLoading(_that);case CreateCashOrderError() when createCashOrderError != null:
return createCashOrderError(_that);case CreateCashOrderSuccess() when createCashOrderSuccess != null:
return createCashOrderSuccess(_that);case GetCompleteOrdersLoading() when getCompleteOrdersLoading != null:
return getCompleteOrdersLoading(_that);case GetCompleteOrdersError() when getCompleteOrdersError != null:
return getCompleteOrdersError(_that);case GetCompleteOrdersSuccess() when getCompleteOrdersSuccess != null:
return getCompleteOrdersSuccess(_that);case OrderTypeChanged() when orderTypeChanged != null:
return orderTypeChanged(_that);case GetPendingOrdersLoading() when getPendingOrdersLoading != null:
return getPendingOrdersLoading(_that);case GetPendingOrdersError() when getPendingOrdersError != null:
return getPendingOrdersError(_that);case GetPendingOrdersSuccess() when getPendingOrdersSuccess != null:
return getPendingOrdersSuccess(_that);case AddPaymentOrdersLoading() when addPaymentOrdersLoading != null:
return addPaymentOrdersLoading(_that);case AddPaymentOrdersError() when addPaymentOrdersError != null:
return addPaymentOrdersError(_that);case AddPaymentOrdersSuccess() when addPaymentOrdersSuccess != null:
return addPaymentOrdersSuccess(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ChangeShippingIndex value)  changeShippingIndex,required TResult Function( ChoosePayment value)  choosePayment,required TResult Function( CreateCashOrderLoading value)  createCashOrderLoading,required TResult Function( CreateCashOrderError value)  createCashOrderError,required TResult Function( CreateCashOrderSuccess value)  createCashOrderSuccess,required TResult Function( GetCompleteOrdersLoading value)  getCompleteOrdersLoading,required TResult Function( GetCompleteOrdersError value)  getCompleteOrdersError,required TResult Function( GetCompleteOrdersSuccess value)  getCompleteOrdersSuccess,required TResult Function( OrderTypeChanged value)  orderTypeChanged,required TResult Function( GetPendingOrdersLoading value)  getPendingOrdersLoading,required TResult Function( GetPendingOrdersError value)  getPendingOrdersError,required TResult Function( GetPendingOrdersSuccess value)  getPendingOrdersSuccess,required TResult Function( AddPaymentOrdersLoading value)  addPaymentOrdersLoading,required TResult Function( AddPaymentOrdersError value)  addPaymentOrdersError,required TResult Function( AddPaymentOrdersSuccess value)  addPaymentOrdersSuccess,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ChangeShippingIndex():
return changeShippingIndex(_that);case ChoosePayment():
return choosePayment(_that);case CreateCashOrderLoading():
return createCashOrderLoading(_that);case CreateCashOrderError():
return createCashOrderError(_that);case CreateCashOrderSuccess():
return createCashOrderSuccess(_that);case GetCompleteOrdersLoading():
return getCompleteOrdersLoading(_that);case GetCompleteOrdersError():
return getCompleteOrdersError(_that);case GetCompleteOrdersSuccess():
return getCompleteOrdersSuccess(_that);case OrderTypeChanged():
return orderTypeChanged(_that);case GetPendingOrdersLoading():
return getPendingOrdersLoading(_that);case GetPendingOrdersError():
return getPendingOrdersError(_that);case GetPendingOrdersSuccess():
return getPendingOrdersSuccess(_that);case AddPaymentOrdersLoading():
return addPaymentOrdersLoading(_that);case AddPaymentOrdersError():
return addPaymentOrdersError(_that);case AddPaymentOrdersSuccess():
return addPaymentOrdersSuccess(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ChangeShippingIndex value)?  changeShippingIndex,TResult? Function( ChoosePayment value)?  choosePayment,TResult? Function( CreateCashOrderLoading value)?  createCashOrderLoading,TResult? Function( CreateCashOrderError value)?  createCashOrderError,TResult? Function( CreateCashOrderSuccess value)?  createCashOrderSuccess,TResult? Function( GetCompleteOrdersLoading value)?  getCompleteOrdersLoading,TResult? Function( GetCompleteOrdersError value)?  getCompleteOrdersError,TResult? Function( GetCompleteOrdersSuccess value)?  getCompleteOrdersSuccess,TResult? Function( OrderTypeChanged value)?  orderTypeChanged,TResult? Function( GetPendingOrdersLoading value)?  getPendingOrdersLoading,TResult? Function( GetPendingOrdersError value)?  getPendingOrdersError,TResult? Function( GetPendingOrdersSuccess value)?  getPendingOrdersSuccess,TResult? Function( AddPaymentOrdersLoading value)?  addPaymentOrdersLoading,TResult? Function( AddPaymentOrdersError value)?  addPaymentOrdersError,TResult? Function( AddPaymentOrdersSuccess value)?  addPaymentOrdersSuccess,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ChangeShippingIndex() when changeShippingIndex != null:
return changeShippingIndex(_that);case ChoosePayment() when choosePayment != null:
return choosePayment(_that);case CreateCashOrderLoading() when createCashOrderLoading != null:
return createCashOrderLoading(_that);case CreateCashOrderError() when createCashOrderError != null:
return createCashOrderError(_that);case CreateCashOrderSuccess() when createCashOrderSuccess != null:
return createCashOrderSuccess(_that);case GetCompleteOrdersLoading() when getCompleteOrdersLoading != null:
return getCompleteOrdersLoading(_that);case GetCompleteOrdersError() when getCompleteOrdersError != null:
return getCompleteOrdersError(_that);case GetCompleteOrdersSuccess() when getCompleteOrdersSuccess != null:
return getCompleteOrdersSuccess(_that);case OrderTypeChanged() when orderTypeChanged != null:
return orderTypeChanged(_that);case GetPendingOrdersLoading() when getPendingOrdersLoading != null:
return getPendingOrdersLoading(_that);case GetPendingOrdersError() when getPendingOrdersError != null:
return getPendingOrdersError(_that);case GetPendingOrdersSuccess() when getPendingOrdersSuccess != null:
return getPendingOrdersSuccess(_that);case AddPaymentOrdersLoading() when addPaymentOrdersLoading != null:
return addPaymentOrdersLoading(_that);case AddPaymentOrdersError() when addPaymentOrdersError != null:
return addPaymentOrdersError(_that);case AddPaymentOrdersSuccess() when addPaymentOrdersSuccess != null:
return addPaymentOrdersSuccess(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( int index)?  changeShippingIndex,TResult Function( String choosePayment)?  choosePayment,TResult Function()?  createCashOrderLoading,TResult Function( ApiErrorModel apiErrorModel)?  createCashOrderError,TResult Function( OrderResponse createOrderResponse)?  createCashOrderSuccess,TResult Function()?  getCompleteOrdersLoading,TResult Function( ApiErrorModel apiErrorModel)?  getCompleteOrdersError,TResult Function( GetOrdersResponse getOrdersResponse)?  getCompleteOrdersSuccess,TResult Function( String selectedType)?  orderTypeChanged,TResult Function()?  getPendingOrdersLoading,TResult Function( ApiErrorModel apiErrorModel)?  getPendingOrdersError,TResult Function( GetOrdersResponse getOrdersResponse)?  getPendingOrdersSuccess,TResult Function()?  addPaymentOrdersLoading,TResult Function( ApiErrorModel apiErrorModel)?  addPaymentOrdersError,TResult Function( ApiSuccessGeneralModel getOrdersResponse)?  addPaymentOrdersSuccess,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ChangeShippingIndex() when changeShippingIndex != null:
return changeShippingIndex(_that.index);case ChoosePayment() when choosePayment != null:
return choosePayment(_that.choosePayment);case CreateCashOrderLoading() when createCashOrderLoading != null:
return createCashOrderLoading();case CreateCashOrderError() when createCashOrderError != null:
return createCashOrderError(_that.apiErrorModel);case CreateCashOrderSuccess() when createCashOrderSuccess != null:
return createCashOrderSuccess(_that.createOrderResponse);case GetCompleteOrdersLoading() when getCompleteOrdersLoading != null:
return getCompleteOrdersLoading();case GetCompleteOrdersError() when getCompleteOrdersError != null:
return getCompleteOrdersError(_that.apiErrorModel);case GetCompleteOrdersSuccess() when getCompleteOrdersSuccess != null:
return getCompleteOrdersSuccess(_that.getOrdersResponse);case OrderTypeChanged() when orderTypeChanged != null:
return orderTypeChanged(_that.selectedType);case GetPendingOrdersLoading() when getPendingOrdersLoading != null:
return getPendingOrdersLoading();case GetPendingOrdersError() when getPendingOrdersError != null:
return getPendingOrdersError(_that.apiErrorModel);case GetPendingOrdersSuccess() when getPendingOrdersSuccess != null:
return getPendingOrdersSuccess(_that.getOrdersResponse);case AddPaymentOrdersLoading() when addPaymentOrdersLoading != null:
return addPaymentOrdersLoading();case AddPaymentOrdersError() when addPaymentOrdersError != null:
return addPaymentOrdersError(_that.apiErrorModel);case AddPaymentOrdersSuccess() when addPaymentOrdersSuccess != null:
return addPaymentOrdersSuccess(_that.getOrdersResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( int index)  changeShippingIndex,required TResult Function( String choosePayment)  choosePayment,required TResult Function()  createCashOrderLoading,required TResult Function( ApiErrorModel apiErrorModel)  createCashOrderError,required TResult Function( OrderResponse createOrderResponse)  createCashOrderSuccess,required TResult Function()  getCompleteOrdersLoading,required TResult Function( ApiErrorModel apiErrorModel)  getCompleteOrdersError,required TResult Function( GetOrdersResponse getOrdersResponse)  getCompleteOrdersSuccess,required TResult Function( String selectedType)  orderTypeChanged,required TResult Function()  getPendingOrdersLoading,required TResult Function( ApiErrorModel apiErrorModel)  getPendingOrdersError,required TResult Function( GetOrdersResponse getOrdersResponse)  getPendingOrdersSuccess,required TResult Function()  addPaymentOrdersLoading,required TResult Function( ApiErrorModel apiErrorModel)  addPaymentOrdersError,required TResult Function( ApiSuccessGeneralModel getOrdersResponse)  addPaymentOrdersSuccess,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ChangeShippingIndex():
return changeShippingIndex(_that.index);case ChoosePayment():
return choosePayment(_that.choosePayment);case CreateCashOrderLoading():
return createCashOrderLoading();case CreateCashOrderError():
return createCashOrderError(_that.apiErrorModel);case CreateCashOrderSuccess():
return createCashOrderSuccess(_that.createOrderResponse);case GetCompleteOrdersLoading():
return getCompleteOrdersLoading();case GetCompleteOrdersError():
return getCompleteOrdersError(_that.apiErrorModel);case GetCompleteOrdersSuccess():
return getCompleteOrdersSuccess(_that.getOrdersResponse);case OrderTypeChanged():
return orderTypeChanged(_that.selectedType);case GetPendingOrdersLoading():
return getPendingOrdersLoading();case GetPendingOrdersError():
return getPendingOrdersError(_that.apiErrorModel);case GetPendingOrdersSuccess():
return getPendingOrdersSuccess(_that.getOrdersResponse);case AddPaymentOrdersLoading():
return addPaymentOrdersLoading();case AddPaymentOrdersError():
return addPaymentOrdersError(_that.apiErrorModel);case AddPaymentOrdersSuccess():
return addPaymentOrdersSuccess(_that.getOrdersResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( int index)?  changeShippingIndex,TResult? Function( String choosePayment)?  choosePayment,TResult? Function()?  createCashOrderLoading,TResult? Function( ApiErrorModel apiErrorModel)?  createCashOrderError,TResult? Function( OrderResponse createOrderResponse)?  createCashOrderSuccess,TResult? Function()?  getCompleteOrdersLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getCompleteOrdersError,TResult? Function( GetOrdersResponse getOrdersResponse)?  getCompleteOrdersSuccess,TResult? Function( String selectedType)?  orderTypeChanged,TResult? Function()?  getPendingOrdersLoading,TResult? Function( ApiErrorModel apiErrorModel)?  getPendingOrdersError,TResult? Function( GetOrdersResponse getOrdersResponse)?  getPendingOrdersSuccess,TResult? Function()?  addPaymentOrdersLoading,TResult? Function( ApiErrorModel apiErrorModel)?  addPaymentOrdersError,TResult? Function( ApiSuccessGeneralModel getOrdersResponse)?  addPaymentOrdersSuccess,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ChangeShippingIndex() when changeShippingIndex != null:
return changeShippingIndex(_that.index);case ChoosePayment() when choosePayment != null:
return choosePayment(_that.choosePayment);case CreateCashOrderLoading() when createCashOrderLoading != null:
return createCashOrderLoading();case CreateCashOrderError() when createCashOrderError != null:
return createCashOrderError(_that.apiErrorModel);case CreateCashOrderSuccess() when createCashOrderSuccess != null:
return createCashOrderSuccess(_that.createOrderResponse);case GetCompleteOrdersLoading() when getCompleteOrdersLoading != null:
return getCompleteOrdersLoading();case GetCompleteOrdersError() when getCompleteOrdersError != null:
return getCompleteOrdersError(_that.apiErrorModel);case GetCompleteOrdersSuccess() when getCompleteOrdersSuccess != null:
return getCompleteOrdersSuccess(_that.getOrdersResponse);case OrderTypeChanged() when orderTypeChanged != null:
return orderTypeChanged(_that.selectedType);case GetPendingOrdersLoading() when getPendingOrdersLoading != null:
return getPendingOrdersLoading();case GetPendingOrdersError() when getPendingOrdersError != null:
return getPendingOrdersError(_that.apiErrorModel);case GetPendingOrdersSuccess() when getPendingOrdersSuccess != null:
return getPendingOrdersSuccess(_that.getOrdersResponse);case AddPaymentOrdersLoading() when addPaymentOrdersLoading != null:
return addPaymentOrdersLoading();case AddPaymentOrdersError() when addPaymentOrdersError != null:
return addPaymentOrdersError(_that.apiErrorModel);case AddPaymentOrdersSuccess() when addPaymentOrdersSuccess != null:
return addPaymentOrdersSuccess(_that.getOrdersResponse);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PaymentState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState.initial()';
}


}




/// @nodoc


class ChangeShippingIndex implements PaymentState {
  const ChangeShippingIndex(this.index);
  

 final  int index;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeShippingIndexCopyWith<ChangeShippingIndex> get copyWith => _$ChangeShippingIndexCopyWithImpl<ChangeShippingIndex>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeShippingIndex&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'PaymentState.changeShippingIndex(index: $index)';
}


}

/// @nodoc
abstract mixin class $ChangeShippingIndexCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $ChangeShippingIndexCopyWith(ChangeShippingIndex value, $Res Function(ChangeShippingIndex) _then) = _$ChangeShippingIndexCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$ChangeShippingIndexCopyWithImpl<$Res>
    implements $ChangeShippingIndexCopyWith<$Res> {
  _$ChangeShippingIndexCopyWithImpl(this._self, this._then);

  final ChangeShippingIndex _self;
  final $Res Function(ChangeShippingIndex) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(ChangeShippingIndex(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class ChoosePayment implements PaymentState {
  const ChoosePayment(this.choosePayment);
  

 final  String choosePayment;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChoosePaymentCopyWith<ChoosePayment> get copyWith => _$ChoosePaymentCopyWithImpl<ChoosePayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChoosePayment&&(identical(other.choosePayment, choosePayment) || other.choosePayment == choosePayment));
}


@override
int get hashCode => Object.hash(runtimeType,choosePayment);

@override
String toString() {
  return 'PaymentState.choosePayment(choosePayment: $choosePayment)';
}


}

/// @nodoc
abstract mixin class $ChoosePaymentCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $ChoosePaymentCopyWith(ChoosePayment value, $Res Function(ChoosePayment) _then) = _$ChoosePaymentCopyWithImpl;
@useResult
$Res call({
 String choosePayment
});




}
/// @nodoc
class _$ChoosePaymentCopyWithImpl<$Res>
    implements $ChoosePaymentCopyWith<$Res> {
  _$ChoosePaymentCopyWithImpl(this._self, this._then);

  final ChoosePayment _self;
  final $Res Function(ChoosePayment) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? choosePayment = null,}) {
  return _then(ChoosePayment(
null == choosePayment ? _self.choosePayment : choosePayment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CreateCashOrderLoading implements PaymentState {
  const CreateCashOrderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCashOrderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState.createCashOrderLoading()';
}


}




/// @nodoc


class CreateCashOrderError implements PaymentState {
  const CreateCashOrderError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCashOrderErrorCopyWith<CreateCashOrderError> get copyWith => _$CreateCashOrderErrorCopyWithImpl<CreateCashOrderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCashOrderError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'PaymentState.createCashOrderError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $CreateCashOrderErrorCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $CreateCashOrderErrorCopyWith(CreateCashOrderError value, $Res Function(CreateCashOrderError) _then) = _$CreateCashOrderErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$CreateCashOrderErrorCopyWithImpl<$Res>
    implements $CreateCashOrderErrorCopyWith<$Res> {
  _$CreateCashOrderErrorCopyWithImpl(this._self, this._then);

  final CreateCashOrderError _self;
  final $Res Function(CreateCashOrderError) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(CreateCashOrderError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class CreateCashOrderSuccess implements PaymentState {
  const CreateCashOrderSuccess(this.createOrderResponse);
  

 final  OrderResponse createOrderResponse;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCashOrderSuccessCopyWith<CreateCashOrderSuccess> get copyWith => _$CreateCashOrderSuccessCopyWithImpl<CreateCashOrderSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCashOrderSuccess&&(identical(other.createOrderResponse, createOrderResponse) || other.createOrderResponse == createOrderResponse));
}


@override
int get hashCode => Object.hash(runtimeType,createOrderResponse);

@override
String toString() {
  return 'PaymentState.createCashOrderSuccess(createOrderResponse: $createOrderResponse)';
}


}

/// @nodoc
abstract mixin class $CreateCashOrderSuccessCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $CreateCashOrderSuccessCopyWith(CreateCashOrderSuccess value, $Res Function(CreateCashOrderSuccess) _then) = _$CreateCashOrderSuccessCopyWithImpl;
@useResult
$Res call({
 OrderResponse createOrderResponse
});




}
/// @nodoc
class _$CreateCashOrderSuccessCopyWithImpl<$Res>
    implements $CreateCashOrderSuccessCopyWith<$Res> {
  _$CreateCashOrderSuccessCopyWithImpl(this._self, this._then);

  final CreateCashOrderSuccess _self;
  final $Res Function(CreateCashOrderSuccess) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? createOrderResponse = null,}) {
  return _then(CreateCashOrderSuccess(
null == createOrderResponse ? _self.createOrderResponse : createOrderResponse // ignore: cast_nullable_to_non_nullable
as OrderResponse,
  ));
}


}

/// @nodoc


class GetCompleteOrdersLoading implements PaymentState {
  const GetCompleteOrdersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCompleteOrdersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState.getCompleteOrdersLoading()';
}


}




/// @nodoc


class GetCompleteOrdersError implements PaymentState {
  const GetCompleteOrdersError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCompleteOrdersErrorCopyWith<GetCompleteOrdersError> get copyWith => _$GetCompleteOrdersErrorCopyWithImpl<GetCompleteOrdersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCompleteOrdersError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'PaymentState.getCompleteOrdersError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetCompleteOrdersErrorCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $GetCompleteOrdersErrorCopyWith(GetCompleteOrdersError value, $Res Function(GetCompleteOrdersError) _then) = _$GetCompleteOrdersErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetCompleteOrdersErrorCopyWithImpl<$Res>
    implements $GetCompleteOrdersErrorCopyWith<$Res> {
  _$GetCompleteOrdersErrorCopyWithImpl(this._self, this._then);

  final GetCompleteOrdersError _self;
  final $Res Function(GetCompleteOrdersError) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetCompleteOrdersError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class GetCompleteOrdersSuccess implements PaymentState {
  const GetCompleteOrdersSuccess(this.getOrdersResponse);
  

 final  GetOrdersResponse getOrdersResponse;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetCompleteOrdersSuccessCopyWith<GetCompleteOrdersSuccess> get copyWith => _$GetCompleteOrdersSuccessCopyWithImpl<GetCompleteOrdersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCompleteOrdersSuccess&&(identical(other.getOrdersResponse, getOrdersResponse) || other.getOrdersResponse == getOrdersResponse));
}


@override
int get hashCode => Object.hash(runtimeType,getOrdersResponse);

@override
String toString() {
  return 'PaymentState.getCompleteOrdersSuccess(getOrdersResponse: $getOrdersResponse)';
}


}

/// @nodoc
abstract mixin class $GetCompleteOrdersSuccessCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $GetCompleteOrdersSuccessCopyWith(GetCompleteOrdersSuccess value, $Res Function(GetCompleteOrdersSuccess) _then) = _$GetCompleteOrdersSuccessCopyWithImpl;
@useResult
$Res call({
 GetOrdersResponse getOrdersResponse
});




}
/// @nodoc
class _$GetCompleteOrdersSuccessCopyWithImpl<$Res>
    implements $GetCompleteOrdersSuccessCopyWith<$Res> {
  _$GetCompleteOrdersSuccessCopyWithImpl(this._self, this._then);

  final GetCompleteOrdersSuccess _self;
  final $Res Function(GetCompleteOrdersSuccess) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? getOrdersResponse = null,}) {
  return _then(GetCompleteOrdersSuccess(
null == getOrdersResponse ? _self.getOrdersResponse : getOrdersResponse // ignore: cast_nullable_to_non_nullable
as GetOrdersResponse,
  ));
}


}

/// @nodoc


class OrderTypeChanged implements PaymentState {
  const OrderTypeChanged(this.selectedType);
  

 final  String selectedType;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderTypeChangedCopyWith<OrderTypeChanged> get copyWith => _$OrderTypeChangedCopyWithImpl<OrderTypeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderTypeChanged&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType));
}


@override
int get hashCode => Object.hash(runtimeType,selectedType);

@override
String toString() {
  return 'PaymentState.orderTypeChanged(selectedType: $selectedType)';
}


}

/// @nodoc
abstract mixin class $OrderTypeChangedCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $OrderTypeChangedCopyWith(OrderTypeChanged value, $Res Function(OrderTypeChanged) _then) = _$OrderTypeChangedCopyWithImpl;
@useResult
$Res call({
 String selectedType
});




}
/// @nodoc
class _$OrderTypeChangedCopyWithImpl<$Res>
    implements $OrderTypeChangedCopyWith<$Res> {
  _$OrderTypeChangedCopyWithImpl(this._self, this._then);

  final OrderTypeChanged _self;
  final $Res Function(OrderTypeChanged) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedType = null,}) {
  return _then(OrderTypeChanged(
null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GetPendingOrdersLoading implements PaymentState {
  const GetPendingOrdersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPendingOrdersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState.getPendingOrdersLoading()';
}


}




/// @nodoc


class GetPendingOrdersError implements PaymentState {
  const GetPendingOrdersError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPendingOrdersErrorCopyWith<GetPendingOrdersError> get copyWith => _$GetPendingOrdersErrorCopyWithImpl<GetPendingOrdersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPendingOrdersError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'PaymentState.getPendingOrdersError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $GetPendingOrdersErrorCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $GetPendingOrdersErrorCopyWith(GetPendingOrdersError value, $Res Function(GetPendingOrdersError) _then) = _$GetPendingOrdersErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$GetPendingOrdersErrorCopyWithImpl<$Res>
    implements $GetPendingOrdersErrorCopyWith<$Res> {
  _$GetPendingOrdersErrorCopyWithImpl(this._self, this._then);

  final GetPendingOrdersError _self;
  final $Res Function(GetPendingOrdersError) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(GetPendingOrdersError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class GetPendingOrdersSuccess implements PaymentState {
  const GetPendingOrdersSuccess(this.getOrdersResponse);
  

 final  GetOrdersResponse getOrdersResponse;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPendingOrdersSuccessCopyWith<GetPendingOrdersSuccess> get copyWith => _$GetPendingOrdersSuccessCopyWithImpl<GetPendingOrdersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPendingOrdersSuccess&&(identical(other.getOrdersResponse, getOrdersResponse) || other.getOrdersResponse == getOrdersResponse));
}


@override
int get hashCode => Object.hash(runtimeType,getOrdersResponse);

@override
String toString() {
  return 'PaymentState.getPendingOrdersSuccess(getOrdersResponse: $getOrdersResponse)';
}


}

/// @nodoc
abstract mixin class $GetPendingOrdersSuccessCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $GetPendingOrdersSuccessCopyWith(GetPendingOrdersSuccess value, $Res Function(GetPendingOrdersSuccess) _then) = _$GetPendingOrdersSuccessCopyWithImpl;
@useResult
$Res call({
 GetOrdersResponse getOrdersResponse
});




}
/// @nodoc
class _$GetPendingOrdersSuccessCopyWithImpl<$Res>
    implements $GetPendingOrdersSuccessCopyWith<$Res> {
  _$GetPendingOrdersSuccessCopyWithImpl(this._self, this._then);

  final GetPendingOrdersSuccess _self;
  final $Res Function(GetPendingOrdersSuccess) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? getOrdersResponse = null,}) {
  return _then(GetPendingOrdersSuccess(
null == getOrdersResponse ? _self.getOrdersResponse : getOrdersResponse // ignore: cast_nullable_to_non_nullable
as GetOrdersResponse,
  ));
}


}

/// @nodoc


class AddPaymentOrdersLoading implements PaymentState {
  const AddPaymentOrdersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPaymentOrdersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PaymentState.addPaymentOrdersLoading()';
}


}




/// @nodoc


class AddPaymentOrdersError implements PaymentState {
  const AddPaymentOrdersError(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPaymentOrdersErrorCopyWith<AddPaymentOrdersError> get copyWith => _$AddPaymentOrdersErrorCopyWithImpl<AddPaymentOrdersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPaymentOrdersError&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'PaymentState.addPaymentOrdersError(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class $AddPaymentOrdersErrorCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $AddPaymentOrdersErrorCopyWith(AddPaymentOrdersError value, $Res Function(AddPaymentOrdersError) _then) = _$AddPaymentOrdersErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class _$AddPaymentOrdersErrorCopyWithImpl<$Res>
    implements $AddPaymentOrdersErrorCopyWith<$Res> {
  _$AddPaymentOrdersErrorCopyWithImpl(this._self, this._then);

  final AddPaymentOrdersError _self;
  final $Res Function(AddPaymentOrdersError) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(AddPaymentOrdersError(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class AddPaymentOrdersSuccess implements PaymentState {
  const AddPaymentOrdersSuccess(this.getOrdersResponse);
  

 final  ApiSuccessGeneralModel getOrdersResponse;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddPaymentOrdersSuccessCopyWith<AddPaymentOrdersSuccess> get copyWith => _$AddPaymentOrdersSuccessCopyWithImpl<AddPaymentOrdersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddPaymentOrdersSuccess&&(identical(other.getOrdersResponse, getOrdersResponse) || other.getOrdersResponse == getOrdersResponse));
}


@override
int get hashCode => Object.hash(runtimeType,getOrdersResponse);

@override
String toString() {
  return 'PaymentState.addPaymentOrdersSuccess(getOrdersResponse: $getOrdersResponse)';
}


}

/// @nodoc
abstract mixin class $AddPaymentOrdersSuccessCopyWith<$Res> implements $PaymentStateCopyWith<$Res> {
  factory $AddPaymentOrdersSuccessCopyWith(AddPaymentOrdersSuccess value, $Res Function(AddPaymentOrdersSuccess) _then) = _$AddPaymentOrdersSuccessCopyWithImpl;
@useResult
$Res call({
 ApiSuccessGeneralModel getOrdersResponse
});




}
/// @nodoc
class _$AddPaymentOrdersSuccessCopyWithImpl<$Res>
    implements $AddPaymentOrdersSuccessCopyWith<$Res> {
  _$AddPaymentOrdersSuccessCopyWithImpl(this._self, this._then);

  final AddPaymentOrdersSuccess _self;
  final $Res Function(AddPaymentOrdersSuccess) _then;

/// Create a copy of PaymentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? getOrdersResponse = null,}) {
  return _then(AddPaymentOrdersSuccess(
null == getOrdersResponse ? _self.getOrdersResponse : getOrdersResponse // ignore: cast_nullable_to_non_nullable
as ApiSuccessGeneralModel,
  ));
}


}

// dart format on
