import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/build.dart';
import '../../data/models/class.dart';
import '../../data/repositories/app_database.dart';
import '../../core/utils/build_codes.dart';
import '../class_builder/class_builder_screen.dart';

class BuildManagerScreen extends ConsumerWidget {
  const BuildManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final builds = AppDatabase.getBuilds();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Builds'),
        actions: [
          IconButton(
            icon: const Icon(Icons.qr_code_2),
            tooltip: 'Export All as Code',
            onPressed: () => _exportAllBuilds(context, builds),
          ),
          IconButton(
            icon: const Icon(Icons.download_for_offline),
            tooltip: 'Import from Code',
            onPressed: () => _importBuildsFromCode(context),
          ),
        ],
      ),
      body: builds.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.folder_open, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No saved builds yet',
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  SizedBox(height: 8),
                  Text('Create a build from the Class Builder',
                      style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: builds.length,
              itemBuilder: (context, index) {
                final b = builds[index];
                final cls = WarClass.findById(b.classId);
                final specText = b.specName != null ? ' / ${b.specName}' : '';
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cls.color,
                      child: Text(
                        cls.displayName.substring(0, 1),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(b.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        '${cls.displayName}$specText'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share, size: 20),
                          tooltip: 'Share build code',
                          onPressed: () => _shareBuild(context, b),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, size: 20),
                          onPressed: () => _editBuild(context, b),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, size: 20),
                          onPressed: () => _deleteBuild(context, b),
                        ),
                      ],
                    ),
                    onTap: () => _editBuild(context, b),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ClassBuilderScreen(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _shareBuild(BuildContext context, Build build) {
    final code = encodeBuild(build);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Share Build Code'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Share this code to export your build:',
                style: Theme.of(ctx).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(ctx).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(
                code,
                style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                      fontSize: 11,
                    ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: code));
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Code copied to clipboard!')),
              );
            },
            child: const Text('Copy'),
          ),
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
        ],
      ),
    );
  }

  void _exportAllBuilds(BuildContext context, List<Build> builds) {
    if (builds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No builds to export')),
      );
      return;
    }
    final code = encodeBuilds(builds);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Export ${builds.length} Builds'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Copy this code to backup or share all ${builds.length} builds:',
                style: Theme.of(ctx).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              constraints: const BoxConstraints(maxHeight: 200),
              decoration: BoxDecoration(
                color: Theme.of(ctx).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: SelectableText(
                  code,
                  style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                        fontFamily: 'monospace',
                        fontSize: 11,
                      ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: code));
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${builds.length} builds exported to clipboard!')),
              );
            },
            child: const Text('Copy'),
          ),
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
        ],
      ),
    );
  }

  void _importBuildsFromCode(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Import from Code'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Paste a build code to import:'),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Paste code here...',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final code = controller.text.trim();
              if (code.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please paste a code')),
                );
                return;
              }
              try {
                // Try multi-build first, fall back to single
                List<Build> imported = [];
                try {
                  imported = decodeBuilds(code);
                } catch (_) {
                  imported = [decodeBuild(code)];
                }

                int added = 0;
                int conflicts = 0;
                final existing = AppDatabase.getBuilds();
                final existingIds = existing.map((b) => b.id).toSet();

                for (final build in imported) {
                  if (existingIds.contains(build.id)) {
                    // Conflict: rename and add
                    final now = DateTime.now();
                    final existingBuild = AppDatabase.getBuilds().firstWhere(
                      (b) => b.id == build.id,
                    );
                    final renamed = existingBuild.copyWith(
                      name: '${existingBuild.name} (imported)',
                      id: 'build_${now.millisecondsSinceEpoch}_$added',
                    );
                    AppDatabase.saveBuild(renamed);
                    conflicts++;
                  } else {
                    AppDatabase.saveBuild(build);
                  }
                  added++;
                }

                Navigator.pop(ctx);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: conflicts > 0
                          ? Text('$added builds imported ($conflicts had conflicts, renamed)')
                          : Text('$added builds imported successfully'),
                    ),
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

  void _editBuild(BuildContext context, Build build) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ClassBuilderScreen(editBuild: build),
      ),
    );
  }

  void _deleteBuild(BuildContext context, Build build) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Build?'),
        content: Text('Delete "${build.name}"? This cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              AppDatabase.deleteBuild(build.id);
              Navigator.pop(ctx);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Build deleted')),
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
