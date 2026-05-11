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
  final Set<String> _selectedEnchantIds = {};
  late final List<EnchantTier> _tiers = EnchantTier.values;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tiers.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int get _totalSelected => _selectedEnchantIds.length;

  List<MysticEnchant> _filteredEnchants(EnchantTier tier) {
    return sampleEnchants.where((e) {
      if (e.tier != tier) return false;
      if (_searchQuery.isEmpty) return true;
      final q = _searchQuery.toLowerCase();
      return e.name.toLowerCase().contains(q) ||
          e.description.toLowerCase().contains(q);
    }).toList()..sort((a, b) => a.name.compareTo(b.name));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mystic Enchants'),
        actions: [
          if (_totalSelected > 0)
            TextButton.icon(
              onPressed: () => _saveEnchantBuild(context),
              icon: const Icon(Icons.save),
              label: Text('Save ($_totalSelected)'),
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: EnchantTier.values.map((t) => Tab(
            text: '${t.displayName} (${sampleEnchants.where((e) => e.tier == t).length})'
          )).toList(),
          indicatorColor: EnchantTier.values[_tabController.index].color,
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(context),
          if (_totalSelected > 0) _buildSelectionSummary(context),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: EnchantTier.values.map((tier) {
                final enchants = _filteredEnchants(tier);
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: enchants.length,
                  itemBuilder: (context, i) {
                    final e = enchants[i];
                    final isSelected = _selectedEnchantIds.contains(e.id);
                    return SelectionCard(enchant: e, isSelected: isSelected, theme: theme,
                        onToggle: () {
                          setState(() {
                            if (isSelected) {
                              _selectedEnchantIds.remove(e.id);
                            } else {
                              _selectedEnchantIds.add(e.id);
                            }
                          });
                        },
                      );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search mystical enchants...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        ),
        onChanged: (v) => setState(() => _searchQuery = v),
      ),
    );
  }

  Widget _buildSelectionSummary(BuildContext context) {
    final selected = _selectedEnchantIds
        .map((id) => sampleEnchants.firstWhere((e) => e.id == id))
        .toList();
    final tierGroups = <EnchantTier, List<MysticEnchant>>{};
    for (final e in selected) {
      tierGroups.putIfAbsent(e.tier, () => []).add(e);
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
        border: Border(bottom: BorderSide(
            color: Theme.of(context).dividerColor.withValues(alpha: 0.3))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.star, size: 16),
              const SizedBox(width: 8),
              Text('$_totalSelected selected',
                  style: Theme.of(context).textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const Spacer(),
              TextButton.icon(
                onPressed: () => setState(() {
                  _selectedEnchantIds.clear();
                }),
                icon: const Icon(Icons.clear_all, size: 16),
                label: const Text('Clear'),
              ),
            ],
          ),
          for (final tier in EnchantTier.values)
            if (tierGroups.containsKey(tier))
              Text('${tierGroups[tier]!.map((e) => e.name).join(' • ')}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall
                      ?.copyWith(color: tier.color)),
        ],
      ),
    );
  }

  void _saveEnchantBuild(BuildContext context) {
    final build = Build(
      id: 'build_enchant_${DateTime.now().millisecondsSinceEpoch}',
      name: 'Enchant Build ($_totalSelected ME)',
      classId: 'warrior',
      specName: null,
      raceId: null,
      abilityIds: const [],
      talentIds: const [],
      enchantSlots: {
        for (final id in _selectedEnchantIds) 'me': id,
      },
      notes: 'Created in Mystic Enchant screen: $_totalSelected ME selected',
      createdAt: DateTime.now(),
    );
    AppDatabase.saveBuild(build);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Build saved with $_totalSelected mystic enchants!'),
    ));
  }
}

class SelectionCard extends StatelessWidget {
  final MysticEnchant enchant;
  final bool isSelected;
  final ThemeData theme;
  final VoidCallback onToggle;

  const SelectionCard({
    super.key, required this.enchant, required this.isSelected,
    required this.theme, required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final c = enchant.tier.color;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: isSelected ? c.withValues(alpha: 0.2) : null,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: c.withValues(alpha: 0.3),
          child: Icon(Icons.auto_awesome, color: c, size: 18),
        ),
        title: Text(enchant.name,
            style: TextStyle(fontWeight: FontWeight.bold, color: c)),
        subtitle: Text(enchant.description,
            maxLines: 3, overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall),
        trailing: Icon(isSelected ? Icons.check_circle : Icons.circle_outlined,
            color: isSelected ? c : theme.hintColor),
        onTap: onToggle,
      ),
    );
  }
}
