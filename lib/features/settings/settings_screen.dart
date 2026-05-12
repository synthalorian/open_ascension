import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_theme.dart';
import '../../core/theme/theme_provider.dart';
import '../../data/repositories/app_database.dart';
import '../../data/models/build.dart';
import '../../core/utils/build_codes.dart';

/// Export/import using short codes (clipboard-based, works on web & mobile)
/// For native: use FilePicker to save/load JSON files to disk.
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
                          onTap: () {
                            ref.read(themeProvider.notifier).setTheme(t);
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Theme: ${t.displayName}'), duration: const Duration(seconds: 1)),
                            );
                          },
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
                title: const Text('Export All Builds'),
                onTap: () async {
                  final builds = AppDatabase.getBuilds();
                  if (builds.isEmpty) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No builds to export')),
                    );
                    return;
                  }
                  final code = encodeBuilds(builds);
                  await Clipboard.setData(ClipboardData(text: code));
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('${builds.length} builds exported to clipboard'),
                  ));
                },
              ),
              ListTile(
                leading: const Icon(Icons.upload),
                title: const Text('Import Builds from Code'),
                onTap: () => _importFromCode(context),
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
                    const Text('v0.2.0'),
                    const SizedBox(height: 16),
                    const Text('The ultimate Project Ascension WoW companion app.'),
                    const SizedBox(height: 8),
                    const Text('Features:'),
                    ...['Class Builder with Abilities & Talents', 'Mystic Enchants (141 real)',
                         'Build Manager with Share Codes', 'Gear Database (200 items)', 'Warcraft Lore',
                         'Theme System', 'Realm Browser', 'Stats with WotLK Formulas']
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

  void _importFromCode(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Import Builds'),
        content: TextField(
          controller: controller,
          maxLines: 5,
          decoration: const InputDecoration(
            hintText: 'Paste build code here...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final code = controller.text.trim();
              if (code.isEmpty) return;
              try {
                List<Build> imported;
                try {
                  imported = decodeBuilds(code);
                } catch (_) {
                  imported = [decodeBuild(code)];
                }
                for (final build in imported) {
                  AppDatabase.saveBuild(build);
                }
                Navigator.pop(ctx);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${imported.length} builds imported')),
                  );
                }
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Invalid code: $e')),
                );
              }
            },
            child: const Text('Import'),
          ),
        ],
      ),
    );
  }
}
