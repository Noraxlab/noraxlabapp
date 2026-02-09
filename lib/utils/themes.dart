import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF0B121E);
  static const Color secondary = Color(0xFF151D2C);
  static const Color accent = Color(0xFF00E5FF);
  static const Color neonBlue = Color(0xFF00D4FF);
  static const Color neonPurple = Color(0xFF9D4EDD);
  static const Color neonGreen = Color(0xFF38B000);
  static const Color neonRed = Color(0xFFFF005C);
  static const Color darkGray = Color(0xFF1A1A2E);
  static const Color lightGray = Color(0xFFE2E2E2);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color danger = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  
  static const List<Color> gradientCyber = [
    Color(0xFF00D4FF),
    Color(0xFF0099FF),
    Color(0xFF5D00FF),
  ];
}

final ThemeData cyberDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColors.accent),
    titleTextStyle: GoogleFonts.orbitron(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      color: AppColors.accent,
      letterSpacing: 1.5,
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    displayLarge: GoogleFonts.orbitron(
      fontSize: 48,
      fontWeight: FontWeight.w900,
      color: AppColors.accent,
      letterSpacing: 2,
    ),
    displayMedium: GoogleFonts.orbitron(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      letterSpacing: 1.5,
    ),
    displaySmall: GoogleFonts.orbitron(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      letterSpacing: 1,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.lightGray,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.lightGray,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColors.lightGray.withOpacity(0.7),
    ),
  ),
  cardTheme: CardTheme(
    color: AppColors.secondary,
    elevation: 8,
    shadowColor: AppColors.accent.withOpacity(0.3),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: BorderSide(
        color: AppColors.accent.withOpacity(0.1),
        width: 1,
      ),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.accent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      textStyle: GoogleFonts.orbitron(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
      elevation: 8,
      shadowColor: AppColors.accent.withOpacity(0.5),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondary.withOpacity(0.8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: AppColors.accent.withOpacity(0.3),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColors.accent,
        width: 2,
      ),
    ),
    labelStyle: GoogleFonts.poppins(
      color: AppColors.lightGray.withOpacity(0.7),
    ),
    hintStyle: GoogleFonts.poppins(
      color: AppColors.lightGray.withOpacity(0.5),
    ),
  ),
  iconTheme: const IconThemeData(
    color: AppColors.accent,
    size: 24,
  ),
  dividerTheme: const DividerThemeData(
    color: AppColors.secondary,
    thickness: 1,
    space: 20,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.accent,
    foregroundColor: Colors.white,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),
);

class AppTextStyles {
  static final cyberTitle = GoogleFonts.orbitron(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: AppColors.accent,
    letterSpacing: 2,
    shadows: [
      Shadow(
        color: AppColors.accent.withOpacity(0.5),
        blurRadius: 10,
        offset: const Offset(0, 0),
      ),
    ],
  );
  
  static final neonText = GoogleFonts.orbitron(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.accent,
    letterSpacing: 1.5,
    shadows: [
      Shadow(
        color: AppColors.accent.withOpacity(0.7),
        blurRadius: 15,
        offset: const Offset(0, 0),
      ),
    ],
  );
}
