import 'package:flutter/material.dart';
import '../models/xrp_data.dart';

class StatusSection extends StatelessWidget {
  final XRPData? xrpData;
  final VoidCallback onRefresh;
  final Color accentColor;

  const StatusSection({
    super.key,
    required this.xrpData,
    required this.onRefresh,
    this.accentColor = const Color(0xFF00FF88),
  });

  @override
  Widget build(BuildContext context) {
    if (xrpData == null) return const SizedBox.shrink();

    bool isActive = xrpData!.status == 'ACTIVE';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive
              ? accentColor.withOpacity(0.3)
              : Colors.red.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: isActive ? accentColor : Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Market Status: ${xrpData!.status}',
            style: TextStyle(
              color: isActive ? accentColor : Colors.red,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onRefresh,
            icon: Icon(
              Icons.refresh,
              color: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}