import 'package:flutter/material.dart';

class AppTheme {
  // Define your custom colors
  static const Color primaryBlack = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF121212);
  static const Color mediumGrey = Color(0xFF1E1E1E);
  static const Color lightGrey = Color(0xFF2D2D2D);
  static const Color primaryGreen = Color(0xFF00FF88);
  static const Color darkGreen = Color(0xFF00CC6A);
  static const Color lightGreen = Color(0xFF4DFFAA);
  static const Color whiteText = Color(0xFFFFFFFF);
  static const Color greyText = Color(0xFFB0B0B0);

  // Light theme (if you want to support both)
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.green,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: primaryBlack,
      elevation: 0,
    ),
  );

  // Dark theme (main theme)
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryGreen,
    scaffoldBackgroundColor: primaryBlack,

    // Color scheme
    colorScheme: const ColorScheme.dark(
      primary: primaryGreen,
      secondary: darkGreen,
      surface: darkGrey,
      background: primaryBlack,
      onPrimary: primaryBlack,
      onSecondary: whiteText,
      onSurface: whiteText,
      onBackground: whiteText,
    ),

    // App Bar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryBlack,
      foregroundColor: whiteText,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: whiteText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: primaryGreen),
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: mediumGrey,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: primaryGreen.withOpacity(0.2), width: 1),
      ),
    ),

    // Button Themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: primaryBlack,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryGreen,
        side: const BorderSide(color: primaryGreen, width: 2),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryGreen,
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    // Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryGreen,
      foregroundColor: primaryBlack,
      elevation: 6,
    ),

    // Bottom Navigation Bar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: mediumGrey,
      selectedItemColor: primaryGreen,
      unselectedItemColor: greyText,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // Text Themes
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: whiteText,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: whiteText,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: whiteText,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        color: whiteText,
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: whiteText,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: greyText,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        color: whiteText,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        color: whiteText,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        color: greyText,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        color: primaryGreen,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: mediumGrey,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: greyText.withOpacity(0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: greyText.withOpacity(0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryGreen, width: 2),
      ),
      labelStyle: const TextStyle(color: greyText),
      hintStyle: const TextStyle(color: greyText),
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: primaryGreen,
      size: 24,
    ),

    // Divider Theme
    dividerTheme: DividerThemeData(
      color: greyText.withOpacity(0.2),
      thickness: 1,
    ),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryGreen,
      linearTrackColor: mediumGrey,
      circularTrackColor: mediumGrey,
    ),
  );
}

// Custom widgets for consistent styling
class CryptoCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final VoidCallback? onTap;

  const CryptoCard({
    Key? key,
    required this.child,
    this.padding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );
  }
}

class PriceDisplay extends StatelessWidget {
  final String price;
  final String currency;
  final bool isPositive;

  const PriceDisplay({
    Key? key,
    required this.price,
    required this.currency,
    this.isPositive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$currency $price',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            color: isPositive ? AppTheme.primaryGreen : Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: (isPositive ? AppTheme.primaryGreen : Colors.red).withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isPositive ? AppTheme.primaryGreen : Colors.red,
              width: 1,
            ),
          ),
          child: Text(
            'Live Price',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isPositive ? AppTheme.primaryGreen : Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}