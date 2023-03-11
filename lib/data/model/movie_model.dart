import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
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

  /// Creates a [MovieModel] instance.
  const MovieModel({
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

  @override
  String toString() {
    return 'MovieModel{ isAdult: $isAdult, backdropURLPath: $backdropURLPath, '
        'id: $id, originalLanguage: $originalLanguage, '
        'originalTitle: $originalTitle, overview: $overview, '
        'popularityScore: $popularityScore, posterURLPath: $posterURLPath, '
        'releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage, '
        'voteCount: $voteCount,}';
  }

  /// Creates a copy of the [MovieModel] with the given fields replaced with the
  /// new values.
  MovieModel copyWith({
    bool? isAdult,
    String? backdropURLPath,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularityScore,
    String? posterURLPath,
    String? releaseDate,
    String? title,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieModel(
      isAdult: isAdult ?? this.isAdult,
      backdropURLPath: backdropURLPath ?? this.backdropURLPath,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularityScore: popularityScore ?? this.popularityScore,
      posterURLPath: posterURLPath ?? this.posterURLPath,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  /// Creates a [MovieModel] from a JSON object.
  ///
  MovieModel.fromJson(Map<String, dynamic> map) :
      isAdult = map['adult'] as bool,
      backdropURLPath = map['backdrop_path'] as String,
      id = map['id'] as int,
      originalLanguage = map['original_language'] as String,
      originalTitle = map['original_title'] as String,
      overview = map['overview'] as String,
      popularityScore = map['popularity'] as double,
      posterURLPath = map['poster_path'] as String,
      releaseDate = map['release_date'] as String,
      title = map['title'] as String,
      voteAverage = map['vote_average'] * 1.0 as double,
      voteCount = map['vote_count'] as int;

  @override
  List<Object?> get props => [id];
}
