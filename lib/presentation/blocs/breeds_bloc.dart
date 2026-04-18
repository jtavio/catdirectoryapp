import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/errors/failures.dart';
import '../../domain/entities/breed.dart';
import '../../domain/usecases/get_breeds.dart';

part 'breeds_bloc.freezed.dart';
part 'breeds_event.dart';
part 'breeds_state.dart';

class BreedsBloc extends Bloc<BreedsEvent, BreedsState> {
  final GetBreedsUseCase _getBreedsUseCase;
  static const int _limit = 10;

  BreedsBloc({required GetBreedsUseCase getBreedsUseCase})
    : _getBreedsUseCase = getBreedsUseCase,
      super(const BreedsState()) {
    on<BreedsFetched>(_onBreedsFetched, transformer: droppable());
    on<BreedsRefreshed>(_onBreedsRefreshed);
  }

  Future<void> _onBreedsFetched(BreedsFetched event, Emitter<BreedsState> emit) async {
    if (state.hasReachedMax) return;

    emit(state.copyWith(status: BreedsStatus.loading));

    final result = await _getBreedsUseCase(page: state.page, limit: _limit);

    result.fold((failure) => emit(state.copyWith(status: BreedsStatus.failure, failure: failure)), (breeds) {
      if (breeds.isEmpty) {
        emit(state.copyWith(status: BreedsStatus.success, hasReachedMax: true));
      } else {
        emit(
          state.copyWith(
            status: BreedsStatus.success,
            breeds: List.of(state.breeds)..addAll(breeds),
            page: state.page + 1,
            hasReachedMax: false,
          ),
        );
      }
    });
  }

  Future<void> _onBreedsRefreshed(BreedsRefreshed event, Emitter<BreedsState> emit) async {
    emit(const BreedsState());
    add(const BreedsFetched());
  }
}
