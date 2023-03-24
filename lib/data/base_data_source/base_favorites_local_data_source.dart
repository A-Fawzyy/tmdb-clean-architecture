import 'package:hive/hive.dart';
import 'package:tmdb_clean_architecture/data/model/movie_model.dart';

/// Base class for Favorites local data source
///
/// This class is the base class for the [Movie] favorite local data source
/// and it's used to define the methods that the data source must implement
/// to be used in the application
abstract class BaseFavoritesLocalDataSource {


  /// Creates a [BaseFavoritesLocalDataSource] instance
  ///
  /// [hiveBox] is the [Box] where the [Movie] are saved
  ///
  BaseFavoritesLocalDataSource(this.hiveBox);

  /// The [Box] where the [Movie] are saved
  ///
  /// This [Box] is used to save the [Movie] to the local database
  final Box<MovieModel> hiveBox;

  /// Adds a [Movie] to the favorites
  ///
  /// [movie] is the [Movie] to add to the favorites
  ///
  Future<void> addFavorite(MovieModel movie);

  /// Removes a [Movie] from the favorites
  ///
  /// [movie] is the [Movie] to remove from the favorites
  ///
  Future<void> removeFavorite(MovieModel movie);

  /// Checks if a [Movie] is a favorite
  ///
  /// [movie] is the [Movie] to check if it's a favorite
  ///
  bool isFavoriteMovie(MovieModel movie);
}
