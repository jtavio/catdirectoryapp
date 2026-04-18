import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/breed.dart';

part 'breed_model.freezed.dart';
part 'breed_model.g.dart';

@freezed
abstract class BreedModel with _$BreedModel {
  const factory BreedModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'origin') required String origin,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'temperament') required String temperament,
    @JsonKey(name: 'life_span') required String lifeSpan,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _BreedModel;

  factory BreedModel.fromJson(Map<String, dynamic> json) =>
      _$BreedModelFromJson(json);
}

extension BreedModelX on BreedModel {
  Breed toDomain() => Breed(
        id: id,
        name: name,
        origin: origin,
        description: description,
        temperament: temperament,
        lifeSpan: lifeSpan,
        imageUrl: imageUrl,
      );
}
