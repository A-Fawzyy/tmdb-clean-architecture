part of 'movie_cubit.dart';

class MovieState extends Equatable {
  const MovieState({
    this.movies,
    this.status = RequestState.initial,
  });

  final List<Movie>? movies;
  final RequestState status;

  @override
  List<Object?> get props => [movies, status];

  MovieState copyWith({
    List<Movie>? movies,
    RequestState? status,
  }) {
    return MovieState(
      movies: movies ?? movies,
      status: status ?? this.status,
    );
  }
}
