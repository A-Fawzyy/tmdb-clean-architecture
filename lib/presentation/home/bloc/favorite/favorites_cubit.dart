import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';
import 'package:tmdb_clean_architecture/domain/use_case/index.dart';

part 'favorite_state.dart';

class FavoritesCubit extends Cubit<FavoriteState> {
  FavoritesCubit(
    this.isFavoriteMovieUC,
    this.saveFavoriteUC,
    this.removeFavoriteUC,
  ) : super(FavoriteState.notFavorite());

  final IsFavoriteMovieUseCase isFavoriteMovieUC;
  final SaveFavoriteUseCase saveFavoriteUC;
  final RemoveFavoriteUseCase removeFavoriteUC;

  void toggleFavorite(Movie? movie) {
    if (movie == null) {
      return;
    }
    if (isFavoriteMovie(movie)) {
      saveFavoriteUC.execute(movie);
      emit(FavoriteState.favorite());
    } else {
      removeFavoriteUC.execute(movie);
      emit(FavoriteState.notFavorite());
    }
  }

  bool isFavoriteMovie(Movie? movie) {
    if (movie == null) {
      return false;
    } else {
      return isFavoriteMovieUC.execute(movie);
    }
  }
}
