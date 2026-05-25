import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/ascension_repository.dart';

class AffixDetailScreen extends ConsumerWidget {
  final String affixId;
  const AffixDetailScreen({super.key, required this.affixId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAffixes = ref.watch(affixesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Affix Details')),
      body: asyncAffixes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (affixes) {
          final affix = affixes.firstWhere(
            (a) => a.id == affixId,
            orElse: () => throw Exception('Affix not found'),
          );
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (affix.iconUrl != null && affix.iconUrl!.isNotEmpty)
                  Center(
                    child: Image.network(affix.iconUrl!,
                        width: 80, height: 80, fit: BoxFit.contain),
                  ),
                const SizedBox(height: 16),
                Text(affix.name,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 12),
                if (affix.summary != null && affix.summary!.isNotEmpty)
                  _section('Summary', affix.summary!),
                if (affix.description != null && affix.description!.isNotEmpty)
                  _section('Description', affix.description!),
                if (affix.ascensionNotes != null && affix.ascensionNotes!.isNotEmpty)
                  _section('Ascension Notes', affix.ascensionNotes!),
                if (affix.tips != null && affix.tips!.isNotEmpty)
                  _section('Tips', affix.tips!),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _section(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(height: 1.5)),
        ],
      ),
    );
  }
}
