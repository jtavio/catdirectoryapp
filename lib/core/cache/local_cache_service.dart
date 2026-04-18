import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/breed.dart';

class LocalCacheService {
  static const String _breedsKey = 'cached_breeds';
  static const String _cacheTimestampKey = 'breeds_cache_timestamp';
  static const Duration _cacheValidity = Duration(hours: 24);

  final SharedPreferences _prefs;

  LocalCacheService(this._prefs);

  Future<void> cacheBreeds(List<Breed> breeds) async {
    final breedsJson = breeds.map((b) => _breedToJson(b)).toList();
    await _prefs.setString(_breedsKey, jsonEncode(breedsJson));
    await _prefs.setInt(_cacheTimestampKey, DateTime.now().millisecondsSinceEpoch);
  }

  List<Breed>? getCachedBreeds() {
    final cachedString = _prefs.getString(_breedsKey);
    if (cachedString == null) return null;

    final timestamp = _prefs.getInt(_cacheTimestampKey);
    if (timestamp == null) return null;

    final cacheTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    if (DateTime.now().difference(cacheTime) > _cacheValidity) {
      return null;
    }

    try {
      final breedsJson = jsonDecode(cachedString) as List<dynamic>;
      return breedsJson.map((json) => _breedFromJson(json as Map<String, dynamic>)).toList();
    } catch (_) {
      return null;
    }
  }

  Future<void> clearCache() async {
    await _prefs.remove(_breedsKey);
    await _prefs.remove(_cacheTimestampKey);
  }

  Map<String, dynamic> _breedToJson(Breed breed) {
    return {
      'id': breed.id,
      'name': breed.name,
      'origin': breed.origin,
      'description': breed.description,
      'temperament': breed.temperament,
      'lifeSpan': breed.lifeSpan,
      'imageUrl': breed.imageUrl,
    };
  }

  Breed _breedFromJson(Map<String, dynamic> json) {
    return Breed(
      id: json['id'] as String,
      name: json['name'] as String,
      origin: json['origin'] as String,
      description: json['description'] as String,
      temperament: json['temperament'] as String,
      lifeSpan: json['lifeSpan'] as String,
      imageUrl: json['imageUrl'] as String?,
    );
  }
}
