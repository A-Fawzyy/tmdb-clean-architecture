import 'package:hive/hive.dart';
import 'package:platform_channels_challenge/data/model/movie_model.dart';

abstract class BaseBookmarksLocalDataSource {


  BaseBookmarksLocalDataSource(this.hiveBox);

  final Box<MovieModel> hiveBox;

  Future<void> addBookmark(MovieModel movie);
  Future<void> removeBookmark(MovieModel movie);
  bool isMovieBookmarked(MovieModel movie);
}
