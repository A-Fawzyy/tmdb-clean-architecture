import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Size get _mediaQuerySize => MediaQuery.of(this).size;
  double get h=> _mediaQuerySize.height;
  double get w => _mediaQuerySize.width;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;
}
