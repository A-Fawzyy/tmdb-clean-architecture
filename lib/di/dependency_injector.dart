import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:platform_channels_challenge/data/base_data_source/base_movie_data_source.dart';
import 'package:platform_channels_challenge/data/data_source/movie_data_source.dart';
import 'package:platform_channels_challenge/data/repo/movie_repo.dart';
import 'package:platform_channels_challenge/domain/base_repo/base_movie_repo.dart';
import 'package:platform_channels_challenge/infrastructure/index.dart';
import 'package:platform_channels_challenge/presentation/home/bloc/movie_cubit.dart';

final locator = GetIt.instance;

class DependencyInjector {
  static void injectModules() {
    /// region MovieList
    locator.registerLazySingleton<BaseMovieDataSource>(
      () => MovieDataSource(locator()),
    );
    locator.registerLazySingleton<BaseMovieRepo>(
      () => MovieRepo(locator()),
    );
    locator.registerFactory<MovieCubit>(
      () => MovieCubit(locator()),
    );

    /// endregion

    locator.registerLazySingleton<Dio>(
        () => Dio(),
    );

    locator.registerLazySingleton<BaseNetworkClient>(
        () => DioClient(locator()),
    );
  }
}
