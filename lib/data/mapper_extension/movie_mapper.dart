import 'package:platform_channels_challenge/data/model/index.dart';

/// Contains mapper functions for the model in the data layer
///
extension MovieModelMapper on MovieModel {

  /// Returns Map converted from [MovieModel]
  ///
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'original_title': originalTitle,
      'overview': overview,
      'original_language': originalLanguage,
      'adult': isAdult,
      'backdrop_path': backdropURLPath,
      'poster_path': posterURLPath,
      'release_date': releaseDate,
      'popularity': popularityScore,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
