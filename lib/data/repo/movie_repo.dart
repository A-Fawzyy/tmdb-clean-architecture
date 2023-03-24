import 'package:platform_channels_challenge/data/mapper_extension/index.dart';
import 'package:platform_channels_challenge/domain/base_repo/base_movie_repo.dart';
import 'package:platform_channels_challenge/domain/entity/movie.dart';

class MovieRepo extends BaseMovieRepo {
  MovieRepo(super.movieDataSource, super.bookmarksLocalDataSource);


  @override
  Future<List<Movie>> getMovies(int pageNumber) async {
    final movies = await movieDataSource.getMovies(pageNumber);
    return movies.map((movieModel) => movieModel.toDomain()).toList();
  }

  @override
  Future<List<Movie>> getPopularMovies(int pageNumber) async {
    final movies = await movieDataSource.getPopularMovies(pageNumber);
    return movies.map((movieModel) => movieModel.toDomain()).toList();
  }

  @override
  Future<void> addBookmark(Movie movie) {
    return bookmarksLocalDataSource.addBookmark(movie.fromDomain());
  }

  @override
  Future<void> removeBookmark(Movie movie) {
    return bookmarksLocalDataSource.removeBookmark(movie.fromDomain());
  }

  @override
  bool isMovieBookmarked(Movie movie) {
    return bookmarksLocalDataSource.isMovieBookmarked(movie.fromDomain());
  }
}
