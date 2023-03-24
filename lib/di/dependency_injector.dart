import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:native_network_plugin/native_network_plugin.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:tmdb_clean_architecture/data/index.dart';
import 'package:tmdb_clean_architecture/domain/index.dart';
import 'package:tmdb_clean_architecture/infrastructure/index.dart';
import 'package:tmdb_clean_architecture/infrastructure/platform_channel_client.dart';
import 'package:tmdb_clean_architecture/presentation/home/bloc/index.dart';
import 'package:tmdb_clean_architecture/util/constants.dart';

final locator = GetIt.instance;

class DependencyInjector {
  /// Use this to call api from the native network plugin
  static const String networkPluginKey = 'network_plugin';

  /// Use this to call api from the flutter dio client
  static const String dioKey = 'dio';

  static Future<void> _initHive() async {
    final Directory directory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(MovieModelAdapter());
    await Hive.openBox<MovieModel>(HiveConstants.favoriteBoxKey);
  }

  static Future<void> injectModules() async {
    await _initHive();
    // region MovieList
    locator.registerFactory<Box<MovieModel>>(
      () => Hive.box<MovieModel>(HiveConstants.favoriteBoxKey),
    );
    locator.registerFactory<BaseFavoritesLocalDataSource>(
      () => FavoritesLocalDataSource(locator()),
    );
    locator.registerLazySingleton<BaseMovieDataSource>(
      () => MovieDataSource(locator(instanceName: networkPluginKey)),
    );
    //region repos
    locator.registerLazySingleton<BaseMovieRepo>(
      () => MovieRepo(locator()),
    );
    locator.registerLazySingleton<BaseFavoritesRepo>(
      () => FavoritesRepo(locator()),
    );
    //endregion
    //region useCases
    locator.registerFactory<GetMoviesUseCase>(
      () => GetMoviesUseCase(locator()),
    );
    locator.registerFactory<IsFavoriteMovieUseCase>(
      () => IsFavoriteMovieUseCase(locator()),
    );
    locator.registerFactory<SaveFavoriteUseCase>(
      () => SaveFavoriteUseCase(locator()),
    );
    locator.registerFactory<RemoveFavoriteUseCase>(
      () => RemoveFavoriteUseCase(locator()),
    );
    //endregion

    //region cubits
    locator.registerFactory<MovieListCubit>(
      () => MovieListCubit(locator()),
    );
    locator.registerFactory<FavoritesCubit>(
      () => FavoritesCubit(
        locator(),
        locator(),
        locator(),
      ),
    );
    //endregion

    // endregion

    locator.registerLazySingleton<Dio>(
      () => Dio(),
    );

    locator.registerLazySingleton<BaseNetworkClient>(
      () => DioClient(locator()),
      instanceName: dioKey,
    );

    locator.registerLazySingleton<BaseNetworkClient>(
      () => PlatformChannelClient(locator()),
      instanceName: networkPluginKey,
    );

    locator.registerLazySingleton<NativeNetworkPlugin>(
      () => NativeNetworkPlugin(),
    );
  }
}
