import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/ascension/affix.dart';
import '../../data/repository/ascension_repository.dart';

class MplusScreen extends ConsumerWidget {
  const MplusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAffixes = ref.watch(affixesProvider);
    final asyncWeekly = ref.watch(weeklyAffixesProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Mythic+ Affixes')),
      body: asyncAffixes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (affixes) {
          return asyncWeekly.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => _buildContent(context, theme, affixes, []),
            data: (weekly) =>
                _buildContent(context, theme, affixes, weekly),
          );
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme,
    List<Affix> affixes,
    List<dynamic> weekly,
  ) {
    final activeWeeklyIds =
        weekly.map((w) => w is Map ? w['affix_id']?.toString() : null).toSet();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Weekly rotation section (if data exists)
        if (activeWeeklyIds.isNotEmpty && activeWeeklyIds.first != null) ...[
          Text('Current Weekly Rotation',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...affixes
              .where((a) => activeWeeklyIds.contains(a.id))
              .map((a) => _AffixChip(affix: a)),
          const SizedBox(height: 24),
          Text('All Affixes',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
        ],
        // All affixes list
        ...affixes.map((affix) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: affix.iconUrl != null && affix.iconUrl!.isNotEmpty
                    ? Image.network(affix.iconUrl!,
                        width: 40, height: 40, fit: BoxFit.contain)
                    : const Icon(Icons.bolt, size: 32),
                title: Text(affix.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: affix.summary != null && affix.summary!.isNotEmpty
                    ? Text(affix.summary!, maxLines: 2)
                    : null,
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => context.push('/affixes/${affix.id}'),
              ),
            )),
      ],
    );
  }
}

class _AffixChip extends StatelessWidget {
  final Affix affix;
  const _AffixChip({required this.affix});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: theme.colorScheme.primary.withValues(alpha: 0.1),
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(Icons.star, color: theme.colorScheme.primary),
        title: Text(affix.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary)),
        subtitle: affix.summary != null ? Text(affix.summary!) : null,
      ),
    );
  }
}
