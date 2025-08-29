import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'Ui Screen/home/cubit/home_cubit.dart';
import 'data/remote/api_helper.dart';
import 'data/repository/news_reposetry.dart';

// Create an instance of the service locator
final sl = GetIt.instance;

/// Initializes all the app's dependencies.
void setupDependencies() {
  // === EXTERNAL ===
  // Register http.Client as a singleton, so the same instance is used across the app.
  sl.registerLazySingleton(() => http.Client());

  // === DATA LAYER ===
  // Register ApiClient implementation. It depends on the http.Client.
  sl.registerLazySingleton<BaseApiClient>(() => ApiClient(httpClient: sl()));

  // Register NewsRepository implementation. It depends on the ApiClient.
  sl.registerLazySingleton<BaseNewsRepository>(
          () => NewsRepositoryImpl(apiClient: sl()));

  // === PRESENTATION LAYER (BLoC/Cubit) ===
  // Register HomeCubit. A new instance will be created every time it's requested.
  sl.registerFactory(() => HomeCubit(newsRepository: sl()));
}