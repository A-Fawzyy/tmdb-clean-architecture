import 'package:flutter/material.dart';

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
      title: 'Platform Channels Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ColoredBox(color: Colors.red),
    );
  }
}
