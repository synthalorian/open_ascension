import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/theme_provider.dart';
import '../../data/repositories/app_database.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeState = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          // Theme selector
          ExpansionTile(
            leading: const Icon(Icons.palette),
            title: const Text('Theme'),
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: themeState.when(
                  data: (mode) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 80,
                    ),
                    itemCount: AppThemeMode.all.length,
                    itemBuilder: (ctx, index) {
                      final t = AppThemeMode.all[index];
                      final isActive = t == mode;
                      final colors = AppTheme.getTheme(t);
                      return Card(
                        color: colors.colorScheme.surface,
                        child: InkWell(
                          onTap: () => ref.read(themeProvider.notifier).setTheme(t),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: colors.colorScheme.primary,
                                child: Icon(
                                  isActive ? Icons.check : Icons.circle,
                                  color: colors.colorScheme.onSurface,
                                  size: isActive ? 24 : 12,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(t.displayName,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                      color: isActive ? colors.colorScheme.primary : theme.colorScheme.onSurface)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, st) => const Center(child: Text('Error loading theme')),
                ),
              ),
            ],
          ),
          const Divider(),
          // Data management
          ExpansionTile(
            leading: const Icon(Icons.storage),
            title: const Text('Data Management'),
            children: [
              ListTile(
                leading: const Icon(Icons.download),
                title: const Text('Export Data'),
                onTap: () async {
                  final messenger = ScaffoldMessenger.of(context);
                  final builds = AppDatabase.getBuilds();
                  final json = AppDatabase.exportAll(builds);
                  final tempDir = Directory.systemTemp.path;
                  final path = '$tempDir/open_ascension_backup.json';
                  await File(path).writeAsString(json);
                  messenger.showSnackBar(
                    SnackBar(content: Text('Exported to: $path')),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.upload),
                title: const Text('Import Data'),
                onTap: () async {
                  final jsonStr = await _pickJsonFile(context);
                  if (jsonStr == null) return;
                  try {
                    await AppDatabase.importAll(jsonStr);
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Import successful')),
                    );
                  } catch (e) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Import failed: $e')),
                    );
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_forever, color: Colors.red),
                title: const Text('Clear All Data',
                    style: TextStyle(color: Colors.red)),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Clear All Data?'),
                      content: const Text('This will delete all saved builds. This cannot be undone.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Cancel'),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(backgroundColor: Colors.red),
                          onPressed: () {
                            AppDatabase.clearAll();
                            Navigator.pop(ctx);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('All data cleared')),
                            );
                          },
                          child: const Text('Clear'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          const Divider(),
          // About
          ExpansionTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Open Ascension',
                        style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold, color: theme.colorScheme.primary)),
                    const SizedBox(height: 8),
                    const Text('v0.1.0'),
                    const SizedBox(height: 16),
                    const Text('A companion app for Project Ascension WoW server.'),
                    const SizedBox(height: 8),
                    const Text('Features:'),
                    ...['Class Builder with Talents', 'Mystic Enchants',
                         'Build Manager', 'Warcraft Lore', 'Theme System']
                        .map((f) => Padding(
                              padding: const EdgeInsets.only(left: 16, top: 4),
                              child: Text('• $f'),
                            )),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<String?> _pickJsonFile(BuildContext context) async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['json'],
  );
  if (result == null) return null;
  return File(result.files.single.path!).readAsString();
}
