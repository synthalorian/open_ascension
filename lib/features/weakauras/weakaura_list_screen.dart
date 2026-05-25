import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/repository/ascension_repository.dart';

class WeakauraListScreen extends ConsumerWidget {
  const WeakauraListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncWeakauras = ref.watch(weakaurasProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('WeakAuras')),
      body: asyncWeakauras.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (weakauras) {
          if (weakauras.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.extension_outlined,
                        size: 80, color: theme.hintColor),
                    const SizedBox(height: 16),
                    Text('No WeakAuras Submitted Yet',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Submit your WeakAuras on ascension.help!\n'
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
            itemCount: weakauras.length,
            itemBuilder: (context, i) {
              final wa = weakauras[i];
              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.extension, size: 32),
                  title: Text(wa.name ?? 'Unnamed WeakAura',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (wa.author != null && wa.author!.isNotEmpty)
                        Text('by ${wa.author}',
                            style: const TextStyle(fontSize: 12)),
                      if (wa.description != null &&
                          wa.description!.isNotEmpty)
                        Text(wa.description!,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => context.push('/weakauras/${wa.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
