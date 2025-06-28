// Model class for XRP data
class XRPData {
  final String pair;
  final int timestamp;
  final String bid;
  final String ask;
  final String lastTrade;
  final String rollingVolume;
  final String status;

  XRPData({
    required this.pair,
    required this.timestamp,
    required this.bid,
    required this.ask,
    required this.lastTrade,
    required this.rollingVolume,
    required this.status,
  });

  factory XRPData.fromJson(Map<String, dynamic> json) {
    return XRPData(
      pair: json['pair'] ?? '',
      timestamp: json['timestamp'] ?? 0,
      bid: json['bid'] ?? '0.00',
      ask: json['ask'] ?? '0.00',
      lastTrade: json['last_trade'] ?? '0.00',
      rollingVolume: json['rolling_24_hour_volume'] ?? '0.00',
      status: json['status'] ?? 'INACTIVE',
    );
  }

  // Get formatted price
  String get formattedPrice {
    try {
      double price = double.parse(lastTrade);
      return price.toStringAsFixed(2);
    } catch (e) {
      return '0.00';
    }
  }

  // Get formatted volume
  String get formattedVolume {
    try {
      double volume = double.parse(rollingVolume);
      if (volume >= 1000000) {
        return '${(volume / 1000000).toStringAsFixed(1)}M';
      } else if (volume >= 1000) {
        return '${(volume / 1000).toStringAsFixed(1)}K';
      }
      return volume.toStringAsFixed(0);
    } catch (e) {
      return '0';
    }
  }

  // Get last updated time
  String get lastUpdated {
    try {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    } catch (e) {
      return '--:--';
    }
  }
}