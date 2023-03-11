import 'package:flutter/material.dart';
import 'package:platform_channels_challenge/domain/entity/movie.dart';
import 'package:platform_channels_challenge/presentation/home/widgets/movie_list/movie_card.dart';
import 'package:platform_channels_challenge/util/index.dart';

/// class that builds a horizontal list movie cards widget
class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    this.movies,
    this.title,
  });

  final String? title;
  final List<Movie>? movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        if (title != null)
          Text(
            title!.toUpperCase(),
            style: context.textTheme.titleMedium,
          ),
        const SizedBox(height: 12),
        SizedBox(
          height: context.h * .27,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: movies?.length ?? 0,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: movies?[index] ?? const Movie(),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                SizedBox(width: context.w * 0.05),
          ),
        ),
      ],
    );
  }
}
