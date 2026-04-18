# Cat Directory App

A professional Flutter application demonstrating Clean Architecture, BLoC pattern, and functional error handling. Browse cat breeds with infinite scroll, local search, dark mode, and beautiful Hero animations.

## Architecture Overview

This project follows **Clean Architecture** principles with a clear separation of concerns across four layers:

### 1. Core Layer (`lib/core/`)
Contains application-wide utilities and configurations:
- **Errors** (`failures.dart`): Immutable error classes using `freezed` for type-safe error handling
- **Network** (`dio_client.dart`): Centralized Dio HTTP client with interceptors, timeouts, and base URL configuration
- **Theme** (`app_theme.dart`): Light and dark theme definitions with Material 3 design

### 2. Domain Layer (`lib/domain/`)
The business logic heart of the application, completely independent of frameworks:
- **Entities** (`breed.dart`): Pure business objects representing cat breeds with name, origin, description, temperament, lifeSpan, and imageUrl
- **Repositories** (`breed_repository.dart`): Abstract contracts defining data operations using `Either<Failure, T>` for functional error handling
- **Use Cases** (`get_breeds.dart`): Single-responsibility classes encapsulating specific business operations

### 3. Infrastructure Layer (`lib/infrastructure/`)
Implementation details that depend on external frameworks:
- **Data Sources** (`breed_remote_datasource.dart`): API communication with CatFact Ninja
- **Models** (`breed_model.dart`): DTOs with JSON serialization and domain mapping via `toDomain()` extension
- **Repositories** (`breed_repository_impl.dart`): Concrete implementations returning `Either` with proper error mapping (DioException → NetworkError/ServerError)

### 4. Presentation Layer (`lib/presentation/`)
UI components and state management:
- **BLoCs** (`breeds_bloc.dart`): Business Logic Components using `flutter_bloc` with `bloc_concurrency` (droppable transformer for pagination)
- **Pages** (`home_page.dart`, `detail_page.dart`): Screen widgets with infinite scroll, pull-to-refresh, and Hero animations
- **Widgets** (`breed_card.dart`, `skeleton_loader.dart`): Reusable UI components including skeleton loading states

## Why BLoC?

**BLoC (Business Logic Component)** was chosen for state management because:

1. **Predictable State Flow**: Unidirectional data flow with events triggering state changes
2. **Separation of Concerns**: UI is completely decoupled from business logic
3. **Testability**: Business logic can be tested independently of the UI
4. **Concurrency Control**: Using `bloc_concurrency` with `droppable()` transformer prevents request flooding during rapid scrolling
5. **Immutable State**: Freezed-generated states ensure no accidental mutations

### BLoC Pattern Implementation

```dart
// Events represent user actions or system notifications
@freezed
abstract class BreedsEvent with _$BreedsEvent {
  const factory BreedsEvent.fetched() = BreedsFetched;      // Load more data
  const factory BreedsEvent.refreshed() = BreedsRefreshed;  // Pull-to-refresh
  const factory BreedsEvent.searched(String query) = BreedsSearched; // Local search
}

// States represent the UI at any point in time
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
```

## Either & Functional Error Handling

The application uses `fpdart` (Dart port of fp-ts) for railway-oriented programming:

### Why Either<L, R>?

Traditional try-catch forces error handling at call site or propagates as exceptions. `Either` makes errors **explicit** in the type system:

```dart
// Repository contract clearly states what can go wrong
Future<Either<Failure, List<Breed>>> getBreeds({required int page, required int limit});

// Caller MUST handle both success and failure cases
final result = await repository.getBreeds(page: 1, limit: 10);
result.fold(
  (failure) => showErrorMessage(failure),  // Left path: handle error
  (breeds) => displayBreeds(breeds),      // Right path: use data
);
```

### Error Hierarchy

```dart
@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError(String message) = ServerError;
  const factory Failure.networkError() = NetworkError;
  const factory Failure.unexpectedError() = UnexpectedError;
}
```

This guarantees **no silent failures** and enables **user-friendly error recovery**:
- Network errors show "No internet connection" with retry button
- Server errors display the specific message from API
- Unexpected errors trigger generic fallback messaging

## Key Features

### 1. Infinite Scroll with Concurrency Protection
```dart
on<BreedsFetched>(_onBreedsFetched, transformer: droppable());
```nUsing `droppable()` from `bloc_concurrency` ensures only one pagination request is active at a time, discarding duplicate scroll events during rapid scrolling.

### 2. Local In-Memory Search
Search filters through all loaded breeds locally (name, origin, temperament) without additional API calls:
```dart
final filtered = _allBreeds.where((breed) =>
  breed.name.toLowerCase().contains(query) ||
  breed.origin.toLowerCase().contains(query) ||
  breed.temperament.toLowerCase().contains(query)
).toList();
```

### 3. Dark Mode Support
Material 3 dynamic theming with separate color schemes for light and dark modes. Toggle button in app bar switches themes instantly.

### 4. Hero Animations
Smooth transitions between list and detail views using Flutter's Hero widget with shared image tags.

### 5. Skeleton Loading
Shimmer-free skeleton placeholders during initial load using `Container` with theme-aware background colors.

### 6. Error Resilience
If pagination fails, a "Retry" button appears at the bottom of the list without clearing existing data:
```dart
if (state.status == BreedsStatus.failure) {
  return ElevatedButton.icon(
    onPressed: () => context.read<BreedsBloc>().add(const BreedsEvent.fetched()),
    icon: const Icon(Icons.refresh),
    label: const Text('Retry'),
  );
}
```

## Getting Started

### Prerequisites
- Flutter SDK 3.19+
- Dart 3.3+

### Installation
```bash
git clone https://github.com/jtavio/catdirectoryapp.git
cd cat_directory_app
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

### Generating Code
This project uses code generation for immutable classes and JSON serialization:
```bash
# Generate once
dart run build_runner build --delete-conflicting-outputs

# Watch for changes during development
dart run build_runner watch --delete-conflicting-outputs
```

## Tech Stack

| Category | Package | Purpose |
|----------|---------|---------|
| State Management | `flutter_bloc` | BLoC pattern implementation |
| Concurrency | `bloc_concurrency` | Event transformers (droppable, throttle) |
| Networking | `dio` | HTTP client with interceptors |
| Functional Programming | `fpdart` | Either, Option, and FP utilities |
| Immutable Models | `freezed` | Code generation for unions/immutable classes |
| JSON Serialization | `json_serializable` | Type-safe JSON parsing |

## API Reference

This app consumes the [CatFact Ninja API](https://catfact.ninja):
- `GET /breeds?page={page}&limit={limit}` - Paginated breed list
- `GET /fact` - Random cat fact for detail view

## Project Structure

```
lib/
├── core/
│   ├── errors/
│   │   └── failures.dart
│   ├── network/
│   │   └── dio_client.dart
│   └── theme/
│       └── app_theme.dart
├── domain/
│   ├── entities/
│   │   └── breed.dart
│   ├── repositories/
│   │   └── breed_repository.dart
│   └── usecases/
│       └── get_breeds.dart
├── infrastructure/
│   ├── datasources/
│   │   └── breed_remote_datasource.dart
│   ├── models/
│   │   └── breed_model.dart
│   └── repositories/
│       └── breed_repository_impl.dart
└── presentation/
    ├── blocs/
    │   ├── breeds_bloc.dart
    │   ├── breeds_event.dart
    │   └── breeds_state.dart
    ├── pages/
    │   ├── home_page.dart
    │   └── detail_page.dart
    └── widgets/
        ├── breed_card.dart
        └── skeleton_loader.dart
```

## License

MIT License - See LICENSE file for details
