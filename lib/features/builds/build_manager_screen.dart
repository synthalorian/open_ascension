import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/build.dart';
import '../../data/models/class.dart';
import '../../data/repositories/app_database.dart';
import '../class_builder/class_builder_screen.dart';

class BuildManagerScreen extends ConsumerWidget {
  const BuildManagerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final builds = AppDatabase.getBuilds();

    return Scaffold(
      appBar: AppBar(title: const Text('My Builds')),
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
                      backgroundColor: cls?.color ?? Colors.grey,
                      child: Text(
                        (cls?.displayName ?? '?').substring(0, 1),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(b.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        '${cls?.displayName ?? 'Unknown'}$specText'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
