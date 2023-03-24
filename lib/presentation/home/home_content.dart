import 'package:common/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tmdb_clean_architecture/presentation/home/widgets/index.dart';

class HomeContent extends HookWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    // search bar
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: MoviePaginatedList(
          title: context.localization.discover,
          scrollController: useScrollController(),
        ),
      ),
    );
  }
}
