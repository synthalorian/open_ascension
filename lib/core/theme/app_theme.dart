import 'package:flutter/material.dart';

class AppThemeMode {
  static const dark = AppThemeMode._('Dark', 'Clean dark theme');
  static const light = AppThemeMode._('Light', 'Clean light theme');
  static const highContrast = AppThemeMode._('High Contrast', 'Maximum readability');

  static const neonGrid = AppThemeMode._('Neon Grid', 'Synthwave neon on dark');
  static const midnightPulse = AppThemeMode._('Midnight Pulse', 'Deep purple synthwave');
  static const chromeSunset = AppThemeMode._('Chrome Sunset', 'Warm orange/pink tones');
  static const vaporTrails = AppThemeMode._('Vapor Trails', 'Cool blue/teal gradient');

  static const allianceTheme = AppThemeMode._('Alliance', 'Blue & gold');
  static const hordeTheme = AppThemeMode._('Horde', 'Red & green');
  static const nightElfTheme = AppThemeMode._('Night Elf', 'Mystical greens & purples');
  static const undeadTheme = AppThemeMode._('Undead', 'Dark with sickly green');

  const AppThemeMode._(this.displayName, this.description, {String? name}) : name = name ?? displayName;
  final String name;
  final String displayName;
  final String description;

  static AppThemeMode? fromName(String n) => all.where((m) => m.name == n).firstOrNull;

  static const all = <AppThemeMode>[
    dark, light, highContrast,
    neonGrid, midnightPulse, chromeSunset, vaporTrails,
    allianceTheme, hordeTheme, nightElfTheme, undeadTheme,
  ];

  static const _synthwaveThemes = [neonGrid, midnightPulse, chromeSunset, vaporTrails];
}

extension AppThemeModeX on AppThemeMode {
  bool get isDark => this != AppThemeMode.light && this != AppThemeMode.allianceTheme;
  bool get isSynthwave => AppThemeMode._synthwaveThemes.contains(this);
}

class AppTheme {
  static ThemeData getTheme(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.dark: return _dark();
      case AppThemeMode.light: return _light();
      case AppThemeMode.highContrast: return _highContrast();
      case AppThemeMode.neonGrid: return _neonGrid();
      case AppThemeMode.midnightPulse: return _midnightPulse();
      case AppThemeMode.chromeSunset: return _chromeSunset();
      case AppThemeMode.vaporTrails: return _vaporTrails();
      case AppThemeMode.allianceTheme: return _alliance();
      case AppThemeMode.hordeTheme: return _horde();
      case AppThemeMode.nightElfTheme: return _nightElf();
      case AppThemeMode.undeadTheme: return _undead();
      default: return _dark();
    }
  }

  static ThemeData _dark() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF7B68EE),
        onPrimary: Colors.white,
        secondary: Color(0xFF00CED1),
        onSecondary: Colors.black,
        surface: Color(0xFF1A1A2E),
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF12121A),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF16213E),
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E1E2E),
        elevation: 2,
      ),
      useMaterial3: false,
    );
  }

  static ThemeData _light() {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF6344D4),
        onPrimary: Colors.white,
        secondary: Color(0xFF0099CC),
        onSecondary: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: const Color(0xFFF5F5F8),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
      ),
      useMaterial3: false,
    );
  }

  static ThemeData _highContrast() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Colors.yellow,
        onPrimary: Colors.black,
        secondary: Colors.white,
        onSecondary: Colors.black,
        surface: Colors.black,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.black,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
        titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.yellow),
        titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.yellow),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black, foregroundColor: Colors.white),
      cardTheme: CardThemeData(color: const Color(0xFF111111), elevation: 4),
      useMaterial3: false,
    );
  }

  static ThemeData _neonGrid() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF0080),
        onPrimary: Colors.white,
        secondary: Color(0xFF00FFFF),
        onSecondary: Colors.black,
        surface: Color(0xFF0A0A1A),
        onSurface: Color(0xFFFFAAFF),
      ),
      scaffoldBackgroundColor: const Color(0xFF080812),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0A0A1A),
        foregroundColor: const Color(0xFF00FFFF),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFF0080),
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'monospace',
        ),
        iconTheme: const IconThemeData(color: Color(0xFF00FFFF)),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF121228),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFFF0080), width: 1),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFDDAACC)),
        bodyMedium: TextStyle(color: Color(0xFFAA99BB)),
      ),
      useMaterial3: false,
    );
  }

  static ThemeData _midnightPulse() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF9B59B6),
        onPrimary: Colors.white,
        secondary: Color(0xFF8E44AD),
        onSecondary: Colors.white,
        surface: Color(0xFF0D0221),
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF080115),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0D0221),
        foregroundColor: const Color(0xFFBB66CC),
        titleTextStyle: const TextStyle(
          color: Color(0xFFBB66CC),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1A0A30),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFF9B59B6), width: 0.5),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFDDBBEE)),
        bodyMedium: TextStyle(color: Color(0xFFCCAAEE)),
      ),
      useMaterial3: false,
    );
  }

  static ThemeData _chromeSunset() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF6B35),
        onPrimary: Colors.white,
        secondary: Color(0xFFFFD700),
        onSecondary: Colors.black,
        surface: Color(0xFF1C0F0A),
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF120A06),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1C0F0A),
        foregroundColor: const Color(0xFFFFD700),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFD700),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF2D1B0E),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFFFF6B35), width: 0.5),
        ),
      ),
      useMaterial3: false,
    );
  }

  static ThemeData _vaporTrails() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF00CED1),
        onPrimary: Colors.black,
        secondary: Color(0xFF4169E1),
        onSecondary: Colors.white,
        surface: Color(0xFF050A1F),
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF030614),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF050A1F),
        foregroundColor: const Color(0xFF00CED1),
        titleTextStyle: const TextStyle(
          color: Color(0xFF00CED1),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF0A1530),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFF4169E1), width: 0.5),
        ),
      ),
      useMaterial3: false,
    );
  }

  static ThemeData _alliance() {
    return ThemeData.light().copyWith(
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF0040AA),
        onPrimary: Colors.white,
        secondary: Color(0xFFFFD700),
        onSecondary: Colors.black,
        surface: Color(0xFFF5F0E0),
        onSurface: Colors.black87,
      ),
      scaffoldBackgroundColor: const Color(0xFFEBE5D5),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0040AA),
        foregroundColor: Color(0xFFFFD700),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFFFD700), width: 1),
        ),
      ),
      useMaterial3: false,
    );
  }

  static ThemeData _horde() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF8B0000),
        onPrimary: Colors.white,
        secondary: Color(0xFF228B22),
        onSecondary: Colors.white,
        surface: Color(0xFF1A0A0A),
        onSurface: Color(0xFFDDCCBB),
      ),
      scaffoldBackgroundColor: const Color(0xFF120606),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF3A0A0A),
        foregroundColor: Color(0xFF8B0000),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF2A1515),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: Color(0xFF8B0000), width: 1),
        ),
      ),
      useMaterial3: false,
    );
  }

  static ThemeData _nightElf() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF6B8E23),
        onPrimary: Colors.white,
        secondary: Color(0xFF8A2BE2),
        onSecondary: Colors.white,
        surface: Color(0xFF0A1520),
        onSurface: Color(0xFFC8E0C0),
      ),
      scaffoldBackgroundColor: const Color(0xFF060E15),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0A2030),
        foregroundColor: Color(0xFF6B8E23),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF101A20),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFF6B8E23), width: 0.5),
        ),
      ),
      useMaterial3: false,
    );
  }

  static ThemeData _undead() {
    return ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF3CB371),
        onPrimary: Colors.black,
        secondary: Color(0xFF696969),
        onSecondary: Colors.white,
        surface: Color(0xFF0A0A0A),
        onSurface: Color(0xFFC0C0C0),
      ),
      scaffoldBackgroundColor: const Color(0xFF050505),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1A0A0A),
        foregroundColor: Color(0xFF3CB371),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF151515),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Color(0xFF3CB371), width: 0.5),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFC0C0C0)),
        bodyMedium: TextStyle(color: Color(0xFFB0B0B0)),
      ),
      useMaterial3: false,
    );
  }
}
