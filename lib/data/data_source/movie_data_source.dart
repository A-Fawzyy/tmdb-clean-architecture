import 'dart:convert';

import 'package:platform_channels_challenge/data/base_data_source/base_movie_data_source.dart';
import 'package:platform_channels_challenge/data/model/index.dart';
import 'package:platform_channels_challenge/util/index.dart';

class MovieDataSource extends BaseMovieDataSource {
  MovieDataSource(super.client);


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
    final valueMap = json.decode(response as String);
    final movies =   valueMap['results'] as List;
    return movies
        .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
        .toList();
  }
}
