import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/lore_entry.dart';

class LoreEntryScreen extends ConsumerWidget {
  final String entryId;

  const LoreEntryScreen({super.key, required this.entryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final entry = sampleLoreEntries.where((e) => e.id == entryId).firstOrNull;

    if (entry == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Lore Entry')),
        body: const Center(child: Text('Entry not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(entry.category.displayName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _categoryIcon(entry.category),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(entry.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ).animate().fadeIn(duration: 400.ms),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(entry.summary,
                    style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500)),
              ),
            ).animate().fadeIn(delay: 200.ms),
            const SizedBox(height: 16),
            Text(entry.content,
                style: theme.textTheme.bodyMedium,
                textAlign: TextAlign.justify,
                textDirection: TextDirection.ltr,
            ).animate().fadeIn(delay: 300.ms),
            if (entry.relatedIds.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text('Related Entries',
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              ...entry.relatedIds.map((id) {
                final related = sampleLoreEntries
                    .where((e) => e.id == id).firstOrNull;
                if (related == null) return const SizedBox.shrink();
                return Card(
                  child: ListTile(
                    leading: _categoryIcon(related.category),
                    title: Text(related.title),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => context.push('/lore/$id'),
                  ),
                ).animate().fadeIn(duration: 300.ms);
              }),
            ],
          ],
        ),
      ),
    );
  }

  Widget _categoryIcon(LoreCategory category) {
    switch (category) {
      case LoreCategory.timeline:
        return const Icon(Icons.timeline, color: Colors.amber);
      case LoreCategory.characters:
        return const Icon(Icons.person, color: Colors.blue);
      case LoreCategory.factions:
        return const Icon(Icons.groups, color: Colors.red);
      case LoreCategory.locations:
        return const Icon(Icons.map, color: Colors.green);
      case LoreCategory.ascension:
        return const Icon(Icons.auto_awesome, color: Colors.purple);
      case LoreCategory.items:
        return const Icon(Icons.inventory_2, color: Colors.orange);
    }
  }
}
