import 'package:common/localization.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/util/index.dart';

class GenreTabBar extends StatelessWidget {
  const GenreTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        indicatorColor: context.colorScheme.secondary,
        unselectedLabelColor: Colors.white,
        tabs: [
          Tab(
            text: context.localization.popular,
          ),
          Tab(
            text: context.localization.newAndHot,
          ),
          Tab(
            text: context.localization.premiers,
          ),
        ],
      ),
    );
  }
}
