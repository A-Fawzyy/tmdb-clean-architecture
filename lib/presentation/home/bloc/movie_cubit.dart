import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:platform_channels_challenge/common/index.dart';
import 'package:platform_channels_challenge/domain/base_repo/base_movie_repo.dart';
import 'package:platform_channels_challenge/domain/entity/movie.dart';
import 'package:platform_channels_challenge/util/index.dart';

part 'movie_state.dart';

/// Cubit for the Movie Screen
class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.repo) : super(const MovieState());

  final BaseMovieRepo repo;
  int _pageNumber = Constants.defaultPageNumber;
  List<Movie> wholeList = [];
  List<Movie> updatedList = [];

  /// Loads the paginated movie data for the given page number
  void loadData() {
    emit(state.copyWith(status: RequestState.loading));

    repo.getPopularMovies(_pageNumber).then((movies) {
      wholeList.addAll(movies);
      _getUpdatedList(wholeList);
      emit(state.copyWith(movies: updatedList, status: RequestState.success));
      _pageNumber++;
    }).catchError((error) {
      emit(state.copyWith(status: RequestState.error));
    });
  }

  void toggleSorting() {
    emit(state.copyWith(
        status: RequestState.loading, isSorted: !(state.isSorted ?? false)));
    _getUpdatedList(wholeList);
    emit(state.copyWith(movies: updatedList, status: RequestState.success));
  }

  void toggleFiltering() {
    emit(
      state.copyWith(
        status: RequestState.loading,
        isFiltered: !(state.isFiltered ?? false),
      ),
    );
    _getUpdatedList(wholeList);
    emit(state.copyWith(movies: updatedList, status: RequestState.success));
  }

  void _getUpdatedList(List<Movie> movies) {
    updatedList = movies;

    if (state.isSorted == true) {
      updatedList = _sortMovies(updatedList);
    }
    if (state.isFiltered == true) {
      updatedList = _filterMovies(updatedList);
    }
  }

  List<Movie> _sortMovies(List<Movie> movies) =>
      movies.sorted((a, b) => b.voteCount?.compareTo(a.voteCount ?? 0) ?? -1);

  List<Movie> _filterMovies(List<Movie> movies) =>
      movies.where((movie) => (movie.voteAverage ?? 0.0) >= 6.0).toList();

  void toggleBookmark(Movie movie) {
    if (isMovieBookmarked(movie)) {
      repo.removeBookmark(movie);
    } else {
      repo.addBookmark(movie);
    }
  }

  bool isMovieBookmarked(Movie? movie) {
    if (movie == null) {
      return false;
    } else {
      return repo.isMovieBookmarked(movie);
    }
  }
}
