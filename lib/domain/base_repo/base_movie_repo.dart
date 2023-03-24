import 'package:platform_channels_challenge/data/base_data_source/index.dart';
import 'package:platform_channels_challenge/domain/entity/movie.dart';

abstract class BaseMovieRepo {
  BaseMovieRepo(this.movieDataSource, this.bookmarksLocalDataSource);

  final BaseMovieDataSource movieDataSource;
  final BaseBookmarksLocalDataSource bookmarksLocalDataSource;

  /// Retrieves movies returning a List of [Movie]
  ///
  /// [pageNumber] is the page number to retrieve between 1 and 1000,
  /// it's default value is 1
  Future<List<Movie>> getMovies(int pageNumber);

  /// Retrieves popular movies returning a List of [Movie]
  ///
  /// [pageNumber] is the page number to retrieve between 1 and 1000,
  /// it's default value is 1
  Future<List<Movie>> getPopularMovies(int pageNumber);

  Future<void> addBookmark(Movie movie);

  Future<void> removeBookmark(Movie movie);

  bool isMovieBookmarked(Movie movie);
}
