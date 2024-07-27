// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getProductLoading,
    required TResult Function(int statesCode, String errorMessage)
        getProductError,
    required TResult Function(ProductResponse data) getProductSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getProductLoading,
    TResult? Function(int statesCode, String errorMessage)? getProductError,
    TResult? Function(ProductResponse data)? getProductSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getProductLoading,
    TResult Function(int statesCode, String errorMessage)? getProductError,
    TResult Function(ProductResponse data)? getProductSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetProductLoading value) getProductLoading,
    required TResult Function(GetProductError value) getProductError,
    required TResult Function(GetProductSuccess value) getProductSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetProductLoading value)? getProductLoading,
    TResult? Function(GetProductError value)? getProductError,
    TResult? Function(GetProductSuccess value)? getProductSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetProductLoading value)? getProductLoading,
    TResult Function(GetProductError value)? getProductError,
    TResult Function(GetProductSuccess value)? getProductSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

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
    extends _$ProductStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ProductState.initial()';
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
    required TResult Function() getProductLoading,
    required TResult Function(int statesCode, String errorMessage)
        getProductError,
    required TResult Function(ProductResponse data) getProductSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getProductLoading,
    TResult? Function(int statesCode, String errorMessage)? getProductError,
    TResult? Function(ProductResponse data)? getProductSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getProductLoading,
    TResult Function(int statesCode, String errorMessage)? getProductError,
    TResult Function(ProductResponse data)? getProductSuccess,
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
    required TResult Function(GetProductLoading value) getProductLoading,
    required TResult Function(GetProductError value) getProductError,
    required TResult Function(GetProductSuccess value) getProductSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetProductLoading value)? getProductLoading,
    TResult? Function(GetProductError value)? getProductError,
    TResult? Function(GetProductSuccess value)? getProductSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetProductLoading value)? getProductLoading,
    TResult Function(GetProductError value)? getProductError,
    TResult Function(GetProductSuccess value)? getProductSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$GetProductLoadingImplCopyWith<$Res> {
  factory _$$GetProductLoadingImplCopyWith(_$GetProductLoadingImpl value,
          $Res Function(_$GetProductLoadingImpl) then) =
      __$$GetProductLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProductLoadingImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$GetProductLoadingImpl>
    implements _$$GetProductLoadingImplCopyWith<$Res> {
  __$$GetProductLoadingImplCopyWithImpl(_$GetProductLoadingImpl _value,
      $Res Function(_$GetProductLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetProductLoadingImpl implements GetProductLoading {
  const _$GetProductLoadingImpl();

  @override
  String toString() {
    return 'ProductState.getProductLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetProductLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getProductLoading,
    required TResult Function(int statesCode, String errorMessage)
        getProductError,
    required TResult Function(ProductResponse data) getProductSuccess,
  }) {
    return getProductLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getProductLoading,
    TResult? Function(int statesCode, String errorMessage)? getProductError,
    TResult? Function(ProductResponse data)? getProductSuccess,
  }) {
    return getProductLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getProductLoading,
    TResult Function(int statesCode, String errorMessage)? getProductError,
    TResult Function(ProductResponse data)? getProductSuccess,
    required TResult orElse(),
  }) {
    if (getProductLoading != null) {
      return getProductLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetProductLoading value) getProductLoading,
    required TResult Function(GetProductError value) getProductError,
    required TResult Function(GetProductSuccess value) getProductSuccess,
  }) {
    return getProductLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetProductLoading value)? getProductLoading,
    TResult? Function(GetProductError value)? getProductError,
    TResult? Function(GetProductSuccess value)? getProductSuccess,
  }) {
    return getProductLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetProductLoading value)? getProductLoading,
    TResult Function(GetProductError value)? getProductError,
    TResult Function(GetProductSuccess value)? getProductSuccess,
    required TResult orElse(),
  }) {
    if (getProductLoading != null) {
      return getProductLoading(this);
    }
    return orElse();
  }
}

abstract class GetProductLoading implements ProductState {
  const factory GetProductLoading() = _$GetProductLoadingImpl;
}

/// @nodoc
abstract class _$$GetProductErrorImplCopyWith<$Res> {
  factory _$$GetProductErrorImplCopyWith(_$GetProductErrorImpl value,
          $Res Function(_$GetProductErrorImpl) then) =
      __$$GetProductErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int statesCode, String errorMessage});
}

/// @nodoc
class __$$GetProductErrorImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$GetProductErrorImpl>
    implements _$$GetProductErrorImplCopyWith<$Res> {
  __$$GetProductErrorImplCopyWithImpl(
      _$GetProductErrorImpl _value, $Res Function(_$GetProductErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statesCode = null,
    Object? errorMessage = null,
  }) {
    return _then(_$GetProductErrorImpl(
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

class _$GetProductErrorImpl implements GetProductError {
  const _$GetProductErrorImpl(
      {required this.statesCode, required this.errorMessage});

  @override
  final int statesCode;
  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ProductState.getProductError(statesCode: $statesCode, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductErrorImpl &&
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
  _$$GetProductErrorImplCopyWith<_$GetProductErrorImpl> get copyWith =>
      __$$GetProductErrorImplCopyWithImpl<_$GetProductErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getProductLoading,
    required TResult Function(int statesCode, String errorMessage)
        getProductError,
    required TResult Function(ProductResponse data) getProductSuccess,
  }) {
    return getProductError(statesCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getProductLoading,
    TResult? Function(int statesCode, String errorMessage)? getProductError,
    TResult? Function(ProductResponse data)? getProductSuccess,
  }) {
    return getProductError?.call(statesCode, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getProductLoading,
    TResult Function(int statesCode, String errorMessage)? getProductError,
    TResult Function(ProductResponse data)? getProductSuccess,
    required TResult orElse(),
  }) {
    if (getProductError != null) {
      return getProductError(statesCode, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetProductLoading value) getProductLoading,
    required TResult Function(GetProductError value) getProductError,
    required TResult Function(GetProductSuccess value) getProductSuccess,
  }) {
    return getProductError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetProductLoading value)? getProductLoading,
    TResult? Function(GetProductError value)? getProductError,
    TResult? Function(GetProductSuccess value)? getProductSuccess,
  }) {
    return getProductError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetProductLoading value)? getProductLoading,
    TResult Function(GetProductError value)? getProductError,
    TResult Function(GetProductSuccess value)? getProductSuccess,
    required TResult orElse(),
  }) {
    if (getProductError != null) {
      return getProductError(this);
    }
    return orElse();
  }
}

abstract class GetProductError implements ProductState {
  const factory GetProductError(
      {required final int statesCode,
      required final String errorMessage}) = _$GetProductErrorImpl;

  int get statesCode;
  String get errorMessage;
  @JsonKey(ignore: true)
  _$$GetProductErrorImplCopyWith<_$GetProductErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProductSuccessImplCopyWith<$Res> {
  factory _$$GetProductSuccessImplCopyWith(_$GetProductSuccessImpl value,
          $Res Function(_$GetProductSuccessImpl) then) =
      __$$GetProductSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductResponse data});
}

/// @nodoc
class __$$GetProductSuccessImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$GetProductSuccessImpl>
    implements _$$GetProductSuccessImplCopyWith<$Res> {
  __$$GetProductSuccessImplCopyWithImpl(_$GetProductSuccessImpl _value,
      $Res Function(_$GetProductSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetProductSuccessImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProductResponse,
    ));
  }
}

/// @nodoc

class _$GetProductSuccessImpl implements GetProductSuccess {
  const _$GetProductSuccessImpl(this.data);

  @override
  final ProductResponse data;

  @override
  String toString() {
    return 'ProductState.getProductSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductSuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductSuccessImplCopyWith<_$GetProductSuccessImpl> get copyWith =>
      __$$GetProductSuccessImplCopyWithImpl<_$GetProductSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() getProductLoading,
    required TResult Function(int statesCode, String errorMessage)
        getProductError,
    required TResult Function(ProductResponse data) getProductSuccess,
  }) {
    return getProductSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? getProductLoading,
    TResult? Function(int statesCode, String errorMessage)? getProductError,
    TResult? Function(ProductResponse data)? getProductSuccess,
  }) {
    return getProductSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? getProductLoading,
    TResult Function(int statesCode, String errorMessage)? getProductError,
    TResult Function(ProductResponse data)? getProductSuccess,
    required TResult orElse(),
  }) {
    if (getProductSuccess != null) {
      return getProductSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetProductLoading value) getProductLoading,
    required TResult Function(GetProductError value) getProductError,
    required TResult Function(GetProductSuccess value) getProductSuccess,
  }) {
    return getProductSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetProductLoading value)? getProductLoading,
    TResult? Function(GetProductError value)? getProductError,
    TResult? Function(GetProductSuccess value)? getProductSuccess,
  }) {
    return getProductSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetProductLoading value)? getProductLoading,
    TResult Function(GetProductError value)? getProductError,
    TResult Function(GetProductSuccess value)? getProductSuccess,
    required TResult orElse(),
  }) {
    if (getProductSuccess != null) {
      return getProductSuccess(this);
    }
    return orElse();
  }
}

abstract class GetProductSuccess implements ProductState {
  const factory GetProductSuccess(final ProductResponse data) =
      _$GetProductSuccessImpl;

  ProductResponse get data;
  @JsonKey(ignore: true)
  _$$GetProductSuccessImplCopyWith<_$GetProductSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
