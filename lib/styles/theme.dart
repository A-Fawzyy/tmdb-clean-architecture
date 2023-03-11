import 'package:flutter/material.dart';

import 'package:platform_channels_challenge/styles/colors.dart';

TextTheme? get customTextTheme {
  final TextTheme base = Typography
      .material2018()
      .black;
  return base.apply(
    fontFamily: 'Montserrat',
    displayColor: primaryColor,
    bodyColor: primaryColor,
  );
}

ThemeData darkTheme = ThemeData(
  fontFamily: 'Montserrat',
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.dark(
    primary: primaryColor,
    secondary: secondaryColor,
    background: backgroundColor,
  ),
);
