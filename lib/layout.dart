import 'package:flutter/material.dart';
import './widgets/appBar.dart';
import './widgets/navBar.dart';

class ParentWidget extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final Function(int) onIndexChanged;

  const ParentWidget({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          // Main content
          Positioned.fill(
            child: child,
          ),
          // Floating navbar positioned at bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CustomNavBar(
              currentIndex: currentIndex,
              onIndexChanged: onIndexChanged,
            ),
          ),
        ],
      ),
      // Remove the regular bottomNavigationBar to avoid conflicts
    );
  }
}