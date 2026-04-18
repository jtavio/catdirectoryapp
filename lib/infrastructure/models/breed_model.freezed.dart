// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'breed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BreedModel {

@JsonKey(name: 'id') String get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'origin') String get origin;@JsonKey(name: 'description') String get description;@JsonKey(name: 'temperament') String get temperament;@JsonKey(name: 'life_span') String get lifeSpan;@JsonKey(name: 'image_url') String? get imageUrl;
/// Create a copy of BreedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BreedModelCopyWith<BreedModel> get copyWith => _$BreedModelCopyWithImpl<BreedModel>(this as BreedModel, _$identity);

  /// Serializes this BreedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BreedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.description, description) || other.description == description)&&(identical(other.temperament, temperament) || other.temperament == temperament)&&(identical(other.lifeSpan, lifeSpan) || other.lifeSpan == lifeSpan)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,origin,description,temperament,lifeSpan,imageUrl);

@override
String toString() {
  return 'BreedModel(id: $id, name: $name, origin: $origin, description: $description, temperament: $temperament, lifeSpan: $lifeSpan, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $BreedModelCopyWith<$Res>  {
  factory $BreedModelCopyWith(BreedModel value, $Res Function(BreedModel) _then) = _$BreedModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'origin') String origin,@JsonKey(name: 'description') String description,@JsonKey(name: 'temperament') String temperament,@JsonKey(name: 'life_span') String lifeSpan,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class _$BreedModelCopyWithImpl<$Res>
    implements $BreedModelCopyWith<$Res> {
  _$BreedModelCopyWithImpl(this._self, this._then);

  final BreedModel _self;
  final $Res Function(BreedModel) _then;

/// Create a copy of BreedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? origin = null,Object? description = null,Object? temperament = null,Object? lifeSpan = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,temperament: null == temperament ? _self.temperament : temperament // ignore: cast_nullable_to_non_nullable
as String,lifeSpan: null == lifeSpan ? _self.lifeSpan : lifeSpan // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BreedModel].
extension BreedModelPatterns on BreedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BreedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BreedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BreedModel value)  $default,){
final _that = this;
switch (_that) {
case _BreedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BreedModel value)?  $default,){
final _that = this;
switch (_that) {
case _BreedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'origin')  String origin, @JsonKey(name: 'description')  String description, @JsonKey(name: 'temperament')  String temperament, @JsonKey(name: 'life_span')  String lifeSpan, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BreedModel() when $default != null:
return $default(_that.id,_that.name,_that.origin,_that.description,_that.temperament,_that.lifeSpan,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'origin')  String origin, @JsonKey(name: 'description')  String description, @JsonKey(name: 'temperament')  String temperament, @JsonKey(name: 'life_span')  String lifeSpan, @JsonKey(name: 'image_url')  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _BreedModel():
return $default(_that.id,_that.name,_that.origin,_that.description,_that.temperament,_that.lifeSpan,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  String id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'origin')  String origin, @JsonKey(name: 'description')  String description, @JsonKey(name: 'temperament')  String temperament, @JsonKey(name: 'life_span')  String lifeSpan, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _BreedModel() when $default != null:
return $default(_that.id,_that.name,_that.origin,_that.description,_that.temperament,_that.lifeSpan,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BreedModel implements BreedModel {
  const _BreedModel({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'origin') required this.origin, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'temperament') required this.temperament, @JsonKey(name: 'life_span') required this.lifeSpan, @JsonKey(name: 'image_url') this.imageUrl});
  factory _BreedModel.fromJson(Map<String, dynamic> json) => _$BreedModelFromJson(json);

@override@JsonKey(name: 'id') final  String id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'origin') final  String origin;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'temperament') final  String temperament;
@override@JsonKey(name: 'life_span') final  String lifeSpan;
@override@JsonKey(name: 'image_url') final  String? imageUrl;

/// Create a copy of BreedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BreedModelCopyWith<_BreedModel> get copyWith => __$BreedModelCopyWithImpl<_BreedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BreedModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BreedModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.description, description) || other.description == description)&&(identical(other.temperament, temperament) || other.temperament == temperament)&&(identical(other.lifeSpan, lifeSpan) || other.lifeSpan == lifeSpan)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,origin,description,temperament,lifeSpan,imageUrl);

@override
String toString() {
  return 'BreedModel(id: $id, name: $name, origin: $origin, description: $description, temperament: $temperament, lifeSpan: $lifeSpan, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$BreedModelCopyWith<$Res> implements $BreedModelCopyWith<$Res> {
  factory _$BreedModelCopyWith(_BreedModel value, $Res Function(_BreedModel) _then) = __$BreedModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') String id,@JsonKey(name: 'name') String name,@JsonKey(name: 'origin') String origin,@JsonKey(name: 'description') String description,@JsonKey(name: 'temperament') String temperament,@JsonKey(name: 'life_span') String lifeSpan,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class __$BreedModelCopyWithImpl<$Res>
    implements _$BreedModelCopyWith<$Res> {
  __$BreedModelCopyWithImpl(this._self, this._then);

  final _BreedModel _self;
  final $Res Function(_BreedModel) _then;

/// Create a copy of BreedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? origin = null,Object? description = null,Object? temperament = null,Object? lifeSpan = null,Object? imageUrl = freezed,}) {
  return _then(_BreedModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,temperament: null == temperament ? _self.temperament : temperament // ignore: cast_nullable_to_non_nullable
as String,lifeSpan: null == lifeSpan ? _self.lifeSpan : lifeSpan // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
