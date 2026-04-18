import 'package:fpdart/fpdart.dart';

import '../entities/breed.dart';
import '../repositories/breed_repository.dart';
import '../../core/errors/failures.dart';

class GetBreedsUseCase {
  final IBreedRepository _repository;

  GetBreedsUseCase({required IBreedRepository repository})
      : _repository = repository;

  Future<Either<Failure, List<Breed>>> call({
    required int page,
    required int limit,
  }) async {
    return await _repository.getBreeds(page: page, limit: limit);
  }
}
