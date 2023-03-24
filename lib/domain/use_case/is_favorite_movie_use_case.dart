import 'package:tmdb_clean_architecture/core/index.dart';
import 'package:tmdb_clean_architecture/domain/base_repo/base_favorite_repo.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';

/// Use case to check if a [Movie] is favorite
///
class IsFavoriteMovieUseCase extends BaseUseCase<bool, Movie> {
  final BaseFavoritesRepo favoritesRepo;

  /// Creates a [IsFavoriteMovieUseCase] instance
  ///
  /// [favoritesRepo] is the repository to check if the [Movie] is favorite
  ///
  IsFavoriteMovieUseCase(this.favoritesRepo);

  @override
  bool execute(Movie params) {
    return favoritesRepo.isFavoriteMovie(params);
  }
}
