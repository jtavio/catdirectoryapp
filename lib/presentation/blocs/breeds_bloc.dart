import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/cache/local_cache_service.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/breed.dart';
import '../../domain/usecases/get_breeds.dart';

part 'breeds_bloc.freezed.dart';
part 'breeds_event.dart';
part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final GetBreedsUseCase _getBreedsUseCase;
  final LocalCacheService _cacheService;
  static const int _limit = 10;

  final List<Breed> _allBreeds = [];

  BreedsBloc({required GetBreedsUseCase getBreedsUseCase, required LocalCacheService cacheService})
    : _getBreedsUseCase = getBreedsUseCase,
      _cacheService = cacheService,
      super(const BreedsState()) {
    on<BreedsFetched>(_onBreedsFetched, transformer: droppable());
    on<BreedsRefreshed>(_onBreedsRefreshed);
    on<BreedsSearched>(_onBreedsSearched);
    _loadFromCache();
  }

  void _loadFromCache() {
    final cached = _cacheService.getCachedBreeds();
    if (cached != null && cached.isNotEmpty) {
      _allBreeds.addAll(cached);
      emit(state.copyWith(status: BreedsStatus.success, breeds: List.of(_allBreeds)));
    }
  }

  Future<void> _onBreedsFetched(BreedsFetched event, Emitter<BreedsState> emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(status: BreedsStatus.loading));

    final result = await _getBreedsUseCase(page: state.page, limit: _limit);

    result.fold((failure) => emit(state.copyWith(status: BreedsStatus.failure, failure: failure)), (breeds) async {
      if (breeds.isEmpty) {
        emit(state.copyWith(status: BreedsStatus.success, hasReachedMax: true));
      } else {
        _allBreeds.addAll(breeds);
        emit(
          state.copyWith(
            status: BreedsStatus.success,
            breeds: List.of(_allBreeds),
            page: state.page + 1,
            hasReachedMax: false,
          ),
        );
        // Guardar primera página en caché
        if (state.page == 1) {
          await _cacheService.cacheBreeds(_allBreeds);
        }
      }
    });
  }

  Future<void> _onBreedsRefreshed(BreedsRefreshed event, Emitter<BreedsState> emit) async {
    _allBreeds.clear();
    emit(const BreedsState());
    add(const BreedsFetched());
  }

  Future<void> _onBreedsSearched(BreedsSearched event, Emitter<BreedsState> emit) async {
    if (event.query.isEmpty) {
      emit(state.copyWith(breeds: List.of(_allBreeds)));
      return;
    }

    final query = event.query.toLowerCase();
    final filtered = _allBreeds.where((breed) {
      return breed.name.toLowerCase().contains(query) ||
          breed.origin.toLowerCase().contains(query) ||
          breed.temperament.toLowerCase().contains(query);
    }).toList();

    emit(state.copyWith(breeds: filtered));
  }
}
