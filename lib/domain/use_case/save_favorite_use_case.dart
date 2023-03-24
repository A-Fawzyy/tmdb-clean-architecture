import 'package:tmdb_clean_architecture/core/index.dart';
import 'package:tmdb_clean_architecture/domain/base_repo/base_favorite_repo.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';

///  Use case to save a [Movie] to favorites
///
class SaveFavoriteUseCase extends BaseUseCase<Future<void>, Movie> {
  final BaseFavoritesRepo favoritesRepo;

  /// Creates a [SaveFavoriteUseCase] instance
  ///
  /// [favoritesRepo] is the repository to save the [Movie] to favorites
  SaveFavoriteUseCase(this.favoritesRepo);

  @override
  Future<void> execute(Movie params) {
    return favoritesRepo.saveFavorite(params);
  }
}
