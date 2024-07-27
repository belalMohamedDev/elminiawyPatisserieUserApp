// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_logic_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppLogicState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool hideNavigationBar) hideNavigationBarState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool hideNavigationBar)? hideNavigationBarState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool hideNavigationBar)? hideNavigationBarState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(HideNavigationBarState value)
        hideNavigationBarState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HideNavigationBarState value)? hideNavigationBarState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HideNavigationBarState value)? hideNavigationBarState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLogicStateCopyWith<$Res> {
  factory $AppLogicStateCopyWith(
          AppLogicState value, $Res Function(AppLogicState) then) =
      _$AppLogicStateCopyWithImpl<$Res, AppLogicState>;
}

/// @nodoc
class _$AppLogicStateCopyWithImpl<$Res, $Val extends AppLogicState>
    implements $AppLogicStateCopyWith<$Res> {
  _$AppLogicStateCopyWithImpl(this._value, this._then);

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
    extends _$AppLogicStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'AppLogicState.initial()';
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
    required TResult Function(bool hideNavigationBar) hideNavigationBarState,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool hideNavigationBar)? hideNavigationBarState,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool hideNavigationBar)? hideNavigationBarState,
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
    required TResult Function(HideNavigationBarState value)
        hideNavigationBarState,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HideNavigationBarState value)? hideNavigationBarState,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HideNavigationBarState value)? hideNavigationBarState,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AppLogicState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$HideNavigationBarStateImplCopyWith<$Res> {
  factory _$$HideNavigationBarStateImplCopyWith(
          _$HideNavigationBarStateImpl value,
          $Res Function(_$HideNavigationBarStateImpl) then) =
      __$$HideNavigationBarStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool hideNavigationBar});
}

/// @nodoc
class __$$HideNavigationBarStateImplCopyWithImpl<$Res>
    extends _$AppLogicStateCopyWithImpl<$Res, _$HideNavigationBarStateImpl>
    implements _$$HideNavigationBarStateImplCopyWith<$Res> {
  __$$HideNavigationBarStateImplCopyWithImpl(
      _$HideNavigationBarStateImpl _value,
      $Res Function(_$HideNavigationBarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hideNavigationBar = null,
  }) {
    return _then(_$HideNavigationBarStateImpl(
      hideNavigationBar: null == hideNavigationBar
          ? _value.hideNavigationBar
          : hideNavigationBar // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HideNavigationBarStateImpl implements HideNavigationBarState {
  const _$HideNavigationBarStateImpl({this.hideNavigationBar = false});

  @override
  @JsonKey()
  final bool hideNavigationBar;

  @override
  String toString() {
    return 'AppLogicState.hideNavigationBarState(hideNavigationBar: $hideNavigationBar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HideNavigationBarStateImpl &&
            (identical(other.hideNavigationBar, hideNavigationBar) ||
                other.hideNavigationBar == hideNavigationBar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hideNavigationBar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HideNavigationBarStateImplCopyWith<_$HideNavigationBarStateImpl>
      get copyWith => __$$HideNavigationBarStateImplCopyWithImpl<
          _$HideNavigationBarStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool hideNavigationBar) hideNavigationBarState,
  }) {
    return hideNavigationBarState(hideNavigationBar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool hideNavigationBar)? hideNavigationBarState,
  }) {
    return hideNavigationBarState?.call(hideNavigationBar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool hideNavigationBar)? hideNavigationBarState,
    required TResult orElse(),
  }) {
    if (hideNavigationBarState != null) {
      return hideNavigationBarState(hideNavigationBar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(HideNavigationBarState value)
        hideNavigationBarState,
  }) {
    return hideNavigationBarState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(HideNavigationBarState value)? hideNavigationBarState,
  }) {
    return hideNavigationBarState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(HideNavigationBarState value)? hideNavigationBarState,
    required TResult orElse(),
  }) {
    if (hideNavigationBarState != null) {
      return hideNavigationBarState(this);
    }
    return orElse();
  }
}

abstract class HideNavigationBarState implements AppLogicState {
  const factory HideNavigationBarState({final bool hideNavigationBar}) =
      _$HideNavigationBarStateImpl;

  bool get hideNavigationBar;
  @JsonKey(ignore: true)
  _$$HideNavigationBarStateImplCopyWith<_$HideNavigationBarStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
