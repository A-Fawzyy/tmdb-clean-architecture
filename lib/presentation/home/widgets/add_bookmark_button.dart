import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:platform_channels_challenge/data/model/index.dart';
import 'package:platform_channels_challenge/domain/entity/movie.dart';
import 'package:platform_channels_challenge/presentation/home/bloc/movie_cubit.dart';
import 'package:platform_channels_challenge/util/index.dart';

class AddBookmarkButton extends StatelessWidget {
  const AddBookmarkButton({
    super.key,
    required this.movie,
    required this.cubit,
  });

  final Movie? movie;
  final MovieCubit cubit;

  @override
  Widget build(BuildContext context) {
    final Box<MovieModel> box = Hive.box<MovieModel>(HiveConstants.bookmarksBoxKey);
    return ValueListenableBuilder(
      valueListenable: box.listenable(),
      builder: (BuildContext context, value, Widget? child) {
        final bool isMovieBookmarked = box.containsKey(movie?.id);
        return Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              color: context.colorScheme.secondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  isMovieBookmarked ? Icons.bookmark_remove : Icons.bookmark_add,
                  color: context.colorScheme.secondary,
                ),
              ),
              onTap: () {
                if (movie != null) {
                  cubit.toggleBookmark(movie!);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
