// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminHomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(double xOffset, double yOffset, double rotate,
            double scaleFactor, bool drawerIsOpen)
        drawerState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double xOffset, double yOffset, double rotate,
            double scaleFactor, bool drawerIsOpen)?
        drawerState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double xOffset, double yOffset, double rotate,
            double scaleFactor, bool drawerIsOpen)?
        drawerState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DrawerState value) drawerState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DrawerState value)? drawerState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DrawerState value)? drawerState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminHomeStateCopyWith<$Res> {
  factory $AdminHomeStateCopyWith(
          AdminHomeState value, $Res Function(AdminHomeState) then) =
      _$AdminHomeStateCopyWithImpl<$Res, AdminHomeState>;
}

/// @nodoc
class _$AdminHomeStateCopyWithImpl<$Res, $Val extends AdminHomeState>
    implements $AdminHomeStateCopyWith<$Res> {
  _$AdminHomeStateCopyWithImpl(this._value, this._then);

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
    extends _$AdminHomeStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AdminHomeState.initial()';
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
    required TResult Function(double xOffset, double yOffset, double rotate,
            double scaleFactor, bool drawerIsOpen)
        drawerState,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double xOffset, double yOffset, double rotate,
            double scaleFactor, bool drawerIsOpen)?
        drawerState,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double xOffset, double yOffset, double rotate,
            double scaleFactor, bool drawerIsOpen)?
        drawerState,
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
    required TResult Function(_DrawerState value) drawerState,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DrawerState value)? drawerState,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DrawerState value)? drawerState,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AdminHomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$DrawerStateImplCopyWith<$Res> {
  factory _$$DrawerStateImplCopyWith(
          _$DrawerStateImpl value, $Res Function(_$DrawerStateImpl) then) =
      __$$DrawerStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {double xOffset,
      double yOffset,
      double rotate,
      double scaleFactor,
      bool drawerIsOpen});
}

/// @nodoc
class __$$DrawerStateImplCopyWithImpl<$Res>
    extends _$AdminHomeStateCopyWithImpl<$Res, _$DrawerStateImpl>
    implements _$$DrawerStateImplCopyWith<$Res> {
  __$$DrawerStateImplCopyWithImpl(
      _$DrawerStateImpl _value, $Res Function(_$DrawerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xOffset = null,
    Object? yOffset = null,
    Object? rotate = null,
    Object? scaleFactor = null,
    Object? drawerIsOpen = null,
  }) {
    return _then(_$DrawerStateImpl(
      xOffset: null == xOffset
          ? _value.xOffset
          : xOffset // ignore: cast_nullable_to_non_nullable
              as double,
      yOffset: null == yOffset
          ? _value.yOffset
          : yOffset // ignore: cast_nullable_to_non_nullable
              as double,
      rotate: null == rotate
          ? _value.rotate
          : rotate // ignore: cast_nullable_to_non_nullable
              as double,
      scaleFactor: null == scaleFactor
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      drawerIsOpen: null == drawerIsOpen
          ? _value.drawerIsOpen
          : drawerIsOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DrawerStateImpl implements _DrawerState {
  const _$DrawerStateImpl(
      {required this.xOffset,
      required this.yOffset,
      required this.rotate,
      required this.scaleFactor,
      required this.drawerIsOpen});

  @override
  final double xOffset;
  @override
  final double yOffset;
  @override
  final double rotate;
  @override
  final double scaleFactor;
  @override
  final bool drawerIsOpen;

  @override
  String toString() {
    return 'AdminHomeState.drawerState(xOffset: $xOffset, yOffset: $yOffset, rotate: $rotate, scaleFactor: $scaleFactor, drawerIsOpen: $drawerIsOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrawerStateImpl &&
            (identical(other.xOffset, xOffset) || other.xOffset == xOffset) &&
            (identical(other.yOffset, yOffset) || other.yOffset == yOffset) &&
            (identical(other.rotate, rotate) || other.rotate == rotate) &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor) &&
            (identical(other.drawerIsOpen, drawerIsOpen) ||
                other.drawerIsOpen == drawerIsOpen));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, xOffset, yOffset, rotate, scaleFactor, drawerIsOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DrawerStateImplCopyWith<_$DrawerStateImpl> get copyWith =>
      __$$DrawerStateImplCopyWithImpl<_$DrawerStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(double xOffset, double yOffset, double rotate,
            double scaleFactor, bool drawerIsOpen)
        drawerState,
  }) {
    return drawerState(xOffset, yOffset, rotate, scaleFactor, drawerIsOpen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(double xOffset, double yOffset, double rotate,
            double scaleFactor, bool drawerIsOpen)?
        drawerState,
  }) {
    return drawerState?.call(
        xOffset, yOffset, rotate, scaleFactor, drawerIsOpen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(double xOffset, double yOffset, double rotate,
            double scaleFactor, bool drawerIsOpen)?
        drawerState,
    required TResult orElse(),
  }) {
    if (drawerState != null) {
      return drawerState(xOffset, yOffset, rotate, scaleFactor, drawerIsOpen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_DrawerState value) drawerState,
  }) {
    return drawerState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_DrawerState value)? drawerState,
  }) {
    return drawerState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_DrawerState value)? drawerState,
    required TResult orElse(),
  }) {
    if (drawerState != null) {
      return drawerState(this);
    }
    return orElse();
  }
}

abstract class _DrawerState implements AdminHomeState {
  const factory _DrawerState(
      {required final double xOffset,
      required final double yOffset,
      required final double rotate,
      required final double scaleFactor,
      required final bool drawerIsOpen}) = _$DrawerStateImpl;

  double get xOffset;
  double get yOffset;
  double get rotate;
  double get scaleFactor;
  bool get drawerIsOpen;
  @JsonKey(ignore: true)
  _$$DrawerStateImplCopyWith<_$DrawerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
