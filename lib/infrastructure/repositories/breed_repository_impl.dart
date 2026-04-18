import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/breed.dart';
import '../../domain/repositories/breed_repository.dart';
import '../datasources/breed_remote_datasource.dart';
import '../models/breed_model.dart';

class BreedRepositoryImpl implements IBreedRepository {
  final IBreedRemoteDataSource _remoteDataSource;

  BreedRepositoryImpl({required IBreedRemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<Failure, List<Breed>>> getBreeds({required int page, required int limit}) async {
    try {
      final breedModels = await _remoteDataSource.getBreeds(page: page, limit: limit);
      final breeds = breedModels.map((model) => model.toDomain()).toList();
      return Right(breeds);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        return const Left(NetworkError());
      }
      return Left(ServerError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(UnexpectedError());
    }
  }

  @override
  Future<Either<Failure, Breed>> getBreedById(String id) async {
    try {
      final breedModel = await _remoteDataSource.getBreedById(id);
      return Right(breedModel.toDomain());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        return const Left(NetworkError());
      }
      return Left(ServerError(e.message ?? 'Unknown server error'));
    } catch (e) {
      return const Left(UnexpectedError());
    }
  }
}
