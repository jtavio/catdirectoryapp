part of 'breeds_bloc.dart';

@freezed
abstract class BreedsEvent with _$BreedsEvent {
  const factory BreedsEvent.fetched() = BreedsFetched;
  const factory BreedsEvent.refreshed() = BreedsRefreshed;
  const factory BreedsEvent.searched(String query) = BreedsSearched;
}
