import 'package:tmdb_clean_architecture/data/base_data_source/index.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';
import 'package:tmdb_clean_architecture/util/constants.dart';

abstract class BaseMovieRepo {
  /// Creates a [BaseMovieRepo] instance
  ///
  /// [movieDataSource] is required to get the movies
  ///
  BaseMovieRepo(this.movieDataSource);

  /// Data source to get the movies
  ///
  final BaseMovieDataSource movieDataSource;

  /// Retrieves movies returning a List of [Movie]
  ///
  /// [pageNumber] is the page number to retrieve between 1 and 1000,
  /// it's default value is [Constants.defaultPageNumber]
  ///
  Future<List<Movie>> getMovies(int pageNumber);

  /// Retrieves popular movies returning a List of [Movie]
  ///
  /// [pageNumber] is the page number to retrieve between 1 and 1000,
  /// it's default value is [Constants.defaultPageNumber]
  ///
  Future<List<Movie>> getPopularMovies(int pageNumber);
}
