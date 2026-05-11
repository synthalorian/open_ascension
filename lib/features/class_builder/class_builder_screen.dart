import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../data/models/class.dart';
import '../../data/models/ability.dart';
import '../../data/models/talent.dart';
import '../../data/models/mystic_enchant.dart';
import '../../data/models/build.dart';
import '../../data/models/race.dart';
import '../../data/repositories/app_database.dart';

class ClassBuilderScreen extends ConsumerStatefulWidget {
  const ClassBuilderScreen({super.key});

  @override
  ConsumerState<ClassBuilderScreen> createState() => _ClassBuilderScreenState();
}

class _ClassBuilderScreenState extends ConsumerState<ClassBuilderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  WarClass? _selectedClass;
  Race? _selectedRace;
  String? _selectedSpec;
  final Set<String> _selectedAbilities = {};
  final Set<String> _selectedTalents = {};
  final Set<String> _selectedEnchants = {};
  int _pointsRemaining = 31;
  String _searchQuery = '';
  String? _enchantSlot;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _selectedClass = WarClass.findById('warrior');
    _selectedRace = Race.findById('orc');
    _selectedSpec = 'Arms';
    _enchantSlot = 'weapon';
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Color get _specColor => _selectedClass?.color ?? Colors.grey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Class Builder'),
        backgroundColor: _specColor.withValues(alpha: 0.1),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.flash_on), text: 'Abilities'),
            Tab(icon: Icon(Icons.account_tree), text: 'Talents'),
            Tab(icon: Icon(Icons.stars), text: 'Enchants'),
            Tab(icon: Icon(Icons.speed), text: 'Stats'),
          ],
          labelColor: _specColor,
        ),
      ),
      body: Column(
        children: [
          _buildSelectors(theme),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAbilitiesTab(theme),
                _buildTalentsTab(theme),
                _buildEnchantsTab(theme),
                _buildStatsTab(theme),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveBuild,
        label: const Text('Save Build'),
        icon: const Icon(Icons.save),
        backgroundColor: _specColor,
      ),
    );
  }

  Widget _buildSelectors(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: theme.colorScheme.surface,
      child: Column(
        children: [
          Row(
            children: [
              const Text('Class: ', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton<WarClass>(
                value: _selectedClass,
                items: WarClass.all
                    .map((c) => DropdownMenuItem(value: c, child: Text(c.displayName)))
                    .toList(),
                onChanged: (c) {
                  setState(() {
                    _selectedClass = c;
                    _selectedSpec = c?.specNames.first;
                    _selectedAbilities.clear();
                    _selectedTalents.clear();
                    _pointsRemaining = 31;
                  });
                },
              ),
              const SizedBox(width: 16),
              const Text('Race: ', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton<Race>(
                value: _selectedRace,
                items: allRaces
                    .map((r) => DropdownMenuItem(value: r, child: Text(r.displayName)))
                    .toList(),
                onChanged: (r) => setState(() => _selectedRace = r),
              ),
            ],
          ),
          if (_selectedClass != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Spec: ', style: TextStyle(fontWeight: FontWeight.bold)),
                ..._selectedClass!.specNames.map((s) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(s),
                    selected: _selectedSpec == s,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          _selectedSpec = s;
                          _selectedTalents.clear();
                          _pointsRemaining = 31;
                        });
                      }
                    },
                  ),
                )),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAbilitiesTab(ThemeData theme) {
    final abilities = sampleAbilities
        .where((a) => a.classId == _selectedClass?.id)
        
        .where((a) => _searchQuery.isEmpty ||
            a.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search abilities...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (v) => setState(() => _searchQuery = v),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: abilities.map((a) {
              final selected = _selectedAbilities.contains(a.id);
              return Card(
                color: selected
                    ? _specColor.withValues(alpha: 0.3)
                    : theme.cardTheme.color,
                child: ListTile(
                  title: Text(a.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(a.school.name),
                  trailing: Checkbox(
                    value: selected,
                    onChanged: (_) {
                      setState(() {
                        selected
                            ? _selectedAbilities.remove(a.id)
                            : _selectedAbilities.add(a.id);
                      });
                    },
                  ),
                ),
              ).animate().fadeIn(duration: 200.ms);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTalentsTab(ThemeData theme) {
    final talents = sampleTalents
        .where((t) => t.classId == _selectedClass?.id && t.specName == _selectedSpec)
        .toList();

    final tiers = <int, List<Talent>>{};
    for (final t in talents) {
      tiers.putIfAbsent(t.tier, () => []).add(t);
    }
    final tierKeys = tiers.keys.toList()..sort();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Points: '),
              Text('$_pointsRemaining / 31',
                  style: theme.textTheme.titleMedium?.copyWith(
                      color: _pointsRemaining <= 5 ? Colors.red
                          : theme.colorScheme.primary,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: tierKeys.expand((tier) {
              final tierTalents = tiers[tier]!
                  .toList()..sort((a, b) => a.column.compareTo(b.column));
              return [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Text('Tier $tier',
                      style: theme.textTheme.titleSmall?.copyWith(
                          color: _specColor, fontWeight: FontWeight.bold)),
                ),
                ...tierTalents.map((t) {
                  final selected = _selectedTalents.contains(t.id);
                  return Card(
                    color: selected ? _specColor : theme.cardTheme.color,
                    child: ListTile(
                      title: Text(t.name,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(t.description),
                      trailing: Checkbox(
                        value: selected,
                        onChanged: selected || _pointsRemaining > 0
                            ? (_) {
                                setState(() {
                                  if (selected) {
                                    _selectedTalents.remove(t.id);
                                    _pointsRemaining++;
                                  } else {
                                    _selectedTalents.add(t.id);
                                    _pointsRemaining--;
                                  }
                                });
                              }
                            : null,
                      ),
                    ),
                  );
                }),
                const Divider(),
              ];
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildEnchantsTab(ThemeData theme) {
    final slots = EnchantSlot.values;
    final enchants = sampleEnchants
        .where((e) => _enchantSlot == null || e.slot.name == _enchantSlot)
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              const Text('Slot: ', style: TextStyle(fontWeight: FontWeight.bold)),
              ...slots.map((s) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(s.displayName),
                  selected: _enchantSlot == s.name,
                  onSelected: (_) => setState(() => _enchantSlot = s.name),
                ),
              )),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: enchants.map((e) {
              final selected = _selectedEnchants.contains(e.id);
              final tierColor = _tierColor(e.tier);
              return Card(
                color: selected
                    ? tierColor.withValues(alpha: 0.3)
                    : theme.cardTheme.color,
                child: ListTile(
                  title: Text(e.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('${e.description} | ${e.slot.displayName}'),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: tierColor, size: 16),
                      Checkbox(
                        value: selected,
                        onChanged: (_) {
                          setState(() {
                            selected
                                ? _selectedEnchants.remove(e.id)
                                : _selectedEnchants.add(e.id);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(duration: 200.ms);
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsTab(ThemeData theme) {
    return const Center(
      child: Text('Stats tab coming soon...',
          style: TextStyle(color: Colors.grey)),
    );
  }

  Color _tierColor(EnchantTier tier) {
    switch (tier) {
      case EnchantTier.common: return Colors.grey;
      case EnchantTier.uncommon: return const Color(0xFF1EFF00);
      case EnchantTier.rare: return Colors.blue;
      case EnchantTier.epic: return Colors.purple;
      case EnchantTier.legendary: return const Color(0xFFFF8000);
    }
  }

  void _saveBuild() {
    if (_selectedClass == null) return;
    final build = Build(
      id: 'build_${DateTime.now().millisecondsSinceEpoch}',
      name: '${_selectedClass!.displayName} $_selectedSpec',

      raceId: _selectedRace?.id,

      abilityIds: _selectedAbilities.toList(),
      talentIds: _selectedTalents.toList(),
      enchantSlots: Map.fromEntries(_selectedEnchants.map((e) => MapEntry('weapon', e))),
      isClassless: false,
      createdAt: DateTime.now(),
      notes: null,
    );
    AppDatabase.saveBuild(build);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Build saved!')),
    );
  }
}
