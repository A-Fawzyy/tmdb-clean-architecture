import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';
import 'package:tmdb_clean_architecture/util/index.dart';

class MovieStatsRow extends StatelessWidget {
  const MovieStatsRow({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(Icons.theaters),
        Text(
          '${movie?.voteCount}',
          style: context.textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Icon(Icons.star),
        Text(
          '${movie?.voteAverage}',
          style: context.textTheme.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
