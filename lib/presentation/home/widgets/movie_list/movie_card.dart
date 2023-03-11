import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:platform_channels_challenge/domain/entity/movie.dart';
import 'package:platform_channels_challenge/util/ext/string.dart';
import 'package:platform_channels_challenge/util/index.dart';

/// class that builds a movie card widget
/// showing the movie poster and title
class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w * 0.3125,
      child: Column(
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: '${movie?.posterURLPath?.toImageURL}',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (_, __, loadingProgress) =>
                    CircularProgressIndicator(
                  value: loadingProgress.totalSize != null
                      ? loadingProgress.downloaded / loadingProgress.totalSize!
                      : null,
                  color: context.colorScheme.secondary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Center(
              child: Text(
                movie?.title ?? movie?.originalTitle ?? '',
                style: context.textTheme.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
