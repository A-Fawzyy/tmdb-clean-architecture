import 'package:common/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:platform_channels_challenge/di/index.dart';

void main() {
  DependencyInjector.injectModules();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: LocalizationHelper.supportedLocales,
      locale: LocalizationHelper.defaultLocale,
      localizationsDelegates: const [
        LocalizationHelper.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Movies App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ColoredBox(color: Colors.red),
    );
  }
}
