import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/build.dart';

class AppDatabase {
  static const _buildsKey = 'saved_builds';
  static SharedPreferences? _instance;

  static Future<void> init() async {
    _instance ??= await SharedPreferences.getInstance();
  }

  // Builds CRUD
  static List<Build> getBuilds() {
    final prefs = _instance;
    if (prefs == null) return [];
    final jsonStr = prefs.getString(_buildsKey);
    if (jsonStr == null) return [];
    try {
      final list = jsonDecode(jsonStr) as List;
      return list.map((j) => Build.fromJson(Map<String, dynamic>.from(j as Map))).toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveBuild(Build build) async {
    final prefs = await _ensurePrefs();
    final existing = prefs.getStringList(_buildsKey) ?? [];
    existing.removeWhere((b) {
      try { return Build.fromJson(Map<String, dynamic>.from(jsonDecode(b) as Map)).id == build.id; }
      catch (_) { return false; }
    });
    existing.add(jsonEncode(build.toJson()));
    await prefs.setStringList(_buildsKey, existing);
  }

  static Future<void> deleteBuild(String id) async {
    final prefs = await _ensurePrefs();
    final existing = prefs.getStringList(_buildsKey) ?? [];
    final updated = <String>[];
    for (final b in existing) {
      try {
        final build = Build.fromJson(Map<String, dynamic>.from(jsonDecode(b) as Map));
        if (build.id != id) updated.add(b);
      } catch (_) { /* skip corrupt entries */ }
    }
    await prefs.setStringList(_buildsKey, updated);
  }

  static Future<void> clearAll() async {
    final prefs = await _ensurePrefs();
    await prefs.clear();
  }

  static String exportAll(List<Build> builds) {
    return jsonEncode(builds.map((b) => b.toJson()).toList());
  }

  static Future<void> importAll(String jsonStr) async {
    try {
      final list = jsonDecode(jsonStr) as List;
      final prefs = await _ensurePrefs();
      final existing = prefs.getStringList(_buildsKey) ?? [];
      for (final item in list) {
        final build = Build.fromJson(Map<String, dynamic>.from(item as Map<dynamic, dynamic>));
        existing.removeWhere((b) {
          try { return Build.fromJson(Map<String, dynamic>.from(jsonDecode(b) as Map)).id == build.id; }
          catch (_) { return false; }
        });
        existing.add(jsonEncode(build.toJson()));
      }
      await prefs.setStringList(_buildsKey, existing);
    } catch (e) {
      throw FormatException('Invalid data: $e');
    }
  }

  static Future<SharedPreferences> _ensurePrefs() async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance!;
  }
}
