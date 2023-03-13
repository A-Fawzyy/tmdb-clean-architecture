import 'package:bloc/bloc.dart';
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

  /// Loads the paginated movie data for the given page number
  void loadData() {
    emit(state.copyWith(status: RequestState.loading));

    repo.getMovies(_pageNumber).then((movies) {
      wholeList.addAll(movies);
      emit(state.copyWith(movies: wholeList, status: RequestState.success));
      _pageNumber++;
    }).catchError((error) {
      emit(state.copyWith(status: RequestState.error));
    });
  }
}
