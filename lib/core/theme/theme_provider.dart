import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';

class ThemeProvider extends Notifier<AsyncValue<AppThemeMode>> {
  static const _key = 'theme_mode';

  @override
  AsyncValue<AppThemeMode> build() {
    return AsyncValue.data(AppThemeMode.neonGrid);
  }

  Future<void> loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final savedName = prefs.getString(_key);
    if (savedName != null) {
      final mode = AppThemeMode.fromName(savedName) ?? AppThemeMode.neonGrid;
      state = AsyncValue.data(mode);
    }
  }

  Future<void> setTheme(AppThemeMode mode) async {
    state = AsyncValue.data(mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
  }
}

final themeProvider = NotifierProvider<ThemeProvider, AsyncValue<AppThemeMode>>(
  ThemeProvider.new,
);
