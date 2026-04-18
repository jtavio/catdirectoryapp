import 'package:dio/dio.dart';

import '../models/breed_model.dart';

abstract class IBreedRemoteDataSource {
  Future<List<BreedModel>> getBreeds({required int page, required int limit});
  Future<BreedModel> getBreedById(String id);
}

class BreedRemoteDataSource implements IBreedRemoteDataSource {
  final Dio _dio;

  BreedRemoteDataSource({required Dio dio}) : _dio = dio;

  @override
  Future<List<BreedModel>> getBreeds({
    required int page,
    required int limit,
  }) async {
    final response = await _dio.get(
      '/breeds',
      queryParameters: {
        'page': page,
        'limit': limit,
      },
    );

    final data = response.data['data'] as List<dynamic>;
    return data
        .map((json) => BreedModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<BreedModel> getBreedById(String id) async {
    final response = await _dio.get('/breeds/$id');
    return BreedModel.fromJson(response.data as Map<String, dynamic>);
  }
}
