import 'package:tmdb_clean_architecture/core/index.dart';
import 'package:tmdb_clean_architecture/domain/base_repo/base_favorite_repo.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';

/// Use case to remove a [Movie] from favorites
///
class RemoveFavoriteUseCase extends BaseUseCase<Future<void>, Movie> {
  final BaseFavoritesRepo favoritesRepo;

  /// Creates a [RemoveFavoriteUseCase] instance
  ///
  /// [favoritesRepo] is the repository to remove the [Movie] from favorites
  ///
  RemoveFavoriteUseCase(this.favoritesRepo);

  @override
  Future<void> execute(Movie params) {
    return favoritesRepo.removeFavorite(params);
  }
}
