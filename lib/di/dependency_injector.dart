import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class DependencyInjector {
  static void injectModules() {
    /// region MovieList
    /* locator.registerLazySingleton<MovieDataSource>(
      () => MovieDataSource(locator()),
    );
    locator.registerLazySingleton<BaseMovieRepo>(
      () => BaseMovieRepo(locator()),
    );
    locator.registerFactory<MovieUseCase>(
      () => MovieUseCase(locator()),
    );
    locator.registerFactory<MovieCubit>(
      () => MovieCubit(locator()),
    ); */
    /// endregion


  }
}
