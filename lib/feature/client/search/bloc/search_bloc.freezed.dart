// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent()';
}


}

/// @nodoc
class $SearchEventCopyWith<$Res>  {
$SearchEventCopyWith(SearchEvent _, $Res Function(SearchEvent) __);
}


/// Adds pattern-matching-related methods to [SearchEvent].
extension SearchEventPatterns on SearchEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _SearchText value)?  searchText,TResult Function( _UpdateSelectedOption value)?  updateSelectedOption,TResult Function( _UpdateSelectedRange value)?  updateSelectedRange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SearchText() when searchText != null:
return searchText(_that);case _UpdateSelectedOption() when updateSelectedOption != null:
return updateSelectedOption(_that);case _UpdateSelectedRange() when updateSelectedRange != null:
return updateSelectedRange(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _SearchText value)  searchText,required TResult Function( _UpdateSelectedOption value)  updateSelectedOption,required TResult Function( _UpdateSelectedRange value)  updateSelectedRange,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _SearchText():
return searchText(_that);case _UpdateSelectedOption():
return updateSelectedOption(_that);case _UpdateSelectedRange():
return updateSelectedRange(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _SearchText value)?  searchText,TResult? Function( _UpdateSelectedOption value)?  updateSelectedOption,TResult? Function( _UpdateSelectedRange value)?  updateSelectedRange,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _SearchText() when searchText != null:
return searchText(_that);case _UpdateSelectedOption() when updateSelectedOption != null:
return updateSelectedOption(_that);case _UpdateSelectedRange() when updateSelectedRange != null:
return updateSelectedRange(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String value)?  searchText,TResult Function( int option)?  updateSelectedOption,TResult Function( RangeValues range)?  updateSelectedRange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SearchText() when searchText != null:
return searchText(_that.value);case _UpdateSelectedOption() when updateSelectedOption != null:
return updateSelectedOption(_that.option);case _UpdateSelectedRange() when updateSelectedRange != null:
return updateSelectedRange(_that.range);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String value)  searchText,required TResult Function( int option)  updateSelectedOption,required TResult Function( RangeValues range)  updateSelectedRange,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _SearchText():
return searchText(_that.value);case _UpdateSelectedOption():
return updateSelectedOption(_that.option);case _UpdateSelectedRange():
return updateSelectedRange(_that.range);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String value)?  searchText,TResult? Function( int option)?  updateSelectedOption,TResult? Function( RangeValues range)?  updateSelectedRange,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _SearchText() when searchText != null:
return searchText(_that.value);case _UpdateSelectedOption() when updateSelectedOption != null:
return updateSelectedOption(_that.option);case _UpdateSelectedRange() when updateSelectedRange != null:
return updateSelectedRange(_that.range);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements SearchEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchEvent.started()';
}


}




/// @nodoc


class _SearchText implements SearchEvent {
  const _SearchText(this.value);
  

 final  String value;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchTextCopyWith<_SearchText> get copyWith => __$SearchTextCopyWithImpl<_SearchText>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchText&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'SearchEvent.searchText(value: $value)';
}


}

/// @nodoc
abstract mixin class _$SearchTextCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory _$SearchTextCopyWith(_SearchText value, $Res Function(_SearchText) _then) = __$SearchTextCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class __$SearchTextCopyWithImpl<$Res>
    implements _$SearchTextCopyWith<$Res> {
  __$SearchTextCopyWithImpl(this._self, this._then);

  final _SearchText _self;
  final $Res Function(_SearchText) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(_SearchText(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UpdateSelectedOption implements SearchEvent {
  const _UpdateSelectedOption(this.option);
  

 final  int option;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSelectedOptionCopyWith<_UpdateSelectedOption> get copyWith => __$UpdateSelectedOptionCopyWithImpl<_UpdateSelectedOption>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSelectedOption&&(identical(other.option, option) || other.option == option));
}


@override
int get hashCode => Object.hash(runtimeType,option);

@override
String toString() {
  return 'SearchEvent.updateSelectedOption(option: $option)';
}


}

/// @nodoc
abstract mixin class _$UpdateSelectedOptionCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory _$UpdateSelectedOptionCopyWith(_UpdateSelectedOption value, $Res Function(_UpdateSelectedOption) _then) = __$UpdateSelectedOptionCopyWithImpl;
@useResult
$Res call({
 int option
});




}
/// @nodoc
class __$UpdateSelectedOptionCopyWithImpl<$Res>
    implements _$UpdateSelectedOptionCopyWith<$Res> {
  __$UpdateSelectedOptionCopyWithImpl(this._self, this._then);

  final _UpdateSelectedOption _self;
  final $Res Function(_UpdateSelectedOption) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? option = null,}) {
  return _then(_UpdateSelectedOption(
null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _UpdateSelectedRange implements SearchEvent {
  const _UpdateSelectedRange(this.range);
  

 final  RangeValues range;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateSelectedRangeCopyWith<_UpdateSelectedRange> get copyWith => __$UpdateSelectedRangeCopyWithImpl<_UpdateSelectedRange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateSelectedRange&&(identical(other.range, range) || other.range == range));
}


@override
int get hashCode => Object.hash(runtimeType,range);

@override
String toString() {
  return 'SearchEvent.updateSelectedRange(range: $range)';
}


}

/// @nodoc
abstract mixin class _$UpdateSelectedRangeCopyWith<$Res> implements $SearchEventCopyWith<$Res> {
  factory _$UpdateSelectedRangeCopyWith(_UpdateSelectedRange value, $Res Function(_UpdateSelectedRange) _then) = __$UpdateSelectedRangeCopyWithImpl;
@useResult
$Res call({
 RangeValues range
});




}
/// @nodoc
class __$UpdateSelectedRangeCopyWithImpl<$Res>
    implements _$UpdateSelectedRangeCopyWith<$Res> {
  __$UpdateSelectedRangeCopyWithImpl(this._self, this._then);

  final _UpdateSelectedRange _self;
  final $Res Function(_UpdateSelectedRange) _then;

/// Create a copy of SearchEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? range = null,}) {
  return _then(_UpdateSelectedRange(
null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as RangeValues,
  ));
}


}

/// @nodoc
mixin _$SearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState()';
}


}

/// @nodoc
class $SearchStateCopyWith<$Res>  {
$SearchStateCopyWith(SearchState _, $Res Function(SearchState) __);
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Error value)?  error,TResult Function( _OptionUpdated value)?  optionUpdated,TResult Function( _RangeUpdated value)?  rangeUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _OptionUpdated() when optionUpdated != null:
return optionUpdated(_that);case _RangeUpdated() when rangeUpdated != null:
return rangeUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Error value)  error,required TResult Function( _OptionUpdated value)  optionUpdated,required TResult Function( _RangeUpdated value)  rangeUpdated,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _OptionUpdated():
return optionUpdated(_that);case _RangeUpdated():
return rangeUpdated(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Error value)?  error,TResult? Function( _OptionUpdated value)?  optionUpdated,TResult? Function( _RangeUpdated value)?  rangeUpdated,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
return error(_that);case _OptionUpdated() when optionUpdated != null:
return optionUpdated(_that);case _RangeUpdated() when rangeUpdated != null:
return rangeUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ProductResponse data)?  loaded,TResult Function( ApiErrorModel apiErrorModel)?  error,TResult Function( int option)?  optionUpdated,TResult Function( RangeValues range)?  rangeUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.data);case _Error() when error != null:
return error(_that.apiErrorModel);case _OptionUpdated() when optionUpdated != null:
return optionUpdated(_that.option);case _RangeUpdated() when rangeUpdated != null:
return rangeUpdated(_that.range);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ProductResponse data)  loaded,required TResult Function( ApiErrorModel apiErrorModel)  error,required TResult Function( int option)  optionUpdated,required TResult Function( RangeValues range)  rangeUpdated,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Loaded():
return loaded(_that.data);case _Error():
return error(_that.apiErrorModel);case _OptionUpdated():
return optionUpdated(_that.option);case _RangeUpdated():
return rangeUpdated(_that.range);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ProductResponse data)?  loaded,TResult? Function( ApiErrorModel apiErrorModel)?  error,TResult? Function( int option)?  optionUpdated,TResult? Function( RangeValues range)?  rangeUpdated,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.data);case _Error() when error != null:
return error(_that.apiErrorModel);case _OptionUpdated() when optionUpdated != null:
return optionUpdated(_that.option);case _RangeUpdated() when rangeUpdated != null:
return rangeUpdated(_that.range);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SearchState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.initial()';
}


}




/// @nodoc


class _Loading implements SearchState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.loading()';
}


}




/// @nodoc


class _Loaded implements SearchState {
  const _Loaded(this.data);
  

 final  ProductResponse data;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'SearchState.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 ProductResponse data
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Loaded(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductResponse,
  ));
}


}

/// @nodoc


class _Error implements SearchState {
  const _Error(this.apiErrorModel);
  

 final  ApiErrorModel apiErrorModel;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.apiErrorModel, apiErrorModel) || other.apiErrorModel == apiErrorModel));
}


@override
int get hashCode => Object.hash(runtimeType,apiErrorModel);

@override
String toString() {
  return 'SearchState.error(apiErrorModel: $apiErrorModel)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel apiErrorModel
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? apiErrorModel = null,}) {
  return _then(_Error(
null == apiErrorModel ? _self.apiErrorModel : apiErrorModel // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc


class _OptionUpdated implements SearchState {
  const _OptionUpdated(this.option);
  

 final  int option;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptionUpdatedCopyWith<_OptionUpdated> get copyWith => __$OptionUpdatedCopyWithImpl<_OptionUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OptionUpdated&&(identical(other.option, option) || other.option == option));
}


@override
int get hashCode => Object.hash(runtimeType,option);

@override
String toString() {
  return 'SearchState.optionUpdated(option: $option)';
}


}

/// @nodoc
abstract mixin class _$OptionUpdatedCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$OptionUpdatedCopyWith(_OptionUpdated value, $Res Function(_OptionUpdated) _then) = __$OptionUpdatedCopyWithImpl;
@useResult
$Res call({
 int option
});




}
/// @nodoc
class __$OptionUpdatedCopyWithImpl<$Res>
    implements _$OptionUpdatedCopyWith<$Res> {
  __$OptionUpdatedCopyWithImpl(this._self, this._then);

  final _OptionUpdated _self;
  final $Res Function(_OptionUpdated) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? option = null,}) {
  return _then(_OptionUpdated(
null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RangeUpdated implements SearchState {
  const _RangeUpdated(this.range);
  

 final  RangeValues range;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RangeUpdatedCopyWith<_RangeUpdated> get copyWith => __$RangeUpdatedCopyWithImpl<_RangeUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RangeUpdated&&(identical(other.range, range) || other.range == range));
}


@override
int get hashCode => Object.hash(runtimeType,range);

@override
String toString() {
  return 'SearchState.rangeUpdated(range: $range)';
}


}

/// @nodoc
abstract mixin class _$RangeUpdatedCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$RangeUpdatedCopyWith(_RangeUpdated value, $Res Function(_RangeUpdated) _then) = __$RangeUpdatedCopyWithImpl;
@useResult
$Res call({
 RangeValues range
});




}
/// @nodoc
class __$RangeUpdatedCopyWithImpl<$Res>
    implements _$RangeUpdatedCopyWith<$Res> {
  __$RangeUpdatedCopyWithImpl(this._self, this._then);

  final _RangeUpdated _self;
  final $Res Function(_RangeUpdated) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? range = null,}) {
  return _then(_RangeUpdated(
null == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as RangeValues,
  ));
}


}

// dart format on
