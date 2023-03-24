
import 'package:tmdb_clean_architecture/data/base_data_source/base_favorites_local_data_source.dart';
import 'package:tmdb_clean_architecture/data/model/index.dart';

class FavoritesLocalDataSource extends BaseFavoritesLocalDataSource {
  FavoritesLocalDataSource(super.client);

  @override
  Future<void> addFavorite(MovieModel movie) {
    return hiveBox.put(movie.id, movie);
  }

  @override
  Future<void> removeFavorite(MovieModel movie) {
    return hiveBox.delete(movie.id);
  }

  @override
  bool isFavoriteMovie(MovieModel movie) {
    return hiveBox.values.toList().any((element) => element.id == movie.id);
  }


}
