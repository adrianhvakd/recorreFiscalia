import 'package:flutter/material.dart';

abstract final class AppColors {
  static const forest = Color(0xFF123D35);
  static const green = Color(0xFF17634F);
  static const gold = Color(0xFFE6BA68);
  static const cream = Color(0xFFF6F3EB);
  static const ink = Color(0xFF16382F);
  static const muted = Color(0xFF52645C);
  static const line = Color(0xFFD9E1D8);
  static const error = Color(0xFF993D36);
}

ThemeData buildAppTheme() => ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto',
  scaffoldBackgroundColor: AppColors.cream,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.green,
    primary: AppColors.green,
    surface: AppColors.cream,
    error: AppColors.error,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 22, height: 1.35, color: AppColors.ink),
    bodyLarge: TextStyle(fontSize: 26, height: 1.4, color: AppColors.ink),
    titleLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: AppColors.ink,
    ),
    headlineMedium: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.w800,
      color: AppColors.ink,
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      minimumSize: const Size(0, 72),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(0, 64),
      textStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 21,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  ),
);
