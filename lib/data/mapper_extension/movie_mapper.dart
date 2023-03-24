import 'package:tmdb_clean_architecture/data/model/index.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';

/// Contains mapper functions for the model in the data layer
///
extension MovieModelMapper on MovieModel {

  /// Returns the entity [Movie] of the Domain Layer after converting
  /// it from the model [MovieModel] of the Data layer
  ///
  Movie toDomain() => Movie(
        id: id,
        title: title,
        overview: overview,
        posterURLPath: posterURLPath,
        backdropURLPath: backdropURLPath,
        voteAverage: voteAverage,
        voteCount: voteCount,
        releaseDate: releaseDate,
        isAdult: isAdult,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        popularityScore: popularityScore,
      );

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

/// Contains mapper function for the entity in the domain layer
extension MovieEntityMapper on Movie {

  /// Returns the model [MovieModel] the Data layer
  /// after converting it from the entity [Movie] of the Domain layer
  ///
  MovieModel fromDomain() => MovieModel(
        id: id,
        title: title,
        overview: overview,
        posterURLPath: posterURLPath,
        backdropURLPath: backdropURLPath,
        voteAverage: voteAverage,
        voteCount: voteCount,
        releaseDate: releaseDate,
        isAdult: isAdult,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        popularityScore: popularityScore,
      );
}
