import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MilanieRoboApp());
}

class MilanieRoboApp extends StatelessWidget {
  const MilanieRoboApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Milanie Robo',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}