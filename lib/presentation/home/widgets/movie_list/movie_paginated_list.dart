import 'package:common/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/common/index.dart';
import 'package:tmdb_clean_architecture/domain/entity/movie.dart';
import 'package:tmdb_clean_architecture/presentation/home/bloc/movie_cubit.dart';
import 'package:tmdb_clean_architecture/presentation/home/widgets/movie_list/movie_card.dart';
import 'package:tmdb_clean_architecture/util/index.dart';

/// class that builds a horizontal list movie cards widget
class MoviePaginatedList extends StatelessWidget {
  const MoviePaginatedList({
    super.key,
    this.title,
    this.scrollController,
  });

  final String? title;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
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
        BlocBuilder<MovieCubit, MovieState>(
          builder: (context, state) {
            if (state.status == RequestState.loading) {
              return Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: context.colorScheme.secondary,
                  ),
                ),
              );
            } else if (state.status == RequestState.success) {
              final movies = state.movies;
              return Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SwitchListTile.adaptive(
                            title: Text(context.localization.sort),
                            value: state.isSorted ?? false,
                            onChanged: (value) =>
                                context.read<MovieCubit>().toggleSorting(),
                          ),
                        ),
                        Expanded(
                          child: SwitchListTile.adaptive(
                            title: Text(context.localization.filter),
                            value: state.isFiltered ?? false,
                            onChanged: (value) =>
                                context.read<MovieCubit>().toggleFiltering(),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: GridView.builder(
                        key: const PageStorageKey<String>('movies_grid'),
                        controller: scrollController,
                        itemCount: movies?.length ?? 0,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: movies?[index] ?? const Movie(),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.64,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state.status == RequestState.error) {
              return Center(
                child: Text(
                  'Error',
                  style: context.textTheme.bodySmall,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }

  void setupScrollController(BuildContext context) {
    if (scrollController?.hasListeners == false) {
      scrollController?.addListener(
        () {
          if (scrollController?.position.atEdge == true) {
            if (scrollController?.position.pixels != 0) {
              context.read<MovieCubit>().loadData();
            }
          }
        },
      );
    }
  }
}
