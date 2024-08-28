import 'package:flutter/material.dart';
import 'package:p1/Widgets/Dark_Theme.dart';
import 'package:p1/Widgets/Light_Theme.dart';

import 'package:p1/Pages/Other/Welcome_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const WelcomePage(),
    );
  }
}
