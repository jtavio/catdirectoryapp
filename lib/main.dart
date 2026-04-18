import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/cache/local_cache_service.dart';
import 'core/network/dio_client.dart';
import 'core/theme/app_theme.dart';
import 'domain/usecases/get_breeds.dart';
import 'infrastructure/datasources/breed_remote_datasource.dart';
import 'infrastructure/repositories/breed_repository_impl.dart';
import 'presentation/blocs/breeds_bloc.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    // Setup dependency injection
    final dioClient = DioClient();
    final remoteDataSource = BreedRemoteDataSource(dio: dioClient.dio);
    final repository = BreedRepositoryImpl(remoteDataSource: remoteDataSource);
    final getBreedsUseCase = GetBreedsUseCase(repository: repository);
    final cacheService = LocalCacheService(prefs);

    return BlocProvider(
      create: (context) =>
          BreedsBloc(getBreedsUseCase: getBreedsUseCase, cacheService: cacheService)..add(const BreedsEvent.fetched()),
      child: MaterialApp(
        title: 'Cat Directory',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const HomePage(),
      ),
    );
  }
}
