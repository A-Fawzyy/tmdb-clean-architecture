import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform_channels_challenge/di/index.dart';
import 'package:platform_channels_challenge/presentation/home/bloc/movie_cubit.dart';
import 'package:platform_channels_challenge/presentation/home/home_content.dart';
import 'package:platform_channels_challenge/presentation/home/widgets/movie_app_bar.dart';
import 'package:platform_channels_challenge/util/ext/context.dart';

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
