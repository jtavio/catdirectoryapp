import 'package:fpdart/fpdart.dart';

import '../../core/errors/failures.dart';
import '../entities/breed.dart';

abstract class IBreedRepository {
  Future<Either<Failure, List<Breed>>> getBreeds({
    required int page,
    required int limit,
  });

  Future<Either<Failure, Breed>> getBreedById(String id);
}
