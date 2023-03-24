import 'package:tmdb_clean_architecture/data/mapper_extension/index.dart';
import 'package:tmdb_clean_architecture/domain/base_repo/base_favorite_repo.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';

/// Repository to handle all the movie favorite related operations
///
/// This class is responsible for handling
/// saving, removing and checking if a movie is favorite
///
class FavoritesRepo extends BaseFavoritesRepo {

  /// Creates a [FavoritesRepo] instance
  ///
  /// [favoritesLocalDataSource] is required to save,
  /// remove and check if a movie is favorite
  ///
  FavoritesRepo(super.favoritesLocalDataSource);

  @override
  Future<void> saveFavorite(Movie movie) {
    return favoritesLocalDataSource.addFavorite(movie.fromDomain());
  }

  @override
  Future<void> removeFavorite(Movie movie) {
    return favoritesLocalDataSource.removeFavorite(movie.fromDomain());
  }

  @override
  bool isFavoriteMovie(Movie movie) {
    return favoritesLocalDataSource.isFavoriteMovie(movie.fromDomain());
  }
}
