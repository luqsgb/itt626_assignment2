import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../layout.dart';
import '../pages/home.dart';
import '../pages/about.dart';

enum AppRoute {
  home,
  about,
  calculator,
}

final GoRouter routing = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ParentWidget(
        child: const HomePage(),
        currentIndex: 0,
        onIndexChanged: (index) => _handleNavigation(context, index),
      ),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => ParentWidget(
        child: const AboutPage(),
        currentIndex: 1, // Corrected index for AboutPage
        onIndexChanged: (index) => _handleNavigation(context, index),
      ),
    ),
  ],
);

void _handleNavigation(BuildContext context, int index) {
  // Get current route path
  final currentPath = GoRouterState.of(context).uri.path;

  // Define the paths for each index
  final paths = ['/', '/about'];

  // Check if we're already on the target page
  if (currentPath == paths[index]) return;

  // Navigate to the selected page
  switch (index) {
    case 0:
      context.go('/');
      break;
    case 1:
      context.go('/about');
      break;
  }
}