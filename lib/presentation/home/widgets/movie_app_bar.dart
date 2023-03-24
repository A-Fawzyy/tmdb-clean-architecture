import 'package:common/localization.dart';
import 'package:flutter/material.dart';
import 'package:platform_channels_challenge/util/ext/index.dart';

class MovieAppBar extends StatelessWidget with PreferredSizeWidget {
  const MovieAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/ic_logo.png', height: 25, width: 25),
          SizedBox(width: context.w * 0.03),
          Text(
            context.localization.applicationName,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeights.semiBold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      actions: [
        const IconButton(onPressed: null, icon: Icon(Icons.search)),
        SizedBox(width: context.w * 0.03),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: context.colorScheme.secondary, width: 2),
          ),
          child: InkWell(
            onTap: () {},
            child: Image.asset(
              'assets/images/profile_pic.png',
              height: context.w * 0.1,
              width: context.w * 0.1,
            ),
          ),
        ),
        const SizedBox(width: 12),
      ],
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
