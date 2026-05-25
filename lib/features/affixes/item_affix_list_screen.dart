import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/ascension_repository.dart';
import '../../data/models/ascension/item_affix.dart';

class ItemAffixListScreen extends ConsumerWidget {
  const ItemAffixListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCategories = ref.watch(itemAffixesProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Item Affixes')),
      body: asyncCategories.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (categories) => ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: categories.length,
          itemBuilder: (context, i) => _CategoryCard(
            category: categories[i],
            theme: theme,
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatefulWidget {
  final ItemAffixCategory category;
  final ThemeData theme;
  const _CategoryCard({required this.category, required this.theme});

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final cat = widget.category;
    final theme = widget.theme;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cat.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.colorScheme.primary)),
                        const SizedBox(height: 2),
                        Text('${cat.affixCount} affixes',
                            style: TextStyle(color: theme.hintColor, fontSize: 12)),
                      ],
                    ),
                  ),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded)
            ...cat.affixes.map((affix) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: theme.dividerColor.withValues(alpha: 0.3)),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(affix.name,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  const Text('—  ', style: TextStyle(color: Colors.grey)),
                  Expanded(
                    child: Text(affix.stats,
                        style: TextStyle(color: theme.hintColor)),
                  ),
                ],
              ),
            )),
        ],
      ),
    );
  }
}