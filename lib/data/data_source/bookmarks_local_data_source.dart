
import 'package:platform_channels_challenge/data/base_data_source/base_bookmarks_local_data_source.dart';
import 'package:platform_channels_challenge/data/model/index.dart';

class BookmarksLocalDataSource extends BaseBookmarksLocalDataSource {
  BookmarksLocalDataSource(super.client);

  @override
  Future<void> addBookmark(MovieModel movie) {
    return hiveBox.put(movie.id, movie);
  }

  @override
  Future<void> removeBookmark(MovieModel movie) {
    return hiveBox.delete(movie.id);
  }

  @override
  bool isMovieBookmarked(MovieModel movie) {
    return hiveBox.values.toList().any((element) => element.id == movie.id);
  }


}
