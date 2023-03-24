import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb_clean_architecture/core/index.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';
import 'package:tmdb_clean_architecture/domain/use_case/index.dart';
import 'package:tmdb_clean_architecture/util/index.dart';

part 'movie_state.dart';

/// Cubit for the Movie Screen
class MovieListCubit extends Cubit<MovieState> {
  MovieListCubit(
    this.getMoviesUC,
  ) : super(const MovieState());

  final GetMoviesUseCase getMoviesUC;

  int _pageNumber = Constants.defaultPageNumber;
  List<Movie> wholeList = [];
  List<Movie> updatedList = [];

  /// Loads the paginated movie data for the given page number
  void loadData() {
    emit(state.copyWith(status: RequestState.loading));

    getMoviesUC.execute(_pageNumber).then((movies) {
      wholeList.addAll(movies);
      _getUpdatedList(wholeList);
      emit(state.copyWith(movies: updatedList, status: RequestState.success));
      _pageNumber++;
    }).catchError((error) {
      emit(state.copyWith(status: RequestState.error));
    });
  }

  void toggleSorting() {
    emit(
      state.copyWith(
        status: RequestState.loading,
        isSorted: !(state.isSorted ?? false),
      ),
    );
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
}
