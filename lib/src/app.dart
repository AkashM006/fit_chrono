import 'package:fit_chrono/src/core/constants/settings.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appName,
      routerConfig: router,
    );
  }
}
