import 'package:tmdb_clean_architecture/core/index.dart';
import 'package:tmdb_clean_architecture/domain/base_repo/base_movie_repo.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';

/// Use case to get the list of movies
///
/// [movieRepo] is the repository to get the list of movies
///
class GetMoviesUseCase extends BaseUseCase<Future<List<Movie>>, int> {
  final BaseMovieRepo movieRepo;

  /// Creates a [GetMoviesUseCase] instance
  ///
  /// [movieRepo] is the repository to get the list of movies
  ///
  GetMoviesUseCase(this.movieRepo);

  @override
  Future<List<Movie>> execute(int params) {
    return movieRepo.getMovies(params);
  }
}
