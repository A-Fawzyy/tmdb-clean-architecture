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
    final List movies;
    if(response is String) {
      final valueMap = json.decode(response as String);
      movies =   valueMap['results'] as List;
    } else {
      movies = response.data['results'] as List;
    }
    return movies
        .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
        .toList();
  }


  @override
  Future<List<MovieModel>> getPopularMovies(int pageNumber) async {
    final response = await client.get(
      EndpointsConstants.popularMoviePath,
      queryParameters: {
        'page': pageNumber,
        'api_key': Constants.apiKey,
        // 'sort_by': 'popularity.desc',
      },
    );
    final List movies;
    if(response is String) {
      final valueMap = json.decode(response as String);
      movies =   valueMap['results'] as List;
    } else {
      movies = response.data['results'] as List;
    }
    return movies
        .map((movie) => MovieModel.fromJson(movie as Map<String, dynamic>))
        .toList();
  }
}
