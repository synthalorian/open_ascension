import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/ascension_repository.dart';

class WeakauraDetailScreen extends ConsumerWidget {
  final String weakauraId;
  const WeakauraDetailScreen({super.key, required this.weakauraId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncWeakauras = ref.watch(weakaurasProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('WeakAura Details')),
      body: asyncWeakauras.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (weakauras) {
          final wa = weakauras.firstWhere(
            (w) => w.id == weakauraId,
            orElse: () => throw Exception('WeakAura not found'),
          );
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(wa.name ?? 'Unnamed WeakAura',
                    style: Theme.of(context).textTheme.headlineSmall),
                if (wa.author != null && wa.author!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text('by ${wa.author}',
                      style: TextStyle(color: Theme.of(context).hintColor)),
                ],
                if (wa.description != null && wa.description!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _section('Description', wa.description!),
                ],
                if (wa.code != null && wa.code!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _section('Import String', wa.code!),
                ],
                if (wa.version != null && wa.version!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('Version: ${wa.version}'),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _section(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SelectableText(content,
              style: const TextStyle(
                  fontFamily: 'monospace', fontSize: 12, height: 1.5)),
        ),
      ],
    );
  }
}
