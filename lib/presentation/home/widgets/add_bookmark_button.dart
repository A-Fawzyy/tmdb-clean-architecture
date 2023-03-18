import 'package:flutter/material.dart';
import 'package:platform_channels_challenge/domain/entity/movie.dart';
import 'package:platform_channels_challenge/util/index.dart';

class AddBookmarkButton extends StatelessWidget {
  const AddBookmarkButton({
    super.key,
    required this.movie,
  });

  final Movie? movie;

  @override
  Widget build(BuildContext context) {
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
              Icons.bookmark_add,
              color: context.colorScheme.secondary,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
