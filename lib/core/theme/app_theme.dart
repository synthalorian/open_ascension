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

  const AppThemeMode._(this.displayName, this.description);
  final String displayName;
  final String description;

  static const all = <AppThemeMode>[
    dark, light, highContrast,
    neonGrid, midnightPulse, chromeSunset, vaporTrails,
    allianceTheme, hordeTheme, nightElfTheme, undeadTheme,
  ];

  static const _synthwaveThemes = [neonGrid, midnightPulse, chromeSunset, vaporTrails];
}

extension AppThemeModeX on AppThemeMode {
  bool get isDark => this != AppThemeMode.light;
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
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF7B68EE),
        secondary: Color(0xFF00CED1),
        surface: Color(0xFF1A1A2E),
        onSurface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF16213E),
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF16213E),
        elevation: 2,
      ),
    );
  }

  static ThemeData _light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF6344D4),
        secondary: Color(0xFF0099CC),
        surface: Colors.white,
        onSurface: Colors.black87,
      ),
      appBarTheme: const AppBarTheme(elevation: 1),
      cardTheme: CardThemeData(elevation: 1),
    );
  }

  static ThemeData _highContrast() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Colors.yellow,
        secondary: Colors.white,
        surface: Colors.black,
        onSurface: Colors.white,
      ),
      textTheme: TextTheme(
        bodyLarge: const TextStyle(fontSize: 18, color: Colors.white),
        bodyMedium: const TextStyle(fontSize: 16, color: Colors.white70),
        titleLarge: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.yellow),
        titleMedium: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.yellow),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      cardTheme: CardThemeData(color: const Color(0xFF111111), elevation: 4),
    );
  }

  static ThemeData _neonGrid() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF0080),
        secondary: Color(0xFF00FFFF),
        surface: Color(0xFF0A0A1A),
        onSurface: Color(0xFFFFAAFF),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0A0A1A),
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
      useMaterial3: true,
    );
  }

  static ThemeData _midnightPulse() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF9B59B6),
        secondary: Color(0xFF8E44AD),
        surface: Color(0xFF0D0221),
        onSurface: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF0D0221),
        titleTextStyle: const TextStyle(
          color: Color(0xFFBB66CC),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1A0A30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFF9B59B6), width: 0.5),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFFDDBBEE)),
        bodyMedium: TextStyle(color: Color(0xFFCCAAEE)),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData _chromeSunset() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFFF6B35),
        secondary: Color(0xFFFFD700),
        surface: Color(0xFF1C0F0A),
        onSurface: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1C0F0A),
        titleTextStyle: const TextStyle(
          color: Color(0xFFFFD700),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF2D1B0E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFFFF6B35), width: 0.5),
        ),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData _vaporTrails() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF00CED1),
        secondary: Color(0xFF4169E1),
        surface: Color(0xFF050A1F),
        onSurface: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF050A1F),
        titleTextStyle: const TextStyle(
          color: Color(0xFF00CED1),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF0A1530),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFF4169E1), width: 0.5),
        ),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData _alliance() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF0040AA),
        secondary: Color(0xFFFFD700),
        surface: Color(0xFFF5F0E0),
        onSurface: Colors.black87,
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0040AA)),
      cardTheme: CardThemeData(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xFFFFD700), width: 1),
        ),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData _horde() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF8B0000),
        secondary: Color(0xFF228B22),
        surface: Color(0xFF1A0A0A),
        onSurface: Color(0xFFDDCCBB),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF3A0A0A)),
      cardTheme: CardThemeData(
        color: const Color(0xFF2A1515),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: Color(0xFF8B0000), width: 1),
        ),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData _nightElf() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF6B8E23),
        secondary: Color(0xFF8A2BE2),
        surface: Color(0xFF0A1520),
        onSurface: Color(0xFFC8E0C0),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF0A2030)),
      cardTheme: CardThemeData(
        color: const Color(0xFF101A20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Color(0xFF6B8E23), width: 0.5),
        ),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData _undead() {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF3CB371),
        secondary: Color(0xFF696969),
        surface: Color(0xFF0A0A0A),
        onSurface: Color(0xFF404040),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF1A0A0A)),
      cardTheme: CardThemeData(
        color: const Color(0xFF151515),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Color(0xFF3CB371), width: 0.5),
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Color(0xFF707070)),
        bodyMedium: TextStyle(color: Color(0xFF606060)),
      ),
      useMaterial3: true,
    );
  }
}
