import 'package:platform_channels_challenge/data/mapper_extension/index.dart';
import 'package:platform_channels_challenge/domain/base_repo/base_movie_repo.dart';
import 'package:platform_channels_challenge/domain/entity/movie.dart';

class MovieRepo extends BaseMovieRepo {
  MovieRepo(super.dataSource);

  @override
  Future<List<Movie>> getMovies(int pageNumber) async {
    final movies = await dataSource.getMovies(pageNumber);
    return movies.map((movieModel) => movieModel.toDomain()).toList();
  }

  @override
  Future<List<Movie>> getPopularMovies(int pageNumber) async {
    final movies = await dataSource.getPopularMovies(pageNumber);
    return movies.map((movieModel) => movieModel.toDomain()).toList();
  }
}
