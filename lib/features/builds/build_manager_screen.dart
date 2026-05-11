import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/build.dart';
import '../../data/models/class.dart';
import '../../data/repositories/app_database.dart';

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
                final cls = WarClass.findById(b.isClassless ? 'Classless' : 'Class');
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: cls?.color ?? Colors.grey,
                      child: Text('?',
                          style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(b.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        '${cls?.displayName ?? 'Unknown'}${b.isClassless ? ' (Classless)' : ''}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, size: 20),
                          onPressed: () => context.push('/class'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, size: 20),
                          onPressed: () => _deleteBuild(context, b),
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(delay: (index * 100).ms);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/class'),
        child: const Icon(Icons.add),
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
