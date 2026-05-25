import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/ascension_repository.dart';

class ItemAffixSuggestionsScreen extends ConsumerWidget {
  const ItemAffixSuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(itemAffixSuggestionsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Item Affix Suggestions')),
      body: asyncItems.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (items) {
          if (items.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.inventory_2_outlined,
                        size: 80, color: theme.hintColor),
                    const SizedBox(height: 16),
                    Text('No Item Affix Suggestions Yet',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Suggest new item affixes on ascension.help!\n'
                      'Click the button below to contribute.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.hintColor, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: () {
                        // Open website for submissions
                      },
                      icon: const Icon(Icons.open_in_new),
                      label: const Text('Submit on Ascension.help'),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final item = items[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(item.name ?? 'Unnamed'),
                  subtitle: item.category != null
                      ? Text('Category: ${item.category}')
                      : null,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
