import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/repository/ascension_repository.dart';

class AffixListScreen extends ConsumerWidget {
  const AffixListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAffixes = ref.watch(affixesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Mythic+ Affixes')),
      body: asyncAffixes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (affixes) {
          if (affixes.isEmpty) {
            return const Center(
              child: Text('No affixes available yet.',
                  style: TextStyle(color: Colors.grey)),
            );
          }
          return ListView.builder(
            itemCount: affixes.length,
            itemBuilder: (context, i) {
              final affix = affixes[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: affix.iconUrl != null && affix.iconUrl!.isNotEmpty
                      ? Image.network(affix.iconUrl!, width: 48, height: 48, fit: BoxFit.contain)
                      : const Icon(Icons.bolt, size: 32),
                  title: Text(affix.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: affix.summary != null && affix.summary!.isNotEmpty
                      ? Text(affix.summary!)
                      : null,
                  onTap: () => context.push('/affixes/${affix.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
