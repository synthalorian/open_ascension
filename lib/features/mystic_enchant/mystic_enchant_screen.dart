import 'package:flutter/material.dart';
import '../../data/models/mystic_enchant.dart';
import '../../data/models/build.dart';
import '../../data/repositories/app_database.dart';

class MysticEnchantScreen extends StatefulWidget {
  const MysticEnchantScreen({super.key});

  @override
  State<MysticEnchantScreen> createState() => _MysticEnchantScreenState();
}

class _MysticEnchantScreenState extends State<MysticEnchantScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';
  final Map<String, MysticEnchant> _selectedEnchants = {};
  final Map<String, int> _enchantPoints = {};

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: EnchantSlot.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int get _totalPoints => _enchantPoints.values.fold(0, (a, b) => a + b);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mystic Enchants'),
        actions: [
          if (_selectedEnchants.isNotEmpty)
            TextButton.icon(
              onPressed: () => _saveEnchantBuild(context),
              icon: const Icon(Icons.save),
              label: const Text('Save Build'),
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: EnchantSlot.values.map((s) => Tab(text: s.displayName)).toList(),
        ),
      ),
      body: Column(
        children: [
          _buildSelectionSummary(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search enchants...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => _searchQuery = v),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: EnchantSlot.values.map((slot) {
                final enchants = sampleEnchants
                    .where((e) => e.slot == slot)
                    .where((e) =>
                        _searchQuery.isEmpty ||
                        e.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                        e.description.toLowerCase().contains(_searchQuery.toLowerCase()))
                    .toList();

                final tiers = <EnchantTier, List<MysticEnchant>>{};
                for (final e in enchants) {
                  tiers.putIfAbsent(e.tier, () => []).add(e);
                }
                final tierKeys = tiers.keys.toList()
                  ..sort((a, b) => a.index.compareTo(b.index));

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    if (enchants.isEmpty)
                      const Center(child: Text('No enchants found for this slot')),
                    ...tierKeys.expand((tier) {
                      return [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 4),
                          child: Row(
                            children: [
                              Icon(Icons.star, color: tier.color, size: 16),
                              const SizedBox(width: 4),
                              Text('Tier ${tier.displayName}',
                                  style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: tier.color)),
                              const Spacer(),
                              Text('+${_getPointsForTier(tier)} pts',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                      color: tier.color)),
                            ],
                          ),
                        ),
                        ...tiers[tier]!.map((e) {
                          final isSelected = _selectedEnchants[e.slot.name]?.id == e.id;
                          return Card(
                            color: isSelected
                                ? tier.color.withValues(alpha: 0.3)
                                : null,
                            child: ListTile(
                              title: Text(e.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: tier.color)),
                              subtitle: Text(e.description),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      '${_getPointsForTier(e.tier)} pts',
                                      style: theme.textTheme.labelSmall?.copyWith(
                                          color: theme.hintColor)),
                                  const SizedBox(width: 8),
                                  Icon(
                                    isSelected
                                        ? Icons.check_circle
                                        : Icons.circle_outlined,
                                    color: isSelected ? tier.color : theme.hintColor,
                                  ),
                                ],
                              ),
                              onTap: () => setState(() {
                                if (isSelected) {
                                  _removeEnchant(e.slot.name);
                                } else {
                                  _selectedEnchants[e.slot.name] = e;
                                  _enchantPoints[e.slot.name] =
                                      _getPointsForTier(e.tier);
                                }
                              }),
                            ),
                        );
                        }),
                        const Divider(),
                      ];
                    }),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionSummary(BuildContext context) {
    final selectedEnchants = _selectedEnchants.values.toList();
    if (selectedEnchants.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        child: Row(
          children: [
            const Icon(Icons.star_outline, size: 18),
            const SizedBox(width: 8),
            Text('Tap enchants to select across slots',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.8),
        border: Border(
            bottom: BorderSide(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.3))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.inventory_2, size: 18),
              const SizedBox(width: 8),
              Text('Selected (${_selectedEnchants.length} enchant${_selectedEnchants.length == 1 ? '' : 's'}, $_totalPoints pts)',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold)),
              const Spacer(),
              if (_selectedEnchants.isNotEmpty)
                TextButton(
                  onPressed: () => setState(() {
                    _selectedEnchants.clear();
                    _enchantPoints.clear();
                  }),
                  child: const Text('Clear'),
                ),
            ],
          ),
          const SizedBox(height: 4),
          ..._selectedEnchants.entries.map((entry) {
            final slotName = entry.key;
            final enchant = entry.value;
            final tierColor = enchant.tier.color;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(slotName,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600)),
                  ),
                  Icon(Icons.star, color: tierColor, size: 14),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(enchant.name,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: tierColor, fontWeight: FontWeight.w500)),
                  ),
                  Text('${_getPointsForTier(enchant.tier)} pts',
                      style: Theme.of(context).textTheme.labelSmall),
                  IconButton(
                    icon: const Icon(Icons.close, size: 16),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => setState(() => _removeEnchant(slotName)),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  void _removeEnchant(String slotName) {
    _selectedEnchants.remove(slotName);
    _enchantPoints.remove(slotName);
  }

  void _saveEnchantBuild(BuildContext context) {
    final build = Build(
      id: 'build_enchant_${DateTime.now().millisecondsSinceEpoch}',
      name: 'Enchant Build (${_selectedEnchants.length} enchants)',
      classId: 'warrior',
      specName: null,
      raceId: null,
      abilityIds: const [],
      talentIds: const [],
      enchantSlots: {
        for (final entry in _selectedEnchants.entries)
          entry.key: entry.value.id,
      },
      notes: 'Created in Mystic Enchant screen: ${_selectedEnchants.length} enchants selected, $_totalPoints total points',
      createdAt: DateTime.now(),
    );
    AppDatabase.saveBuild(build);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Enchant build saved with ${_selectedEnchants.length} enchants!'),
    ));
  }

  int _getPointsForTier(EnchantTier tier) {
    switch (tier) {
      case EnchantTier.common:
        return 5;
      case EnchantTier.uncommon:
        return 10;
      case EnchantTier.rare:
        return 15;
      case EnchantTier.epic:
        return 20;
      case EnchantTier.legendary:
        return 30;
    }
  }
}
