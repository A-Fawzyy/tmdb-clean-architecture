// bf34143c34c2d70aa6dddfeaeb4dbe8b
import 'package:equatable/equatable.dart';

/// A class that represents a movie entity.
class Movie extends Equatable {
  const Movie({
    this.isAdult,
    this.backdropURLPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularityScore,
    this.posterURLPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  /// A boolean value that indicates whether the movie is an adult movie or not.
  final bool? isAdult;

  /// The backdrop image URL path.
  final String? backdropURLPath;

  /// The movie ID.
  final int? id;

  /// The original language of the movie.
  final String? originalLanguage;

  /// The original title of the movie.
  final String? originalTitle;

  /// An overview of the movie's plot and details.
  final String? overview;

  /// The popularity score of the movie.
  final double? popularityScore;

  /// The poster image URL path.
  final String? posterURLPath;

  /// The release date of the movie.
  ///
  /// example: 2023-02-22
  final String? releaseDate;

  /// The title of the movie.
  final String? title;

  /// The average vote of the movie.
  final double? voteAverage;

  /// The number of votes of the movie.
  final int? voteCount;

  @override
  List<Object?> get props => [id];
}
