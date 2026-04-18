import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/breed.dart';

part 'breed_model.freezed.dart';
part 'breed_model.g.dart';

@freezed
abstract class BreedModel with _$BreedModel {
  const factory BreedModel({
    @JsonKey(name: 'breed') required String breed,
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'origin') required String origin,
    @JsonKey(name: 'coat') String? coat,
    @JsonKey(name: 'pattern') String? pattern,
  }) = _BreedModel;

  factory BreedModel.fromJson(Map<String, dynamic> json) => _$BreedModelFromJson(json);
}

extension BreedModelX on BreedModel {
  Breed toDomain() => Breed(
    id: breed.replaceAll(' ', '_').toLowerCase(),
    name: breed,
    origin: country,
    description:
        'A $breed cat with ${coat ?? 'unknown'} coat and ${pattern ?? 'unknown'} pattern. Originated as $origin.',
    temperament: pattern ?? 'Unknown',
    lifeSpan: '12-15',
    imageUrl: null,
  );
}
