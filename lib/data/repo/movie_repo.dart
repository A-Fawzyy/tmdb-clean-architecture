import 'package:tmdb_clean_architecture/data/mapper_extension/index.dart';
import 'package:tmdb_clean_architecture/domain/base_repo/base_movie_repo.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';

/// Repository to get movies from the data source
///
/// This class is responsible for getting the movies from the data source
///
class MovieRepo extends BaseMovieRepo {

  /// Creates a [MovieRepo] instance
  ///
  /// [movieDataSource] is required to get the movies
  ///
  MovieRepo(super.movieDataSource);


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
}
