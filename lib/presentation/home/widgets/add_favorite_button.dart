import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmdb_clean_architecture/data/model/index.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';
import 'package:tmdb_clean_architecture/presentation/home/bloc/favorite/favorites_cubit.dart';
import 'package:tmdb_clean_architecture/util/index.dart';

class AddFavoriteButton extends StatelessWidget {
  const AddFavoriteButton({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    final Box<MovieModel> box = Hive.box<MovieModel>(
        HiveConstants.favoriteBoxKey);
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (BuildContext context, value, Widget? child) {
        final bool isFavoriteMovie = box.containsKey(movie?.id);
        return Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: context.colorScheme.secondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () => onFavoriteTapped(context),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  isFavoriteMovie ? Icons.bookmark_remove : Icons.bookmark_add,
                  color: context.colorScheme.secondary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void onFavoriteTapped(BuildContext context) {
    final cubit = context.read<FavoritesCubit>();
    if (movie != null) {
      cubit.toggleFavorite(movie!);
    }
  }
}
