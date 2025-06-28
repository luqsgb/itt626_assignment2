import 'package:flutter/material.dart';
import '../widgets/about_widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Theme colors
  static const Color accentColor = Color(0xFF00FF88);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100), // Added bottom padding for navbar
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Title
            const Text(
              'About XRP Tracker',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Author Profile Card
            const ProfileCard(
              name: 'Muhamad Luqman Hakim Bin Muhamad Ali', // Replace with your actual name
              role: '2024938691',
              institution: 'UiTM Arau', // Replace with your institution
              profileImagePath: 'assets/img/Luqman_IMG.JPG',
              accentColor: accentColor,
            ),
            const SizedBox(height: 24),

            // App Purpose Section
            const InfoSection(
              title: 'App Purpose',
              titleIcon: Icons.info_outline,
              content: 'XRP Crypto Value Tracker is a real-time cryptocurrency monitoring application that fetches and displays the live value of XRP (Ripple) in Malaysian Ringgit (MYR). The app provides users with up-to-date market information, enabling them to track XRP price movements and make informed decisions about their cryptocurrency investments.',
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),

            // Features Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: accentColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Key Features',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const FeatureCard(
                  title: 'Real-time Price Updates',
                  description: 'Live XRP to MYR conversion with automatic refresh every 30 seconds',
                  icon: Icons.refresh,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 12),
                const FeatureCard(
                  title: 'Market Details',
                  description: 'Comprehensive market data including bid/ask prices and 24h volume',
                  icon: Icons.analytics,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 12),
                const FeatureCard(
                  title: 'Market Status',
                  description: 'Real-time market status indicator showing active/inactive states',
                  icon: Icons.circle,
                  accentColor: accentColor,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Technical Implementation Section
            const InfoSection(
              title: 'Technical Implementation',
              titleIcon: Icons.code,
              content: 'This application is built using Flutter framework and implements RESTful API consumption to fetch cryptocurrency data from api.mypapit.net. The app features a modern dark theme UI with animated transitions, error handling, and responsive design optimized for mobile devices.',
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),

            // Technology Stack Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.build,
                      color: accentColor,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Technology Stack',
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    TechStackChip(
                      label: 'Flutter',
                      icon: Icons.flutter_dash,
                      accentColor: accentColor,
                    ),
                    TechStackChip(
                      label: 'Dart',
                      icon: Icons.code,
                      accentColor: accentColor,
                    ),
                    TechStackChip(
                      label: 'HTTP',
                      icon: Icons.http,
                      accentColor: accentColor,
                    ),
                    TechStackChip(
                      label: 'JSON API',
                      icon: Icons.api,
                      accentColor: accentColor,
                    ),
                    TechStackChip(
                      label: 'Material Design',
                      icon: Icons.design_services,
                      accentColor: accentColor,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Data Source Section
            const InfoSection(
              title: 'Data Source',
              titleIcon: Icons.source,
              content: 'Cryptocurrency data is sourced from api.mypapit.net, providing reliable and up-to-date XRP to MYR exchange rates. The API delivers comprehensive market information including current prices, bid/ask spreads, trading volume, and market status.',
              accentColor: accentColor,
            ),
            const SizedBox(height: 20),

            // Version Info Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    accentColor.withOpacity(0.1),
                    Colors.transparent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: accentColor.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.info,
                    color: accentColor,
                    size: 24,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'XRP Crypto Value Tracker',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Version 1.0.0 • Built with Flutter',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Submission Date: 29 June 2025',
                    style: TextStyle(
                      color: accentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}