import 'package:freezed_annotation/freezed_annotation.dart';

part 'breed.freezed.dart';

@freezed
abstract class Breed with _$Breed {
  const factory Breed({
    required String id,
    required String name,
    required String origin,
    required String description,
    required String temperament,
    required String lifeSpan,
    required String? imageUrl,
  }) = _Breed;
}
