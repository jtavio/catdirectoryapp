import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cat_directory_app/core/cache/local_cache_service.dart';
import 'package:cat_directory_app/core/errors/failures.dart';
import 'package:cat_directory_app/domain/entities/breed.dart';
import 'package:cat_directory_app/domain/usecases/get_breeds.dart';
import 'package:cat_directory_app/presentation/blocs/breeds_bloc.dart';

class MockGetBreedsUseCase extends Mock implements GetBreedsUseCase {}

class MockLocalCacheService extends Mock implements LocalCacheService {}

void main() {
  late BreedsBloc bloc;
  late MockGetBreedsUseCase mockGetBreeds;
  late MockLocalCacheService mockCache;

  final testBreeds = [
    Breed(
      id: 'abyssinian',
      name: 'Abyssinian',
      origin: 'Ethiopia',
      description: 'Test description',
      temperament: 'Active',
      lifeSpan: '12-15',
      imageUrl: null,
    ),
  ];

  setUp(() {
    mockGetBreeds = MockGetBreedsUseCase();
    mockCache = MockLocalCacheService();

    when(() => mockCache.getCachedBreeds()).thenReturn(null);
    when(() => mockCache.cacheBreeds(any())).thenAnswer((_) async {});

    bloc = BreedsBloc(getBreedsUseCase: mockGetBreeds, cacheService: mockCache);
  });

  tearDown(() {
    bloc.close();
  });

  group('BreedsBloc', () {
    test('initial state is correct', () {
      expect(bloc.state.status, BreedsStatus.initial);
      expect(bloc.state.breeds, isEmpty);
      expect(bloc.state.page, 1);
      expect(bloc.state.hasReachedMax, false);
    });

    blocTest<BreedsBloc, BreedsState>(
      'emits [loading, success] when fetch succeeds',
      build: () {
        when(() => mockGetBreeds(page: 1, limit: 10)).thenAnswer((_) async => Right(testBreeds));
        return bloc;
      },
      act: (bloc) => bloc.add(const BreedsEvent.fetched()),
      expect: () => [
        isA<BreedsState>().having((s) => s.status, 'status', BreedsStatus.loading),
        isA<BreedsState>()
            .having((s) => s.status, 'status', BreedsStatus.success)
            .having((s) => s.breeds.length, 'breeds length', 1)
            .having((s) => s.page, 'page', 2),
      ],
    );

    blocTest<BreedsBloc, BreedsState>(
      'emits [loading, failure] when fetch fails',
      build: () {
        when(() => mockGetBreeds(page: 1, limit: 10)).thenAnswer((_) async => const Left(Failure.networkError()));
        return bloc;
      },
      act: (bloc) => bloc.add(const BreedsEvent.fetched()),
      expect: () => [
        isA<BreedsState>().having((s) => s.status, 'status', BreedsStatus.loading),
        isA<BreedsState>()
            .having((s) => s.status, 'status', BreedsStatus.failure)
            .having((s) => s.failure, 'failure', isA<NetworkError>()),
      ],
    );

    test('loads from cache on initialization when available', () {
      when(() => mockCache.getCachedBreeds()).thenReturn(testBreeds);

      final newBloc = BreedsBloc(getBreedsUseCase: mockGetBreeds, cacheService: mockCache);

      expect(newBloc.state.status, BreedsStatus.success);
      expect(newBloc.state.breeds.length, 1);
      expect(newBloc.state.breeds.first.name, 'Abyssinian');

      newBloc.close();
    });
  });
}
