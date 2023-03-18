import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:platform_channels_challenge/domain/entity/movie.dart';
import 'package:platform_channels_challenge/presentation/home/widgets/add_bookmark_button.dart';
import 'package:platform_channels_challenge/presentation/home/widgets/movie_stats_row.dart';
import 'package:platform_channels_challenge/util/ext/string.dart';
import 'package:platform_channels_challenge/util/index.dart';

/// class that builds a movie card widget
/// showing the movie poster and title
class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    this.width,
  });

  final Movie? movie;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  height: context.h * .28,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: '${movie?.posterURLPath?.toImageURL}',
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (_, __, loadingProgress) =>
                          SizedBox(
                        height: context.h * .28,
                        child: LinearProgressIndicator(
                          color: context.colorScheme.secondary.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                AddBookmarkButton(movie: movie),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: width ?? context.w * .35,
                  child: Text(
                    movie?.title ?? movie?.originalTitle ?? '',
                    style: context.textTheme.bodyMedium,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Container(
              decoration: BoxDecoration(
                color: context.colorScheme.secondary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              width: width ?? context.w * .30,
              child: MovieStatsRow(movie: movie),
            ),
          ],
        ),
      ),
    );
  }
}
