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

  /// Loads the paginated movie data for the given page number
  void loadData([int pageNumber = Constants.defaultPageNumber]) {
    emit(state.copyWith(status: RequestState.loading));

    repo.getMovies(pageNumber).then((movies) {
      emit(state.copyWith(movies: movies, status: RequestState.success));
    }).catchError((error) {
      emit(state.copyWith(status: RequestState.error));
    });
  }
}
