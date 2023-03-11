import 'package:common/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_channels_challenge/common/index.dart';
import 'package:platform_channels_challenge/presentation/home/bloc/movie_cubit.dart';
import 'package:platform_channels_challenge/presentation/home/widgets/index.dart';
import 'package:platform_channels_challenge/util/index.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    // search bar
    return SafeArea(
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (BuildContext context, state) {
          return state.status == RequestState.loading
              ? Center(child: CircularProgressIndicator(color: context.colorScheme.secondary,))
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: MovieList(title: context.localization.discover, movies: state.movies),
              );
        },
      ),
    );
  }
}
