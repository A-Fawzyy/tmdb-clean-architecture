import 'package:platform_channels_challenge/data/model/movie_model.dart';
import 'package:platform_channels_challenge/infrastructure/index.dart';

abstract class BaseMovieDataSource {


  BaseMovieDataSource(this.client);

  final BaseNetworkClient client;

  /// NetworkClient
  ///

  /// Retrieves movies returning a list of [MovieModel]
  ///
  /// [pageNumber] is the page number to retrieve between 1 and 1000,
  /// it's default value is 1
  Future<List<MovieModel>> getMovies(int pageNumber);
  Future<List<MovieModel>> getPopularMovies(int pageNumber);
}
