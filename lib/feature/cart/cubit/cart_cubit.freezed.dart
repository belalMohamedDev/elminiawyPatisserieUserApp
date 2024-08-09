// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addItemToCartLoading,
    required TResult Function(int statesCode, String errorMessage)
        addItemToCartError,
    required TResult Function(AddItemToCartResponse data) addItemToCartSuccess,
    required TResult Function(int quantity) updateQuantityNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addItemToCartLoading,
    TResult? Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult? Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult? Function(int quantity)? updateQuantityNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addItemToCartLoading,
    TResult Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult Function(int quantity)? updateQuantityNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddItemToCartLoading value) addItemToCartLoading,
    required TResult Function(AddItemToCartError value) addItemToCartError,
    required TResult Function(AddItemToCartSuccess value) addItemToCartSuccess,
    required TResult Function(UpdateQuantityNumber value) updateQuantityNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult? Function(AddItemToCartError value)? addItemToCartError,
    TResult? Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult? Function(UpdateQuantityNumber value)? updateQuantityNumber,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult Function(AddItemToCartError value)? addItemToCartError,
    TResult Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult Function(UpdateQuantityNumber value)? updateQuantityNumber,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

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
    extends _$CartStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CartState.initial()';
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
    required TResult Function() addItemToCartLoading,
    required TResult Function(int statesCode, String errorMessage)
        addItemToCartError,
    required TResult Function(AddItemToCartResponse data) addItemToCartSuccess,
    required TResult Function(int quantity) updateQuantityNumber,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addItemToCartLoading,
    TResult? Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult? Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult? Function(int quantity)? updateQuantityNumber,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addItemToCartLoading,
    TResult Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult Function(int quantity)? updateQuantityNumber,
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
    required TResult Function(AddItemToCartLoading value) addItemToCartLoading,
    required TResult Function(AddItemToCartError value) addItemToCartError,
    required TResult Function(AddItemToCartSuccess value) addItemToCartSuccess,
    required TResult Function(UpdateQuantityNumber value) updateQuantityNumber,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult? Function(AddItemToCartError value)? addItemToCartError,
    TResult? Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult? Function(UpdateQuantityNumber value)? updateQuantityNumber,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult Function(AddItemToCartError value)? addItemToCartError,
    TResult Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult Function(UpdateQuantityNumber value)? updateQuantityNumber,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$AddItemToCartLoadingImplCopyWith<$Res> {
  factory _$$AddItemToCartLoadingImplCopyWith(_$AddItemToCartLoadingImpl value,
          $Res Function(_$AddItemToCartLoadingImpl) then) =
      __$$AddItemToCartLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddItemToCartLoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$AddItemToCartLoadingImpl>
    implements _$$AddItemToCartLoadingImplCopyWith<$Res> {
  __$$AddItemToCartLoadingImplCopyWithImpl(_$AddItemToCartLoadingImpl _value,
      $Res Function(_$AddItemToCartLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddItemToCartLoadingImpl implements AddItemToCartLoading {
  const _$AddItemToCartLoadingImpl();

  @override
  String toString() {
    return 'CartState.addItemToCartLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemToCartLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addItemToCartLoading,
    required TResult Function(int statesCode, String errorMessage)
        addItemToCartError,
    required TResult Function(AddItemToCartResponse data) addItemToCartSuccess,
    required TResult Function(int quantity) updateQuantityNumber,
  }) {
    return addItemToCartLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addItemToCartLoading,
    TResult? Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult? Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult? Function(int quantity)? updateQuantityNumber,
  }) {
    return addItemToCartLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addItemToCartLoading,
    TResult Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult Function(int quantity)? updateQuantityNumber,
    required TResult orElse(),
  }) {
    if (addItemToCartLoading != null) {
      return addItemToCartLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddItemToCartLoading value) addItemToCartLoading,
    required TResult Function(AddItemToCartError value) addItemToCartError,
    required TResult Function(AddItemToCartSuccess value) addItemToCartSuccess,
    required TResult Function(UpdateQuantityNumber value) updateQuantityNumber,
  }) {
    return addItemToCartLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult? Function(AddItemToCartError value)? addItemToCartError,
    TResult? Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult? Function(UpdateQuantityNumber value)? updateQuantityNumber,
  }) {
    return addItemToCartLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult Function(AddItemToCartError value)? addItemToCartError,
    TResult Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult Function(UpdateQuantityNumber value)? updateQuantityNumber,
    required TResult orElse(),
  }) {
    if (addItemToCartLoading != null) {
      return addItemToCartLoading(this);
    }
    return orElse();
  }
}

abstract class AddItemToCartLoading implements CartState {
  const factory AddItemToCartLoading() = _$AddItemToCartLoadingImpl;
}

/// @nodoc
abstract class _$$AddItemToCartErrorImplCopyWith<$Res> {
  factory _$$AddItemToCartErrorImplCopyWith(_$AddItemToCartErrorImpl value,
          $Res Function(_$AddItemToCartErrorImpl) then) =
      __$$AddItemToCartErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int statesCode, String errorMessage});
}

/// @nodoc
class __$$AddItemToCartErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$AddItemToCartErrorImpl>
    implements _$$AddItemToCartErrorImplCopyWith<$Res> {
  __$$AddItemToCartErrorImplCopyWithImpl(_$AddItemToCartErrorImpl _value,
      $Res Function(_$AddItemToCartErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statesCode = null,
    Object? errorMessage = null,
  }) {
    return _then(_$AddItemToCartErrorImpl(
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

class _$AddItemToCartErrorImpl implements AddItemToCartError {
  const _$AddItemToCartErrorImpl(
      {required this.statesCode, required this.errorMessage});

  @override
  final int statesCode;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'CartState.addItemToCartError(statesCode: $statesCode, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemToCartErrorImpl &&
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
  _$$AddItemToCartErrorImplCopyWith<_$AddItemToCartErrorImpl> get copyWith =>
      __$$AddItemToCartErrorImplCopyWithImpl<_$AddItemToCartErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addItemToCartLoading,
    required TResult Function(int statesCode, String errorMessage)
        addItemToCartError,
    required TResult Function(AddItemToCartResponse data) addItemToCartSuccess,
    required TResult Function(int quantity) updateQuantityNumber,
  }) {
    return addItemToCartError(statesCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addItemToCartLoading,
    TResult? Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult? Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult? Function(int quantity)? updateQuantityNumber,
  }) {
    return addItemToCartError?.call(statesCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addItemToCartLoading,
    TResult Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult Function(int quantity)? updateQuantityNumber,
    required TResult orElse(),
  }) {
    if (addItemToCartError != null) {
      return addItemToCartError(statesCode, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddItemToCartLoading value) addItemToCartLoading,
    required TResult Function(AddItemToCartError value) addItemToCartError,
    required TResult Function(AddItemToCartSuccess value) addItemToCartSuccess,
    required TResult Function(UpdateQuantityNumber value) updateQuantityNumber,
  }) {
    return addItemToCartError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult? Function(AddItemToCartError value)? addItemToCartError,
    TResult? Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult? Function(UpdateQuantityNumber value)? updateQuantityNumber,
  }) {
    return addItemToCartError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult Function(AddItemToCartError value)? addItemToCartError,
    TResult Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult Function(UpdateQuantityNumber value)? updateQuantityNumber,
    required TResult orElse(),
  }) {
    if (addItemToCartError != null) {
      return addItemToCartError(this);
    }
    return orElse();
  }
}

abstract class AddItemToCartError implements CartState {
  const factory AddItemToCartError(
      {required final int statesCode,
      required final String errorMessage}) = _$AddItemToCartErrorImpl;

  int get statesCode;
  String get errorMessage;
  @JsonKey(ignore: true)
  _$$AddItemToCartErrorImplCopyWith<_$AddItemToCartErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddItemToCartSuccessImplCopyWith<$Res> {
  factory _$$AddItemToCartSuccessImplCopyWith(_$AddItemToCartSuccessImpl value,
          $Res Function(_$AddItemToCartSuccessImpl) then) =
      __$$AddItemToCartSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddItemToCartResponse data});
}

/// @nodoc
class __$$AddItemToCartSuccessImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$AddItemToCartSuccessImpl>
    implements _$$AddItemToCartSuccessImplCopyWith<$Res> {
  __$$AddItemToCartSuccessImplCopyWithImpl(_$AddItemToCartSuccessImpl _value,
      $Res Function(_$AddItemToCartSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$AddItemToCartSuccessImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AddItemToCartResponse,
    ));
  }
}

/// @nodoc

class _$AddItemToCartSuccessImpl implements AddItemToCartSuccess {
  const _$AddItemToCartSuccessImpl(this.data);

  @override
  final AddItemToCartResponse data;

  @override
  String toString() {
    return 'CartState.addItemToCartSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddItemToCartSuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddItemToCartSuccessImplCopyWith<_$AddItemToCartSuccessImpl>
      get copyWith =>
          __$$AddItemToCartSuccessImplCopyWithImpl<_$AddItemToCartSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addItemToCartLoading,
    required TResult Function(int statesCode, String errorMessage)
        addItemToCartError,
    required TResult Function(AddItemToCartResponse data) addItemToCartSuccess,
    required TResult Function(int quantity) updateQuantityNumber,
  }) {
    return addItemToCartSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addItemToCartLoading,
    TResult? Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult? Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult? Function(int quantity)? updateQuantityNumber,
  }) {
    return addItemToCartSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addItemToCartLoading,
    TResult Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult Function(int quantity)? updateQuantityNumber,
    required TResult orElse(),
  }) {
    if (addItemToCartSuccess != null) {
      return addItemToCartSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddItemToCartLoading value) addItemToCartLoading,
    required TResult Function(AddItemToCartError value) addItemToCartError,
    required TResult Function(AddItemToCartSuccess value) addItemToCartSuccess,
    required TResult Function(UpdateQuantityNumber value) updateQuantityNumber,
  }) {
    return addItemToCartSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult? Function(AddItemToCartError value)? addItemToCartError,
    TResult? Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult? Function(UpdateQuantityNumber value)? updateQuantityNumber,
  }) {
    return addItemToCartSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult Function(AddItemToCartError value)? addItemToCartError,
    TResult Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult Function(UpdateQuantityNumber value)? updateQuantityNumber,
    required TResult orElse(),
  }) {
    if (addItemToCartSuccess != null) {
      return addItemToCartSuccess(this);
    }
    return orElse();
  }
}

abstract class AddItemToCartSuccess implements CartState {
  const factory AddItemToCartSuccess(final AddItemToCartResponse data) =
      _$AddItemToCartSuccessImpl;

  AddItemToCartResponse get data;
  @JsonKey(ignore: true)
  _$$AddItemToCartSuccessImplCopyWith<_$AddItemToCartSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateQuantityNumberImplCopyWith<$Res> {
  factory _$$UpdateQuantityNumberImplCopyWith(_$UpdateQuantityNumberImpl value,
          $Res Function(_$UpdateQuantityNumberImpl) then) =
      __$$UpdateQuantityNumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int quantity});
}

/// @nodoc
class __$$UpdateQuantityNumberImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$UpdateQuantityNumberImpl>
    implements _$$UpdateQuantityNumberImplCopyWith<$Res> {
  __$$UpdateQuantityNumberImplCopyWithImpl(_$UpdateQuantityNumberImpl _value,
      $Res Function(_$UpdateQuantityNumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
  }) {
    return _then(_$UpdateQuantityNumberImpl(
      null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateQuantityNumberImpl implements UpdateQuantityNumber {
  const _$UpdateQuantityNumberImpl(this.quantity);

  @override
  final int quantity;

  @override
  String toString() {
    return 'CartState.updateQuantityNumber(quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateQuantityNumberImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateQuantityNumberImplCopyWith<_$UpdateQuantityNumberImpl>
      get copyWith =>
          __$$UpdateQuantityNumberImplCopyWithImpl<_$UpdateQuantityNumberImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() addItemToCartLoading,
    required TResult Function(int statesCode, String errorMessage)
        addItemToCartError,
    required TResult Function(AddItemToCartResponse data) addItemToCartSuccess,
    required TResult Function(int quantity) updateQuantityNumber,
  }) {
    return updateQuantityNumber(quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? addItemToCartLoading,
    TResult? Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult? Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult? Function(int quantity)? updateQuantityNumber,
  }) {
    return updateQuantityNumber?.call(quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? addItemToCartLoading,
    TResult Function(int statesCode, String errorMessage)? addItemToCartError,
    TResult Function(AddItemToCartResponse data)? addItemToCartSuccess,
    TResult Function(int quantity)? updateQuantityNumber,
    required TResult orElse(),
  }) {
    if (updateQuantityNumber != null) {
      return updateQuantityNumber(quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(AddItemToCartLoading value) addItemToCartLoading,
    required TResult Function(AddItemToCartError value) addItemToCartError,
    required TResult Function(AddItemToCartSuccess value) addItemToCartSuccess,
    required TResult Function(UpdateQuantityNumber value) updateQuantityNumber,
  }) {
    return updateQuantityNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult? Function(AddItemToCartError value)? addItemToCartError,
    TResult? Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult? Function(UpdateQuantityNumber value)? updateQuantityNumber,
  }) {
    return updateQuantityNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(AddItemToCartLoading value)? addItemToCartLoading,
    TResult Function(AddItemToCartError value)? addItemToCartError,
    TResult Function(AddItemToCartSuccess value)? addItemToCartSuccess,
    TResult Function(UpdateQuantityNumber value)? updateQuantityNumber,
    required TResult orElse(),
  }) {
    if (updateQuantityNumber != null) {
      return updateQuantityNumber(this);
    }
    return orElse();
  }
}

abstract class UpdateQuantityNumber implements CartState {
  const factory UpdateQuantityNumber(final int quantity) =
      _$UpdateQuantityNumberImpl;

  int get quantity;
  @JsonKey(ignore: true)
  _$$UpdateQuantityNumberImplCopyWith<_$UpdateQuantityNumberImpl>
      get copyWith => throw _privateConstructorUsedError;
}
