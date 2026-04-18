// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BreedModel _$BreedModelFromJson(Map<String, dynamic> json) => _BreedModel(
  id: json['id'] as String,
  name: json['name'] as String,
  origin: json['origin'] as String,
  description: json['description'] as String,
  temperament: json['temperament'] as String,
  lifeSpan: json['life_span'] as String,
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$BreedModelToJson(_BreedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'origin': instance.origin,
      'description': instance.description,
      'temperament': instance.temperament,
      'life_span': instance.lifeSpan,
      'image_url': instance.imageUrl,
    };
