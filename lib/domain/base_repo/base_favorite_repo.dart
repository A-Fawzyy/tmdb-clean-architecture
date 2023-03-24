import 'package:tmdb_clean_architecture/data/base_data_source/index.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';

/// Base repository for the movie favorite
///
/// This class is the base class for the [Movie] favorite repository
/// and it's used to define the methods that the repository must implement
/// to be used in the application
///
abstract class BaseFavoritesRepo {

  /// Creates a [BaseFavoritesRepo] instance
  ///
  /// [movieDataSource] is the data source to get the [Movie] from the API
  /// [favoritesLocalDataSource] is the data source to save the
  /// [Movie] to the local database
  ///
  BaseFavoritesRepo(this.favoritesLocalDataSource);

  /// Data source to save the [Movie] to the local database
  final BaseFavoritesLocalDataSource favoritesLocalDataSource;

  /// Saves a [Movie] as a favorite
  ///
  Future<void> saveFavorite(Movie movie);

  /// Removes a [Movie] from the favorites
  ///
  Future<void> removeFavorite(Movie movie);

  /// Checks if a [Movie] is a favorite
  ///
  /// Returns true if the [Movie] is a favorite, false otherwise
  bool isFavoriteMovie(Movie movie);
}
