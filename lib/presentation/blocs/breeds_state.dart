part of 'breeds_bloc.dart';

enum BreedsStatus { initial, loading, success, failure }

@freezed
abstract class BreedsState with _$BreedsState {
  const factory BreedsState({
    @Default(BreedsStatus.initial) BreedsStatus status,
    @Default([]) List<Breed> breeds,
    @Default(1) int page,
    @Default(false) bool hasReachedMax,
    Failure? failure,
  }) = _BreedsState;
}
