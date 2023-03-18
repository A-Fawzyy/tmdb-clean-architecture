import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:native_network_plugin/native_network_plugin.dart';
import 'package:platform_channels_challenge/data/base_data_source/base_movie_data_source.dart';
import 'package:platform_channels_challenge/data/data_source/movie_data_source.dart';
import 'package:platform_channels_challenge/data/repo/movie_repo.dart';
import 'package:platform_channels_challenge/domain/base_repo/base_movie_repo.dart';
import 'package:platform_channels_challenge/infrastructure/index.dart';
import 'package:platform_channels_challenge/infrastructure/platform_channel_client.dart';
import 'package:platform_channels_challenge/presentation/home/bloc/movie_cubit.dart';

final locator = GetIt.instance;

class DependencyInjector {

  /// Use this to call api from the native network plugin
  static const String networkPluginKey = 'network_plugin';
  /// Use this to call api from the flutter dio client
  static const String dioKey = 'dio';


  static void injectModules() {
    /// region MovieList
    locator.registerLazySingleton<BaseMovieDataSource>(
          () => MovieDataSource(locator(instanceName: networkPluginKey)),
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
