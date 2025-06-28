import 'package:flutter/material.dart';
import '../models/xrp_data.dart';

class PriceCard extends StatelessWidget {
  final XRPData? xrpData;
  final Animation<double> priceAnimation;
  final Color accentColor;
  final String currency;

  const PriceCard({
    super.key,
    required this.xrpData,
    required this.priceAnimation,
    this.accentColor = const Color(0xFF00FF88),
    this.currency = 'MYR',
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: priceAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.95 + (0.05 * priceAnimation.value),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF1E1E1E),
                  Color(0xFF2D2D2D),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: accentColor.withOpacity(0.3),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '$currency ${xrpData?.formattedPrice ?? '0.00'}',
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Last Updated: ${xrpData?.lastUpdated ?? '--:--'}',
                    style: TextStyle(
                      color: Colors.grey[300],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
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