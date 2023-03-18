part of 'movie_cubit.dart';

class MovieState extends Equatable {
  const MovieState({
    this.movies,
    this.status = RequestState.initial,
    this.isSorted = false,
    this.isFiltered = false,
  });

  final List<Movie>? movies;
  final RequestState status;
  final bool? isSorted;
  final bool? isFiltered;

  @override
  List<Object?> get props => [movies, status];

  MovieState copyWith({
    List<Movie>? movies,
    RequestState? status,
    bool? isSorted,
    bool? isFiltered,
  }) {
    return MovieState(
      movies: movies ?? movies,
      status: status ?? this.status,
      isSorted: isSorted ?? this.isSorted,
      isFiltered: isFiltered ?? this.isFiltered,
    );
  }
}
