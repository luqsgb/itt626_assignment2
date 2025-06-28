import 'package:flutter/material.dart';
import '../models/xrp_data.dart';
import 'detail_card.dart';

class MarketDetailsSection extends StatelessWidget {
  final XRPData? xrpData;
  final Color accentColor;
  final String currency;
  final String sectionTitle;

  const MarketDetailsSection({
    super.key,
    required this.xrpData,
    this.accentColor = const Color(0xFF00FF88),
    this.currency = 'MYR',
    this.sectionTitle = 'Market Details',
  });

  @override
  Widget build(BuildContext context) {
    if (xrpData == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: DetailCard(
                title: 'Bid Price',
                value: '$currency ${xrpData!.bid}',
                icon: Icons.trending_down,
                accentColor: accentColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DetailCard(
                title: 'Ask Price',
                value: '$currency ${xrpData!.ask}',
                icon: Icons.trending_up,
                accentColor: accentColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        DetailCard(
          title: '24h Volume',
          value: '${xrpData!.formattedVolume} XRP',
          icon: Icons.bar_chart,
          fullWidth: true,
          accentColor: accentColor,
        ),
      ],
    );
  }
}