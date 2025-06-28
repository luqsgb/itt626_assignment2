import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// Import your separated widgets and models
import '../models/xrp_data.dart';
import '../widgets/welcome_section.dart';
import '../widgets/price_card.dart';
import '../widgets/loading_card.dart';
import '../widgets/error_card.dart';
import '../widgets/market_details_section.dart';
import '../widgets/status_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  XRPData? xrpData;
  bool isLoading = true;
  String? errorMessage;
  Timer? _autoRefreshTimer;
  late AnimationController _pulseController;
  late AnimationController _priceController;
  late Animation<double> _pulseAnimation;
  late Animation<double> _priceAnimation;

  // Theme colors
  static const Color accentColor = Color(0xFF00FF88);

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _fetchXRPData();
    _startAutoRefresh();
  }

  void _initializeAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _priceController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    _priceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _priceController,
      curve: Curves.elasticOut,
    ));
  }

  void _startAutoRefresh() {
    _autoRefreshTimer = Timer.periodic(const Duration(seconds: 30), (timer) {
      if (mounted) {
        _fetchXRPData(showLoadingIndicator: false);
      }
    });
  }

  Future<void> _fetchXRPData({bool showLoadingIndicator = true}) async {
    if (showLoadingIndicator) {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });
    }

    try {
      // Create HTTP client with custom configuration
      final client = http.Client();

      // Try multiple endpoints as fallback
      final List<String> endpoints = [
        'https://api.mypapit.net/crypto/XRPMYR.json',
        'http://api.mypapit.net/crypto/XRPMYR.json', // HTTP fallback
      ];

      http.Response? response;
      Exception? lastException;

      for (String endpoint in endpoints) {
        try {
          response = await client.get(
            Uri.parse(endpoint),
            headers: {
              'Content-Type': 'application/json',
              'User-Agent': 'XRPTracker/1.0',
              'Accept': 'application/json',
              'Cache-Control': 'no-cache',
            },
          ).timeout(const Duration(seconds: 15));

          if (response.statusCode == 200) {
            break; // Success, exit loop
          }
        } catch (e) {
          lastException = e is Exception ? e : Exception(e.toString());
          print('Failed to fetch from $endpoint: $e');
          continue; // Try next endpoint
        }
      }

      client.close();

      if (response == null || response.statusCode != 200) {
        throw lastException ?? Exception('All endpoints failed');
      }

      final Map<String, dynamic> jsonData = json.decode(response.body);
      final newXrpData = XRPData.fromJson(jsonData);

      setState(() {
        xrpData = newXrpData;
        isLoading = false;
        errorMessage = null;
      });

      // Animate price update
      _priceController.forward(from: 0);

    } catch (e) {
      String errorMsg = e.toString();

      // Provide more user-friendly error messages
      if (errorMsg.contains('SocketException') || errorMsg.contains('host lookup')) {
        errorMsg = 'Network connection failed. Please check your internet connection.';
      } else if (errorMsg.contains('TimeoutException')) {
        errorMsg = 'Request timed out. Please try again.';
      } else if (errorMsg.contains('ClientException')) {
        errorMsg = 'Connection error. Please check your network settings.';
      } else {
        errorMsg = errorMsg.replaceAll('Exception: ', '');
      }

      setState(() {
        isLoading = false;
        errorMessage = errorMsg;
      });

      print('Error fetching XRP data: $e');
    }
  }

  Widget _buildMainContent() {
    if (isLoading && xrpData == null) {
      return LoadingCard(
        pulseAnimation: _pulseAnimation,
        accentColor: accentColor,
        loadingText: 'Loading XRP Data...',
      );
    }

    if (errorMessage != null && xrpData == null) {
      return ErrorCard(
        errorMessage: errorMessage,
        onRetry: () => _fetchXRPData(),
        accentColor: accentColor,
      );
    }

    return PriceCard(
      xrpData: xrpData,
      priceAnimation: _priceAnimation,
      accentColor: accentColor,
      currency: 'MYR',
    );
  }

  @override
  void dispose() {
    _autoRefreshTimer?.cancel();
    _pulseController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Text(
      //     'XRP Crypto Value in MYR',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: const Color(0xFF1E1E1E),
      //   elevation: 0,
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () => _fetchXRPData(),
      //       icon: const Icon(
      //         Icons.refresh,
      //         color: accentColor,
      //       ),
      //       tooltip: 'Refresh',
      //     ),
      //   ],
      // ),
      body: RefreshIndicator(
        onRefresh: () => _fetchXRPData(),
        color: accentColor,
        backgroundColor: const Color(0xFF1E1E1E),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 100), // Bottom padding for floating navbar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeSection(
                title: 'XRP Live Price',
                subtitle: 'Real-time cryptocurrency tracking',
                iconText: 'X',
                accentColor: accentColor,
              ),
              const SizedBox(height: 24),
              _buildMainContent(),
              const SizedBox(height: 20),
              MarketDetailsSection(
                xrpData: xrpData,
                accentColor: accentColor,
                currency: 'MYR',
                sectionTitle: 'Market Details',
              ),
              const SizedBox(height: 20),
              StatusSection(
                xrpData: xrpData,
                onRefresh: () => _fetchXRPData(),
                accentColor: accentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}