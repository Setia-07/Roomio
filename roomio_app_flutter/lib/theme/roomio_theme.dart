import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens for the Roomio design system.
class RoomioColors {
  // Brand colors
  static const Color primary = Color(0xFFFF5A36); // Warm Coral
  static const Color primaryHover = Color(0xFFE54A28);
  static const Color primaryContainer = Color(0xFFFFF0EC);
  static const Color onPrimary = Colors.white;

  // Secondary & Accents
  static const Color navy = Color(0xFF141B2D); // Deep Midnight Navy
  static const Color navyLight = Color(0xFF1E2843);
  static const Color mint = Color(0xFF10B981); // Sage Mint (High compatibility)
  static const Color mintContainer = Color(0xFFE6F8F2);
  static const Color amber = Color(0xFFF59E0B); // Moderate compatibility
  static const Color amberContainer = Color(0xFFFEF3C7);
  static const Color rose = Color(0xFFEF4444); // Low compatibility / Error
  static const Color roseContainer = Color(0xFFFEE2E2);

  // Neutral surfaces (Light)
  static const Color backgroundLight = Color(0xFFF9FAFB);
  static const Color surfaceLight = Colors.white;
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color textPrimaryLight = Color(0xFF111827);
  static const Color textSecondaryLight = Color(0xFF6B7280);
  static const Color textMutedLight = Color(0xFF9CA3AF);

  // Neutral surfaces (Dark)
  static const Color backgroundDark = Color(0xFF0F141E);
  static const Color surfaceDark = Color(0xFF182030);
  static const Color borderDark = Color(0xFF28344D);
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFF9CA3AF);
  static const Color textMutedDark = Color(0xFF6B7280);
}

/// Shared typography using Google Fonts (Plus Jakarta Sans).
class RoomioTypography {
  static TextStyle get displayLarge => GoogleFonts.plusJakartaSans(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static TextStyle get displayMedium => GoogleFonts.plusJakartaSans(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
  );

  static TextStyle get titleLarge => GoogleFonts.plusJakartaSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleMedium => GoogleFonts.plusJakartaSans(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get bodyLarge => GoogleFonts.plusJakartaSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static TextStyle get bodyMedium => GoogleFonts.plusJakartaSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static TextStyle get labelBold => GoogleFonts.plusJakartaSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
  );

  static TextStyle get labelSmall => GoogleFonts.plusJakartaSans(
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );
}

/// Factory for Light and Dark ThemeData.
class RoomioTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: RoomioColors.primary,
      scaffoldBackgroundColor: RoomioColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: RoomioColors.primary,
        onPrimary: RoomioColors.onPrimary,
        primaryContainer: RoomioColors.primaryContainer,
        secondary: RoomioColors.navy,
        surface: RoomioColors.surfaceLight,
        error: RoomioColors.rose,
        outline: RoomioColors.borderLight,
      ),
      cardTheme: CardThemeData(
        color: RoomioColors.surfaceLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: RoomioColors.borderLight, width: 1),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: RoomioColors.surfaceLight,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        iconTheme: const IconThemeData(color: RoomioColors.navy),
        titleTextStyle: RoomioTypography.titleLarge.copyWith(
          color: RoomioColors.navy,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: RoomioColors.borderLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: RoomioColors.borderLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: RoomioColors.primary, width: 1.5),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: RoomioColors.primary,
      scaffoldBackgroundColor: RoomioColors.backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: RoomioColors.primary,
        onPrimary: RoomioColors.onPrimary,
        primaryContainer: Color(0xFF3E1F18),
        secondary: Color(0xFF8B9CB8),
        surface: RoomioColors.surfaceDark,
        error: RoomioColors.rose,
        outline: RoomioColors.borderDark,
      ),
      cardTheme: CardThemeData(
        color: RoomioColors.surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: RoomioColors.borderDark, width: 1),
        ),
      ),
    );
  }
}
