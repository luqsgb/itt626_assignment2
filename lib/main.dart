import 'package:flutter/material.dart';
import './routing/router.dart';
import './theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "XRP Crypto Value Tracker",
      // Use your custom dark theme
      theme: AppTheme.darkTheme,
      // Optional: Add light theme support
      // themeMode: ThemeMode.system, // Follows system theme
      routerConfig: routing,
      debugShowCheckedModeBanner: false,
    );
  }
}