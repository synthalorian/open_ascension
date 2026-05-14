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
  String? _selectedZone;
  final Set<String> _selectedEnchantIds = {};
  late final List<EnchantTier> _tiers = EnchantTier.values;

  // Collect all unique zones from legendary enchants
  late final List<String> _zones;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tiers.length, vsync: this);
    // Extract unique zones from sampleEnchants, sorted by count (most common first)
    final zoneCounts = <String, int>{};
    for (final e in sampleEnchants) {
      if (e.zone != null && e.zone!.isNotEmpty) {
        zoneCounts[e.zone!] = (zoneCounts[e.zone!] ?? 0) + 1;
      }
    }
    final zoneEntries = zoneCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    _zones = zoneEntries.map((e) => e.key).toList();
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
      if (_searchQuery.isNotEmpty) {
        final q = _searchQuery.toLowerCase();
        if (!e.name.toLowerCase().contains(q) &&
            !e.description.toLowerCase().contains(q) &&
            !(e.zone?.toLowerCase().contains(q) ?? false) &&
            !(e.locationDetails?.toLowerCase().contains(q) ?? false)) {
          return false;
        }
      }
      if (_selectedZone != null && e.zone != _selectedZone) return false;
      return true;
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
          _buildZoneFilterBar(context),
          if (_totalSelected > 0) _buildSelectionSummary(context),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: EnchantTier.values.map((tier) {
                final enchants = _filteredEnchants(tier);
                if (enchants.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 64, color: theme.colorScheme.primary),
                        const SizedBox(height: 16),
                        Text(
                          _searchQuery.isNotEmpty || _selectedZone != null
                            ? 'No enchants match your filters'
                            : 'No ${tier.displayName.toLowerCase()} enchants available',
                          style: theme.textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }
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
          hintText: 'Search by name, zone, or description...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
        ),
        onChanged: (v) => setState(() => _searchQuery = v),
      ),
    );
  }

  Widget _buildZoneFilterBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        children: [
          const Text('Zone:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(
            child: PopupMenuButton<String>(
              icon: Chip(
                label: Text(_selectedZone ?? 'All Zones', maxLines: 1, overflow: TextOverflow.ellipsis),
                avatar: Icon(_selectedZone == null ? Icons.public : Icons.place, size: 16),
                visualDensity: VisualDensity.compact,
              ),
              onSelected: (v) => setState(() => _selectedZone = v == 'All' ? null : v),
              itemBuilder: (ctx) => [
                const PopupMenuItem(value: 'All', child: Text('All Zones')),
                const PopupMenuDivider(),
                ..._zones.map((z) => PopupMenuItem<String>(value: z, child: Text(z))),
              ],
            ),
          ),
        ],
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
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: c.withValues(alpha: 0.3),
          child: Icon(Icons.auto_awesome, color: c, size: 18),
        ),
        title: Text(enchant.name,
            style: TextStyle(fontWeight: FontWeight.bold, color: c)),
        subtitle: Text(enchant.description,
            maxLines: 2, overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall),
        trailing: Icon(isSelected ? Icons.check_circle : Icons.circle_outlined,
            color: isSelected ? c : theme.hintColor),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (enchant.zone != null)
                  Row(
                    children: [
                      Icon(Icons.public, size: 16, color: theme.hintColor),
                      const SizedBox(width: 6),
                      Text('Zone: ${enchant.zone}',
                          style: theme.textTheme.bodySmall),
                    ],
                  ),
                if (enchant.locationDetails != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: theme.hintColor),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(enchant.locationDetails!,
                            style: theme.textTheme.bodySmall),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
