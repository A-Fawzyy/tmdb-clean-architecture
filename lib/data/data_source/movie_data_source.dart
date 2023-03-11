import 'package:platform_channels_challenge/data/base_data_source/base_movie_data_source.dart';
import 'package:platform_channels_challenge/data/model/index.dart';
import 'package:platform_channels_challenge/infrastructure/base_network_client.dart';
import 'package:platform_channels_challenge/util/index.dart';

class MovieDataSource extends BaseMovieDataSource {

  MovieDataSource(this.client);

  final BaseNetworkClient client;

  @override
  Future<List<MovieModel>> getMovies(int pageNumber) async {
    final response = await client.get(
      EndpointsConstants.discoverMoviePath,
      queryParameters: {
        'page': pageNumber,
        'api_key': Constants.apiKey,
        'sort_by': 'popularity.desc',
      },
    );
    final movies = response.data['results'] as List;
    return movies
        .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
        .toList();
  }
}
