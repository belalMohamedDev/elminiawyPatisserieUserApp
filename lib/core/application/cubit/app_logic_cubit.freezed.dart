// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_logic_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppLogicState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLogicState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppLogicState()';
}


}

/// @nodoc
class $AppLogicStateCopyWith<$Res>  {
$AppLogicStateCopyWith(AppLogicState _, $Res Function(AppLogicState) __);
}


/// Adds pattern-matching-related methods to [AppLogicState].
extension AppLogicStatePatterns on AppLogicState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( ThemeChangeModeState value)?  themeChangeMode,TResult Function( LanguageChangeState value)?  languageChange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ThemeChangeModeState() when themeChangeMode != null:
return themeChangeMode(_that);case LanguageChangeState() when languageChange != null:
return languageChange(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( ThemeChangeModeState value)  themeChangeMode,required TResult Function( LanguageChangeState value)  languageChange,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case ThemeChangeModeState():
return themeChangeMode(_that);case LanguageChangeState():
return languageChange(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( ThemeChangeModeState value)?  themeChangeMode,TResult? Function( LanguageChangeState value)?  languageChange,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case ThemeChangeModeState() when themeChangeMode != null:
return themeChangeMode(_that);case LanguageChangeState() when languageChange != null:
return languageChange(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( bool isDark)?  themeChangeMode,TResult Function( Locale locale)?  languageChange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ThemeChangeModeState() when themeChangeMode != null:
return themeChangeMode(_that.isDark);case LanguageChangeState() when languageChange != null:
return languageChange(_that.locale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( bool isDark)  themeChangeMode,required TResult Function( Locale locale)  languageChange,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case ThemeChangeModeState():
return themeChangeMode(_that.isDark);case LanguageChangeState():
return languageChange(_that.locale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( bool isDark)?  themeChangeMode,TResult? Function( Locale locale)?  languageChange,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case ThemeChangeModeState() when themeChangeMode != null:
return themeChangeMode(_that.isDark);case LanguageChangeState() when languageChange != null:
return languageChange(_that.locale);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements AppLogicState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppLogicState.initial()';
}


}




/// @nodoc


class ThemeChangeModeState implements AppLogicState {
  const ThemeChangeModeState({required this.isDark});
  

 final  bool isDark;

/// Create a copy of AppLogicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThemeChangeModeStateCopyWith<ThemeChangeModeState> get copyWith => _$ThemeChangeModeStateCopyWithImpl<ThemeChangeModeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThemeChangeModeState&&(identical(other.isDark, isDark) || other.isDark == isDark));
}


@override
int get hashCode => Object.hash(runtimeType,isDark);

@override
String toString() {
  return 'AppLogicState.themeChangeMode(isDark: $isDark)';
}


}

/// @nodoc
abstract mixin class $ThemeChangeModeStateCopyWith<$Res> implements $AppLogicStateCopyWith<$Res> {
  factory $ThemeChangeModeStateCopyWith(ThemeChangeModeState value, $Res Function(ThemeChangeModeState) _then) = _$ThemeChangeModeStateCopyWithImpl;
@useResult
$Res call({
 bool isDark
});




}
/// @nodoc
class _$ThemeChangeModeStateCopyWithImpl<$Res>
    implements $ThemeChangeModeStateCopyWith<$Res> {
  _$ThemeChangeModeStateCopyWithImpl(this._self, this._then);

  final ThemeChangeModeState _self;
  final $Res Function(ThemeChangeModeState) _then;

/// Create a copy of AppLogicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isDark = null,}) {
  return _then(ThemeChangeModeState(
isDark: null == isDark ? _self.isDark : isDark // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class LanguageChangeState implements AppLogicState {
  const LanguageChangeState({required this.locale});
  

 final  Locale locale;

/// Create a copy of AppLogicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LanguageChangeStateCopyWith<LanguageChangeState> get copyWith => _$LanguageChangeStateCopyWithImpl<LanguageChangeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LanguageChangeState&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'AppLogicState.languageChange(locale: $locale)';
}


}

/// @nodoc
abstract mixin class $LanguageChangeStateCopyWith<$Res> implements $AppLogicStateCopyWith<$Res> {
  factory $LanguageChangeStateCopyWith(LanguageChangeState value, $Res Function(LanguageChangeState) _then) = _$LanguageChangeStateCopyWithImpl;
@useResult
$Res call({
 Locale locale
});




}
/// @nodoc
class _$LanguageChangeStateCopyWithImpl<$Res>
    implements $LanguageChangeStateCopyWith<$Res> {
  _$LanguageChangeStateCopyWithImpl(this._self, this._then);

  final LanguageChangeState _self;
  final $Res Function(LanguageChangeState) _then;

/// Create a copy of AppLogicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(LanguageChangeState(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}


}

// dart format on
