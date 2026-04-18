// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breeds_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BreedsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreedsEvent()';
}


}

/// @nodoc
class $BreedsEventCopyWith<$Res>  {
$BreedsEventCopyWith(BreedsEvent _, $Res Function(BreedsEvent) __);
}


/// Adds pattern-matching-related methods to [BreedsEvent].
extension BreedsEventPatterns on BreedsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( BreedsFetched value)?  fetched,TResult Function( BreedsRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case BreedsFetched() when fetched != null:
return fetched(_that);case BreedsRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( BreedsFetched value)  fetched,required TResult Function( BreedsRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case BreedsFetched():
return fetched(_that);case BreedsRefreshed():
return refreshed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( BreedsFetched value)?  fetched,TResult? Function( BreedsRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case BreedsFetched() when fetched != null:
return fetched(_that);case BreedsRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  fetched,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case BreedsFetched() when fetched != null:
return fetched();case BreedsRefreshed() when refreshed != null:
return refreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  fetched,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case BreedsFetched():
return fetched();case BreedsRefreshed():
return refreshed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  fetched,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case BreedsFetched() when fetched != null:
return fetched();case BreedsRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class BreedsFetched implements BreedsEvent {
  const BreedsFetched();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedsFetched);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreedsEvent.fetched()';
}


}




/// @nodoc


class BreedsRefreshed implements BreedsEvent {
  const BreedsRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedsRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BreedsEvent.refreshed()';
}


}




/// @nodoc
mixin _$BreedsState {

 BreedsStatus get status; List<Breed> get breeds; int get page; bool get hasReachedMax; Failure? get failure;
/// Create a copy of BreedsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreedsStateCopyWith<BreedsState> get copyWith => _$BreedsStateCopyWithImpl<BreedsState>(this as BreedsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.breeds, breeds)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(breeds),page,hasReachedMax,failure);

@override
String toString() {
  return 'BreedsState(status: $status, breeds: $breeds, page: $page, hasReachedMax: $hasReachedMax, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BreedsStateCopyWith<$Res>  {
  factory $BreedsStateCopyWith(BreedsState value, $Res Function(BreedsState) _then) = _$BreedsStateCopyWithImpl;
@useResult
$Res call({
 BreedsStatus status, List<Breed> breeds, int page, bool hasReachedMax, Failure? failure
});


$FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class _$BreedsStateCopyWithImpl<$Res>
    implements $BreedsStateCopyWith<$Res> {
  _$BreedsStateCopyWithImpl(this._self, this._then);

  final BreedsState _self;
  final $Res Function(BreedsState) _then;

/// Create a copy of BreedsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? breeds = null,Object? page = null,Object? hasReachedMax = null,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BreedsStatus,breeds: null == breeds ? _self.breeds : breeds // ignore: cast_nullable_to_non_nullable
as List<Breed>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of BreedsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}


/// Adds pattern-matching-related methods to [BreedsState].
extension BreedsStatePatterns on BreedsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreedsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreedsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreedsState value)  $default,){
final _that = this;
switch (_that) {
case _BreedsState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreedsState value)?  $default,){
final _that = this;
switch (_that) {
case _BreedsState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BreedsStatus status,  List<Breed> breeds,  int page,  bool hasReachedMax,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreedsState() when $default != null:
return $default(_that.status,_that.breeds,_that.page,_that.hasReachedMax,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BreedsStatus status,  List<Breed> breeds,  int page,  bool hasReachedMax,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _BreedsState():
return $default(_that.status,_that.breeds,_that.page,_that.hasReachedMax,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BreedsStatus status,  List<Breed> breeds,  int page,  bool hasReachedMax,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _BreedsState() when $default != null:
return $default(_that.status,_that.breeds,_that.page,_that.hasReachedMax,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _BreedsState implements BreedsState {
  const _BreedsState({this.status = BreedsStatus.initial, final  List<Breed> breeds = const [], this.page = 1, this.hasReachedMax = false, this.failure}): _breeds = breeds;
  

@override@JsonKey() final  BreedsStatus status;
 final  List<Breed> _breeds;
@override@JsonKey() List<Breed> get breeds {
  if (_breeds is EqualUnmodifiableListView) return _breeds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breeds);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasReachedMax;
@override final  Failure? failure;

/// Create a copy of BreedsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreedsStateCopyWith<_BreedsState> get copyWith => __$BreedsStateCopyWithImpl<_BreedsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreedsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._breeds, _breeds)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasReachedMax, hasReachedMax) || other.hasReachedMax == hasReachedMax)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_breeds),page,hasReachedMax,failure);

@override
String toString() {
  return 'BreedsState(status: $status, breeds: $breeds, page: $page, hasReachedMax: $hasReachedMax, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$BreedsStateCopyWith<$Res> implements $BreedsStateCopyWith<$Res> {
  factory _$BreedsStateCopyWith(_BreedsState value, $Res Function(_BreedsState) _then) = __$BreedsStateCopyWithImpl;
@override @useResult
$Res call({
 BreedsStatus status, List<Breed> breeds, int page, bool hasReachedMax, Failure? failure
});


@override $FailureCopyWith<$Res>? get failure;

}
/// @nodoc
class __$BreedsStateCopyWithImpl<$Res>
    implements _$BreedsStateCopyWith<$Res> {
  __$BreedsStateCopyWithImpl(this._self, this._then);

  final _BreedsState _self;
  final $Res Function(_BreedsState) _then;

/// Create a copy of BreedsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? breeds = null,Object? page = null,Object? hasReachedMax = null,Object? failure = freezed,}) {
  return _then(_BreedsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as BreedsStatus,breeds: null == breeds ? _self._breeds : breeds // ignore: cast_nullable_to_non_nullable
as List<Breed>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasReachedMax: null == hasReachedMax ? _self.hasReachedMax : hasReachedMax // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of BreedsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get failure {
    if (_self.failure == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.failure!, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
