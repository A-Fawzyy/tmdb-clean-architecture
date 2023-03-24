import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:native_network_plugin/native_network_plugin.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:tmdb_clean_architecture/data/base_data_source/base_bookmarks_local_data_source.dart';
import 'package:tmdb_clean_architecture/data/base_data_source/base_movie_data_source.dart';
import 'package:tmdb_clean_architecture/data/data_source/bookmarks_local_data_source.dart';
import 'package:tmdb_clean_architecture/data/data_source/movie_data_source.dart';
import 'package:tmdb_clean_architecture/data/model/index.dart';
import 'package:tmdb_clean_architecture/data/repo/movie_repo.dart';
import 'package:tmdb_clean_architecture/domain/base_repo/base_movie_repo.dart';
import 'package:tmdb_clean_architecture/infrastructure/index.dart';
import 'package:tmdb_clean_architecture/infrastructure/platform_channel_client.dart';
import 'package:tmdb_clean_architecture/presentation/home/bloc/movie_cubit.dart';
import 'package:tmdb_clean_architecture/util/constants.dart';

final locator = GetIt.instance;

class DependencyInjector {

  /// Use this to call api from the native network plugin
  static const String networkPluginKey = 'network_plugin';
  /// Use this to call api from the flutter dio client
  static const String dioKey = 'dio';

  static Future<void> _initHive() async {
    final Directory directory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    Hive.registerAdapter(MovieModelAdapter());
    await Hive.openBox<MovieModel>(HiveConstants.bookmarksBoxKey);
  }


  static Future<void> injectModules() async {
    await _initHive();
    /// region MovieList
    locator.registerFactory<BaseBookmarksLocalDataSource>(
          () => BookmarksLocalDataSource(Hive.box(HiveConstants.bookmarksBoxKey)),
    );
    locator.registerLazySingleton<BaseMovieDataSource>(
          () => MovieDataSource(locator(instanceName: networkPluginKey)),
    );
    locator.registerLazySingleton<BaseMovieRepo>(
          () => MovieRepo(locator(), locator()),
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
      instanceName: 'dio',
    );

    locator.registerLazySingleton<BaseNetworkClient>(
          () => PlatformChannelClient(locator()),
      instanceName: 'network_plugin',
    );

    locator.registerLazySingleton<NativeNetworkPlugin>(
          () => NativeNetworkPlugin(),
    );
  }
}
