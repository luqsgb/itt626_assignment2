import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  final Animation<double> pulseAnimation;
  final Color accentColor;
  final String loadingText;

  const LoadingCard({
    super.key,
    required this.pulseAnimation,
    this.accentColor = const Color(0xFF00FF88),
    this.loadingText = 'Loading XRP Data...',
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pulseAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: pulseAnimation.value,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: accentColor.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(accentColor),
                ),
                const SizedBox(height: 16),
                Text(
                  loadingText,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}