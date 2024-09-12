// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) changeShippingIndex,
    required TResult Function(String choosePayment) choosePayment,
    required TResult Function() createCashOrderLoading,
    required TResult Function(int statesCode, String errorMessage)
        createCashOrderError,
    required TResult Function(CreateOrderResponse createOrderResponse)
        createCashOrderSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? changeShippingIndex,
    TResult? Function(String choosePayment)? choosePayment,
    TResult? Function()? createCashOrderLoading,
    TResult? Function(int statesCode, String errorMessage)?
        createCashOrderError,
    TResult? Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? changeShippingIndex,
    TResult Function(String choosePayment)? choosePayment,
    TResult Function()? createCashOrderLoading,
    TResult Function(int statesCode, String errorMessage)? createCashOrderError,
    TResult Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeShippingIndex value) changeShippingIndex,
    required TResult Function(ChoosePayment value) choosePayment,
    required TResult Function(CreateCashOrderLoading value)
        createCashOrderLoading,
    required TResult Function(CreateCashOrderError value) createCashOrderError,
    required TResult Function(CreateCashOrderSuccess value)
        createCashOrderSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult? Function(ChoosePayment value)? choosePayment,
    TResult? Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult? Function(CreateCashOrderError value)? createCashOrderError,
    TResult? Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult Function(ChoosePayment value)? choosePayment,
    TResult Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult Function(CreateCashOrderError value)? createCashOrderError,
    TResult Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStateCopyWith<$Res> {
  factory $PaymentStateCopyWith(
          PaymentState value, $Res Function(PaymentState) then) =
      _$PaymentStateCopyWithImpl<$Res, PaymentState>;
}

/// @nodoc
class _$PaymentStateCopyWithImpl<$Res, $Val extends PaymentState>
    implements $PaymentStateCopyWith<$Res> {
  _$PaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PaymentState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) changeShippingIndex,
    required TResult Function(String choosePayment) choosePayment,
    required TResult Function() createCashOrderLoading,
    required TResult Function(int statesCode, String errorMessage)
        createCashOrderError,
    required TResult Function(CreateOrderResponse createOrderResponse)
        createCashOrderSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? changeShippingIndex,
    TResult? Function(String choosePayment)? choosePayment,
    TResult? Function()? createCashOrderLoading,
    TResult? Function(int statesCode, String errorMessage)?
        createCashOrderError,
    TResult? Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? changeShippingIndex,
    TResult Function(String choosePayment)? choosePayment,
    TResult Function()? createCashOrderLoading,
    TResult Function(int statesCode, String errorMessage)? createCashOrderError,
    TResult Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeShippingIndex value) changeShippingIndex,
    required TResult Function(ChoosePayment value) choosePayment,
    required TResult Function(CreateCashOrderLoading value)
        createCashOrderLoading,
    required TResult Function(CreateCashOrderError value) createCashOrderError,
    required TResult Function(CreateCashOrderSuccess value)
        createCashOrderSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult? Function(ChoosePayment value)? choosePayment,
    TResult? Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult? Function(CreateCashOrderError value)? createCashOrderError,
    TResult? Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult Function(ChoosePayment value)? choosePayment,
    TResult Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult Function(CreateCashOrderError value)? createCashOrderError,
    TResult Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PaymentState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ChangeShippingIndexImplCopyWith<$Res> {
  factory _$$ChangeShippingIndexImplCopyWith(_$ChangeShippingIndexImpl value,
          $Res Function(_$ChangeShippingIndexImpl) then) =
      __$$ChangeShippingIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$ChangeShippingIndexImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$ChangeShippingIndexImpl>
    implements _$$ChangeShippingIndexImplCopyWith<$Res> {
  __$$ChangeShippingIndexImplCopyWithImpl(_$ChangeShippingIndexImpl _value,
      $Res Function(_$ChangeShippingIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$ChangeShippingIndexImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChangeShippingIndexImpl implements ChangeShippingIndex {
  const _$ChangeShippingIndexImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'PaymentState.changeShippingIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeShippingIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeShippingIndexImplCopyWith<_$ChangeShippingIndexImpl> get copyWith =>
      __$$ChangeShippingIndexImplCopyWithImpl<_$ChangeShippingIndexImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) changeShippingIndex,
    required TResult Function(String choosePayment) choosePayment,
    required TResult Function() createCashOrderLoading,
    required TResult Function(int statesCode, String errorMessage)
        createCashOrderError,
    required TResult Function(CreateOrderResponse createOrderResponse)
        createCashOrderSuccess,
  }) {
    return changeShippingIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? changeShippingIndex,
    TResult? Function(String choosePayment)? choosePayment,
    TResult? Function()? createCashOrderLoading,
    TResult? Function(int statesCode, String errorMessage)?
        createCashOrderError,
    TResult? Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
  }) {
    return changeShippingIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? changeShippingIndex,
    TResult Function(String choosePayment)? choosePayment,
    TResult Function()? createCashOrderLoading,
    TResult Function(int statesCode, String errorMessage)? createCashOrderError,
    TResult Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (changeShippingIndex != null) {
      return changeShippingIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeShippingIndex value) changeShippingIndex,
    required TResult Function(ChoosePayment value) choosePayment,
    required TResult Function(CreateCashOrderLoading value)
        createCashOrderLoading,
    required TResult Function(CreateCashOrderError value) createCashOrderError,
    required TResult Function(CreateCashOrderSuccess value)
        createCashOrderSuccess,
  }) {
    return changeShippingIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult? Function(ChoosePayment value)? choosePayment,
    TResult? Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult? Function(CreateCashOrderError value)? createCashOrderError,
    TResult? Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
  }) {
    return changeShippingIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult Function(ChoosePayment value)? choosePayment,
    TResult Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult Function(CreateCashOrderError value)? createCashOrderError,
    TResult Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (changeShippingIndex != null) {
      return changeShippingIndex(this);
    }
    return orElse();
  }
}

abstract class ChangeShippingIndex implements PaymentState {
  const factory ChangeShippingIndex(final int index) =
      _$ChangeShippingIndexImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$ChangeShippingIndexImplCopyWith<_$ChangeShippingIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChoosePaymentImplCopyWith<$Res> {
  factory _$$ChoosePaymentImplCopyWith(
          _$ChoosePaymentImpl value, $Res Function(_$ChoosePaymentImpl) then) =
      __$$ChoosePaymentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String choosePayment});
}

/// @nodoc
class __$$ChoosePaymentImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$ChoosePaymentImpl>
    implements _$$ChoosePaymentImplCopyWith<$Res> {
  __$$ChoosePaymentImplCopyWithImpl(
      _$ChoosePaymentImpl _value, $Res Function(_$ChoosePaymentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? choosePayment = null,
  }) {
    return _then(_$ChoosePaymentImpl(
      null == choosePayment
          ? _value.choosePayment
          : choosePayment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChoosePaymentImpl implements ChoosePayment {
  const _$ChoosePaymentImpl(this.choosePayment);

  @override
  final String choosePayment;

  @override
  String toString() {
    return 'PaymentState.choosePayment(choosePayment: $choosePayment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChoosePaymentImpl &&
            (identical(other.choosePayment, choosePayment) ||
                other.choosePayment == choosePayment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, choosePayment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChoosePaymentImplCopyWith<_$ChoosePaymentImpl> get copyWith =>
      __$$ChoosePaymentImplCopyWithImpl<_$ChoosePaymentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) changeShippingIndex,
    required TResult Function(String choosePayment) choosePayment,
    required TResult Function() createCashOrderLoading,
    required TResult Function(int statesCode, String errorMessage)
        createCashOrderError,
    required TResult Function(CreateOrderResponse createOrderResponse)
        createCashOrderSuccess,
  }) {
    return choosePayment(this.choosePayment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? changeShippingIndex,
    TResult? Function(String choosePayment)? choosePayment,
    TResult? Function()? createCashOrderLoading,
    TResult? Function(int statesCode, String errorMessage)?
        createCashOrderError,
    TResult? Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
  }) {
    return choosePayment?.call(this.choosePayment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? changeShippingIndex,
    TResult Function(String choosePayment)? choosePayment,
    TResult Function()? createCashOrderLoading,
    TResult Function(int statesCode, String errorMessage)? createCashOrderError,
    TResult Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (choosePayment != null) {
      return choosePayment(this.choosePayment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeShippingIndex value) changeShippingIndex,
    required TResult Function(ChoosePayment value) choosePayment,
    required TResult Function(CreateCashOrderLoading value)
        createCashOrderLoading,
    required TResult Function(CreateCashOrderError value) createCashOrderError,
    required TResult Function(CreateCashOrderSuccess value)
        createCashOrderSuccess,
  }) {
    return choosePayment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult? Function(ChoosePayment value)? choosePayment,
    TResult? Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult? Function(CreateCashOrderError value)? createCashOrderError,
    TResult? Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
  }) {
    return choosePayment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult Function(ChoosePayment value)? choosePayment,
    TResult Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult Function(CreateCashOrderError value)? createCashOrderError,
    TResult Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (choosePayment != null) {
      return choosePayment(this);
    }
    return orElse();
  }
}

abstract class ChoosePayment implements PaymentState {
  const factory ChoosePayment(final String choosePayment) = _$ChoosePaymentImpl;

  String get choosePayment;
  @JsonKey(ignore: true)
  _$$ChoosePaymentImplCopyWith<_$ChoosePaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateCashOrderLoadingImplCopyWith<$Res> {
  factory _$$CreateCashOrderLoadingImplCopyWith(
          _$CreateCashOrderLoadingImpl value,
          $Res Function(_$CreateCashOrderLoadingImpl) then) =
      __$$CreateCashOrderLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateCashOrderLoadingImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$CreateCashOrderLoadingImpl>
    implements _$$CreateCashOrderLoadingImplCopyWith<$Res> {
  __$$CreateCashOrderLoadingImplCopyWithImpl(
      _$CreateCashOrderLoadingImpl _value,
      $Res Function(_$CreateCashOrderLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateCashOrderLoadingImpl implements CreateCashOrderLoading {
  const _$CreateCashOrderLoadingImpl();

  @override
  String toString() {
    return 'PaymentState.createCashOrderLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCashOrderLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) changeShippingIndex,
    required TResult Function(String choosePayment) choosePayment,
    required TResult Function() createCashOrderLoading,
    required TResult Function(int statesCode, String errorMessage)
        createCashOrderError,
    required TResult Function(CreateOrderResponse createOrderResponse)
        createCashOrderSuccess,
  }) {
    return createCashOrderLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? changeShippingIndex,
    TResult? Function(String choosePayment)? choosePayment,
    TResult? Function()? createCashOrderLoading,
    TResult? Function(int statesCode, String errorMessage)?
        createCashOrderError,
    TResult? Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
  }) {
    return createCashOrderLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? changeShippingIndex,
    TResult Function(String choosePayment)? choosePayment,
    TResult Function()? createCashOrderLoading,
    TResult Function(int statesCode, String errorMessage)? createCashOrderError,
    TResult Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (createCashOrderLoading != null) {
      return createCashOrderLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeShippingIndex value) changeShippingIndex,
    required TResult Function(ChoosePayment value) choosePayment,
    required TResult Function(CreateCashOrderLoading value)
        createCashOrderLoading,
    required TResult Function(CreateCashOrderError value) createCashOrderError,
    required TResult Function(CreateCashOrderSuccess value)
        createCashOrderSuccess,
  }) {
    return createCashOrderLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult? Function(ChoosePayment value)? choosePayment,
    TResult? Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult? Function(CreateCashOrderError value)? createCashOrderError,
    TResult? Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
  }) {
    return createCashOrderLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult Function(ChoosePayment value)? choosePayment,
    TResult Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult Function(CreateCashOrderError value)? createCashOrderError,
    TResult Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (createCashOrderLoading != null) {
      return createCashOrderLoading(this);
    }
    return orElse();
  }
}

abstract class CreateCashOrderLoading implements PaymentState {
  const factory CreateCashOrderLoading() = _$CreateCashOrderLoadingImpl;
}

/// @nodoc
abstract class _$$CreateCashOrderErrorImplCopyWith<$Res> {
  factory _$$CreateCashOrderErrorImplCopyWith(_$CreateCashOrderErrorImpl value,
          $Res Function(_$CreateCashOrderErrorImpl) then) =
      __$$CreateCashOrderErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int statesCode, String errorMessage});
}

/// @nodoc
class __$$CreateCashOrderErrorImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$CreateCashOrderErrorImpl>
    implements _$$CreateCashOrderErrorImplCopyWith<$Res> {
  __$$CreateCashOrderErrorImplCopyWithImpl(_$CreateCashOrderErrorImpl _value,
      $Res Function(_$CreateCashOrderErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statesCode = null,
    Object? errorMessage = null,
  }) {
    return _then(_$CreateCashOrderErrorImpl(
      statesCode: null == statesCode
          ? _value.statesCode
          : statesCode // ignore: cast_nullable_to_non_nullable
              as int,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateCashOrderErrorImpl implements CreateCashOrderError {
  const _$CreateCashOrderErrorImpl(
      {required this.statesCode, required this.errorMessage});

  @override
  final int statesCode;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'PaymentState.createCashOrderError(statesCode: $statesCode, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCashOrderErrorImpl &&
            (identical(other.statesCode, statesCode) ||
                other.statesCode == statesCode) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statesCode, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCashOrderErrorImplCopyWith<_$CreateCashOrderErrorImpl>
      get copyWith =>
          __$$CreateCashOrderErrorImplCopyWithImpl<_$CreateCashOrderErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) changeShippingIndex,
    required TResult Function(String choosePayment) choosePayment,
    required TResult Function() createCashOrderLoading,
    required TResult Function(int statesCode, String errorMessage)
        createCashOrderError,
    required TResult Function(CreateOrderResponse createOrderResponse)
        createCashOrderSuccess,
  }) {
    return createCashOrderError(statesCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? changeShippingIndex,
    TResult? Function(String choosePayment)? choosePayment,
    TResult? Function()? createCashOrderLoading,
    TResult? Function(int statesCode, String errorMessage)?
        createCashOrderError,
    TResult? Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
  }) {
    return createCashOrderError?.call(statesCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? changeShippingIndex,
    TResult Function(String choosePayment)? choosePayment,
    TResult Function()? createCashOrderLoading,
    TResult Function(int statesCode, String errorMessage)? createCashOrderError,
    TResult Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (createCashOrderError != null) {
      return createCashOrderError(statesCode, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeShippingIndex value) changeShippingIndex,
    required TResult Function(ChoosePayment value) choosePayment,
    required TResult Function(CreateCashOrderLoading value)
        createCashOrderLoading,
    required TResult Function(CreateCashOrderError value) createCashOrderError,
    required TResult Function(CreateCashOrderSuccess value)
        createCashOrderSuccess,
  }) {
    return createCashOrderError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult? Function(ChoosePayment value)? choosePayment,
    TResult? Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult? Function(CreateCashOrderError value)? createCashOrderError,
    TResult? Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
  }) {
    return createCashOrderError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult Function(ChoosePayment value)? choosePayment,
    TResult Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult Function(CreateCashOrderError value)? createCashOrderError,
    TResult Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (createCashOrderError != null) {
      return createCashOrderError(this);
    }
    return orElse();
  }
}

abstract class CreateCashOrderError implements PaymentState {
  const factory CreateCashOrderError(
      {required final int statesCode,
      required final String errorMessage}) = _$CreateCashOrderErrorImpl;

  int get statesCode;
  String get errorMessage;
  @JsonKey(ignore: true)
  _$$CreateCashOrderErrorImplCopyWith<_$CreateCashOrderErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateCashOrderSuccessImplCopyWith<$Res> {
  factory _$$CreateCashOrderSuccessImplCopyWith(
          _$CreateCashOrderSuccessImpl value,
          $Res Function(_$CreateCashOrderSuccessImpl) then) =
      __$$CreateCashOrderSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateOrderResponse createOrderResponse});
}

/// @nodoc
class __$$CreateCashOrderSuccessImplCopyWithImpl<$Res>
    extends _$PaymentStateCopyWithImpl<$Res, _$CreateCashOrderSuccessImpl>
    implements _$$CreateCashOrderSuccessImplCopyWith<$Res> {
  __$$CreateCashOrderSuccessImplCopyWithImpl(
      _$CreateCashOrderSuccessImpl _value,
      $Res Function(_$CreateCashOrderSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createOrderResponse = null,
  }) {
    return _then(_$CreateCashOrderSuccessImpl(
      null == createOrderResponse
          ? _value.createOrderResponse
          : createOrderResponse // ignore: cast_nullable_to_non_nullable
              as CreateOrderResponse,
    ));
  }
}

/// @nodoc

class _$CreateCashOrderSuccessImpl implements CreateCashOrderSuccess {
  const _$CreateCashOrderSuccessImpl(this.createOrderResponse);

  @override
  final CreateOrderResponse createOrderResponse;

  @override
  String toString() {
    return 'PaymentState.createCashOrderSuccess(createOrderResponse: $createOrderResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateCashOrderSuccessImpl &&
            (identical(other.createOrderResponse, createOrderResponse) ||
                other.createOrderResponse == createOrderResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createOrderResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateCashOrderSuccessImplCopyWith<_$CreateCashOrderSuccessImpl>
      get copyWith => __$$CreateCashOrderSuccessImplCopyWithImpl<
          _$CreateCashOrderSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int index) changeShippingIndex,
    required TResult Function(String choosePayment) choosePayment,
    required TResult Function() createCashOrderLoading,
    required TResult Function(int statesCode, String errorMessage)
        createCashOrderError,
    required TResult Function(CreateOrderResponse createOrderResponse)
        createCashOrderSuccess,
  }) {
    return createCashOrderSuccess(createOrderResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int index)? changeShippingIndex,
    TResult? Function(String choosePayment)? choosePayment,
    TResult? Function()? createCashOrderLoading,
    TResult? Function(int statesCode, String errorMessage)?
        createCashOrderError,
    TResult? Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
  }) {
    return createCashOrderSuccess?.call(createOrderResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int index)? changeShippingIndex,
    TResult Function(String choosePayment)? choosePayment,
    TResult Function()? createCashOrderLoading,
    TResult Function(int statesCode, String errorMessage)? createCashOrderError,
    TResult Function(CreateOrderResponse createOrderResponse)?
        createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (createCashOrderSuccess != null) {
      return createCashOrderSuccess(createOrderResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ChangeShippingIndex value) changeShippingIndex,
    required TResult Function(ChoosePayment value) choosePayment,
    required TResult Function(CreateCashOrderLoading value)
        createCashOrderLoading,
    required TResult Function(CreateCashOrderError value) createCashOrderError,
    required TResult Function(CreateCashOrderSuccess value)
        createCashOrderSuccess,
  }) {
    return createCashOrderSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult? Function(ChoosePayment value)? choosePayment,
    TResult? Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult? Function(CreateCashOrderError value)? createCashOrderError,
    TResult? Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
  }) {
    return createCashOrderSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ChangeShippingIndex value)? changeShippingIndex,
    TResult Function(ChoosePayment value)? choosePayment,
    TResult Function(CreateCashOrderLoading value)? createCashOrderLoading,
    TResult Function(CreateCashOrderError value)? createCashOrderError,
    TResult Function(CreateCashOrderSuccess value)? createCashOrderSuccess,
    required TResult orElse(),
  }) {
    if (createCashOrderSuccess != null) {
      return createCashOrderSuccess(this);
    }
    return orElse();
  }
}

abstract class CreateCashOrderSuccess implements PaymentState {
  const factory CreateCashOrderSuccess(
          final CreateOrderResponse createOrderResponse) =
      _$CreateCashOrderSuccessImpl;

  CreateOrderResponse get createOrderResponse;
  @JsonKey(ignore: true)
  _$$CreateCashOrderSuccessImplCopyWith<_$CreateCashOrderSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}
