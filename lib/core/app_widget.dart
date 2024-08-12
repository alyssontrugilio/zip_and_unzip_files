import 'package:flutter/material.dart';

import '../presentation/presentation.dart';
import 'app_route.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 118, 183, 58),
            brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        AppRoute.homePage: (context) => const HomePage(),
        AppRoute.dropPage: (context) => const DropPage(),
      },
    );
  }
}
