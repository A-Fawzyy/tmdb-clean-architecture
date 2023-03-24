import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_clean_architecture/di/index.dart';
import 'package:tmdb_clean_architecture/presentation/home/bloc/movie_cubit.dart';
import 'package:tmdb_clean_architecture/presentation/home/home_content.dart';
import 'package:tmdb_clean_architecture/presentation/home/widgets/movie_app_bar.dart';
import 'package:tmdb_clean_architecture/util/ext/context.dart';

/// Home Container Widget which shows the drawer and
/// bottom navigation and the current page
///
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieCubit>(
      create: (context) => locator()..loadData(),
      child: Scaffold(
        backgroundColor: context.colorScheme.background,
        drawer: const NavigationDrawer(
          backgroundColor: Colors.black,
          children: [],
        ),
        appBar: const MovieAppBar(),
        body: const HomeContent(),
      ),
    );
  }
}
