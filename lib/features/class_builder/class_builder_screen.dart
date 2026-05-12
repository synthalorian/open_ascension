import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../data/models/class.dart';
import '../../data/models/ability.dart';
import '../../data/models/talent.dart';
import '../../data/models/mystic_enchant.dart';
import '../../data/models/build.dart';
import '../../data/models/race.dart';
import '../../data/models/stats.dart';
import '../../data/models/gear_item.dart';
import '../../data/models/gear_items.dart';
import '../../data/repositories/app_database.dart';

/// Null-safe card color helper.
Color _cardColor(ThemeData theme) => theme.cardTheme.color ?? theme.colorScheme.surface;

class ClassBuilderScreen extends ConsumerStatefulWidget {
  final Build? editBuild;

  const ClassBuilderScreen({super.key, this.editBuild});

  @override
  ConsumerState<ClassBuilderScreen> createState() => _ClassBuilderScreenState();
}

class _ClassBuilderScreenState extends ConsumerState<ClassBuilderScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final TextEditingController _buildNameController;
  late WarClass _selectedClass;
  late Race _selectedRace;
  late String _selectedSpec;
  final Set<String> _selectedAbilities = {};
  final Set<String> _selectedTalents = {};
  final Map<String, String?> _selectedEnchantSlots = {};
  bool _isEditing = false;
  int _pointsRemaining = 31;
  String _searchQuery = '';
  String? _enchantSlot;
  String? _gearSearch;
  GearRarity? _gearRarityFilter;
  final Map<GearSlot, GearItem?> _equippedGear = {};

  void _initDefaults() {
    _selectedClass = WarClass.findById('warrior');
    _selectedRace = Race.findById('orc');
    _selectedSpec = 'Arms';
    _enchantSlot = null; // Show all tiers by default
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _buildNameController = TextEditingController();

    if (widget.editBuild != null) {
      _isEditing = true;
      final b = widget.editBuild!;
      _selectedClass = WarClass.findById(b.classId);
      _selectedRace = b.raceId != null ? Race.findById(b.raceId!) : Race.findById('orc');
      _selectedSpec = b.specName ?? _selectedClass.specNames.first;
      _selectedAbilities.addAll(b.abilityIds);
      _selectedTalents.addAll(b.talentIds);
      _selectedEnchantSlots.addAll(b.enchantSlots);
      _buildNameController.text = b.name;
    } else {
      _initDefaults();
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _buildNameController.dispose();
    super.dispose();
  }

  Color get _specColor => _selectedClass.color;

  void _onClassChanged(WarClass? newClass) {
    if (newClass == null) return;
    setState(() {
      _selectedClass = newClass;
      _selectedSpec = newClass.specNames.first;
      _selectedAbilities.clear();
      _selectedTalents.clear();
      _pointsRemaining = 31;
      _searchQuery = '';
    });
  }

  void _onRaceChanged(Race? newRace) {
    if (newRace == null) return;
    setState(() => _selectedRace = newRace);
  }

  void _onSpecChanged(String spec) {
    setState(() {
      _selectedSpec = spec;
      _selectedTalents.clear();
      _pointsRemaining = 31;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Build' : 'Class Builder'),
        backgroundColor: _specColor.withValues(alpha: 0.1),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.flash_on), text: 'Abilities'),
            Tab(icon: Icon(Icons.account_tree), text: 'Talents'),
            Tab(icon: Icon(Icons.stars), text: 'Enchants'),
            Tab(icon: Icon(Icons.inventory_2), text: 'Gear'),
            Tab(icon: Icon(Icons.speed), text: 'Stats'),
          ],
          labelColor: _specColor,
        ),
      ),
      body: Column(
        children: [
          _buildNameField(theme),
          _buildSelectors(theme),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildAbilitiesTab(theme),
                _buildTalentsTab(theme),
                _buildEnchantsTab(theme),
                _buildGearTab(theme),
                _buildStatsTab(theme),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _saveBuild(widget.editBuild),
        label: Text(_isEditing ? 'Update Build' : 'Save Build'),
        icon: Icon(_isEditing ? Icons.check : Icons.save),
        backgroundColor: _specColor,
      ),
    );
  }

  Widget _buildNameField(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: theme.colorScheme.primary.withValues(alpha: 0.08),
      child: TextField(
        controller: _buildNameController,
        decoration: const InputDecoration(
          labelText: 'Build Name',
          border: OutlineInputBorder(),
        ),
        onChanged: (_) => setState(() {}),
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
                onChanged: _onClassChanged,
              ),
              const SizedBox(width: 16),
              const Text('Race: ', style: TextStyle(fontWeight: FontWeight.bold)),
              DropdownButton<Race>(
                value: _selectedRace,
                items: allRaces
                    .map((r) => DropdownMenuItem(value: r, child: Text(r.displayName)))
                    .toList(),
                onChanged: _onRaceChanged,
              ),
            ],
          ),
          if (_selectedClass.specNames.isNotEmpty) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Spec: ', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 4),
                ..._selectedClass.specNames.map((s) => Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(s),
                    selected: _selectedSpec == s,
                    onSelected: (selected) {
                      if (selected) _onSpecChanged(s);
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
        .where((a) => a.classId == _selectedClass.id)
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
          child: abilities.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.flash_off, size: 48, color: theme.hintColor),
                      const SizedBox(height: 12),
                      Text('No abilities found for ${_selectedClass.displayName}',
                          style: theme.textTheme.bodyLarge),
                    ],
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(12),
                  children: abilities.map((a) {
                    final selected = _selectedAbilities.contains(a.id);
                    return Card(
                      color: selected
                          ? _specColor.withValues(alpha: 0.3)
                          : _cardColor(theme),
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
        .where((t) => t.classId == _selectedClass.id && t.specName == _selectedSpec)
        .toList();

    if (talents.isEmpty) {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.account_tree_outlined, size: 64, color: theme.colorScheme.primary),
            const SizedBox(height: 16),
            Text('No talent data for ${_selectedClass.displayName} — ${_selectedSpec}',
                style: theme.textTheme.titleMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text('Switch to a class/spec with talent data above (e.g. Warrior Arms, Paladin Retribution, etc.)',
                style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
                textAlign: TextAlign.center),
          ],
        ),
      );
    }

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
                    color: selected ? _specColor : _cardColor(theme),
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
    final tiers = [EnchantTier.uncommon, EnchantTier.rare, EnchantTier.epic, EnchantTier.legendary];
    final enchants = sampleEnchants
        .where((e) => _enchantSlot == null || e.tier.name == _enchantSlot)
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              const Text('Rarity: ', style: TextStyle(fontWeight: FontWeight.bold)),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FilterChip(
                        label: const Text('All'),
                        selected: _enchantSlot == null,
                        onSelected: (_) => setState(() => _enchantSlot = null),
                      ),
                      const SizedBox(width: 8),
                      ...tiers.map((t) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          label: Text(t.displayName),
                          selected: _enchantSlot == t.name,
                          onSelected: (_) => setState(() => _enchantSlot = t.name),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildEnchantSummary(theme),
        Expanded(
          child: enchants.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.auto_awesome_outlined, size: 48, color: theme.hintColor),
                      const SizedBox(height: 12),
                      const Text('No enchants match this filter'),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: enchants.length,
                  itemBuilder: (context, i) {
                    final e = enchants[i];
                    final tierColor = _tierColor(e.tier);
                    final isSelected = _selectedEnchantSlots['me'] == e.id;
                    return Card(
                      color: isSelected
                          ? tierColor.withValues(alpha: 0.3)
                          : _cardColor(theme),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: tierColor.withValues(alpha: 0.3),
                          child: Icon(Icons.auto_awesome, color: tierColor, size: 18),
                        ),
                        title: Text(e.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: tierColor)),
                        subtitle: Text(e.description,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                        trailing: Icon(
                          isSelected ? Icons.check_circle : Icons.circle_outlined,
                          color: isSelected ? tierColor : theme.hintColor,
                        ),
                        onTap: () {
                          setState(() {
                            if (_selectedEnchantSlots['me'] == e.id) {
                              _selectedEnchantSlots['me'] = null;
                            } else {
                              _selectedEnchantSlots['me'] = e.id;
                            }
                          });
                        },
                      ),
                    ).animate().fadeIn(duration: 200.ms);
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildEnchantSummary(ThemeData theme) {
    final selectedId = _selectedEnchantSlots['me'];
    if (selectedId == null) return const SizedBox.shrink();

    try {
      final enchant = sampleEnchants.firstWhere((en) => en.id == selectedId);
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: theme.colorScheme.surface.withValues(alpha: 0.8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Selected Enchant:',
                style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold, color: _specColor)),
            Row(
              children: [
                Icon(Icons.star, color: _tierColor(enchant.tier), size: 14),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(enchant.name,
                      style: theme.textTheme.bodySmall?.copyWith(
                          color: _tierColor(enchant.tier),
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            Text(enchant.description,
                style: theme.textTheme.labelSmall, maxLines: 3),
          ],
        ),
      );
    } catch (_) {
      return const SizedBox.shrink();
    }
  }

  Widget _buildGearTab(ThemeData theme) {
    return Column(
      children: [
        // Equipped gear summary
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
            border: Border(bottom: BorderSide(color: theme.dividerColor)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Equipped Gear',
                  style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: GearSlot.values.map((slot) {
                  final item = _equippedGear[slot];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: GestureDetector(
                      onTap: item != null
                          ? () => setState(() => _equippedGear[slot] = null)
                          : null,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: item != null
                              ? item.rarity.color.withValues(alpha: 0.2)
                              : theme.colorScheme.surface.withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                              color: item != null
                                  ? item.rarity.color
                                  : theme.dividerColor.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          item != null
                              ? '${slot.displayName}: ${item.name}'
                              : slot.displayName,
                          style: theme.textTheme.labelSmall?.copyWith(
                              color: item != null
                                  ? item.rarity.color
                                  : theme.hintColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        // Search and filter
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search gear...',
                    prefixIcon: Icon(Icons.search, size: 22),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                  ),
                  onChanged: (v) => setState(() => _gearSearch = v.isEmpty ? null : v),
                ),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<GearRarity?>(
                icon: const Icon(Icons.filter_list),
                onSelected: (v) => setState(() => _gearRarityFilter = v),
                itemBuilder: (ctx) => [
                  const PopupMenuItem(value: null, child: Text('All Rarities')),
                  ...GearRarity.values.map((r) => PopupMenuItem(
                      value: r,
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: r.color, size: 12),
                          const SizedBox(width: 8),
                          Text(r.displayName),
                        ],
                      ),
                    )),
                ],
              ),
            ],
          ),
        ),
        // Gear list
        Expanded(
          child: _filteredGear.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inventory_2_outlined, size: 48, color: theme.hintColor),
                      const SizedBox(height: 12),
                      const Text('No gear found'),
                    ],
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: _filteredGear.map((item) {
                    final equipped = _equippedGear[item.slot] == item;
                    return Card(
                      margin: const EdgeInsets.only(bottom: 6),
                      child: ListTile(
                        leading: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: item.rarity.color.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Icon(Icons.inventory_2_outlined,
                              color: item.rarity.color, size: 18),
                        ),
                        title: Text(item.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: item.rarity.color)),
                        subtitle: Text(
                            '${item.slot.displayName} • iLvl ${item.itemLevel}'
                            '${item.source != null ? ' • ${item.source}' : ''}',
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                        trailing: Icon(
                          equipped ? Icons.check_circle : Icons.add_circle_outline,
                          color: equipped ? item.rarity.color : theme.hintColor,
                        ),
                        onTap: () {
                          setState(() {
                            if (equipped) {
                              _equippedGear[item.slot] = null;
                            } else {
                              _equippedGear[item.slot] = item;
                            }
                          });
                        },
                      ),
                    ).animate().fadeIn(duration: 150.ms);
                  }).toList(),
                ),
        ),
      ],
    );
  }

  List<GearItem> get _filteredGear {
    var items = sampleGearItems;
    if (_gearSearch != null) {
      final q = _gearSearch!.toLowerCase();
      final matchedIds = items
          .where((g) =>
              g.name.toLowerCase().contains(q) ||
              (g.source?.toLowerCase().contains(q) ?? false))
          .map((g) => g.id)
          .toSet();
      items = items.where((g) => matchedIds.contains(g.id)).toList();
    }
    if (_gearRarityFilter != null) {
      items = items.where((g) => g.rarity == _gearRarityFilter).toList();
    }
    items.sort((a, b) => b.itemLevel.compareTo(a.itemLevel));
    return items;
  }

  Widget _buildStatsTab(ThemeData theme) {
    final gearArmor = _equippedGear.values.fold(0, (sum, g) {
      if (g == null) return sum;
      return sum + ((g.stats['armor'] as num?) ?? 0).toInt();
    });
    final gearBonusAP = _equippedGear.values.fold(0, (sum, g) {
      if (g == null) return sum;
      return sum + ((g.stats['attackPower'] as num?) ?? 0).toInt();
    });
    final gearBonusSpellPower = _equippedGear.values.fold(0, (sum, g) {
      if (g == null) return sum;
      return sum + ((g.stats['spellPower'] as num?) ?? 0).toInt();
    });
    int gearBonusCrit = 0, gearBonusHaste = 0, gearBonusResilience = 0;
    for (final g in _equippedGear.values) {
      if (g == null) continue;
      gearBonusCrit += ((g.stats['crit'] as num?) ?? 0).toInt();
      gearBonusHaste += ((g.stats['haste'] as num?) ?? 0).toInt();
      gearBonusResilience += ((g.stats['resilience'] as num?) ?? 0).toInt();
    }

    final classStats = defaultClassStats[_selectedClass.id] ?? const PrimaryStats();
    final secondary = computeSecondaryStats(
      primary: classStats,
      classId: _selectedClass.id,
      raceId: _selectedRace.id,
      gearArmor: gearArmor,
      gearBonusAP: gearBonusAP,
      gearBonusSpellPower: gearBonusSpellPower,
      gearBonusCrit: gearBonusCrit,
      gearBonusHaste: gearBonusHaste,
      gearBonusResilience: gearBonusResilience,
    );

    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        if (_equippedGear.values.any((g) => g != null))
          _buildGearStatsSummary(theme),
        _buildStatHeader('PRIMARY STATS', theme),
        _buildStatRow('Strength', classStats.strength.toString(), 'Determines Attack Power and Parry.', theme),
        _buildStatRow('Agility', classStats.agility.toString(), 'Increases Armor, Dodge, and Ranged Attack Power.', theme),
        _buildStatRow('Stamina', classStats.stamina.toString(), 'Increases maximum health.', theme),
        _buildStatRow('Intellect', classStats.intellect.toString(), 'Increases maximum mana and Spell Power.', theme),
        _buildStatRow('Spirit', classStats.spirit.toString(), 'Increases mana regeneration.', theme),
        const SizedBox(height: 8),
        _buildStatHeader('SURVIVAL', theme),
        _buildStatRow('Health', '${secondary.health}', '${secondary.health} maximum HP.', theme),
        _buildStatRow('Health Regen', '', 'Automatic HP recovery (based on Spirit & race).', theme),
        _buildStatRow('Armor', secondary.armor.toString(), 'Reduces physical damage taken.', theme),
        _buildStatRow('Dodge', '${secondary.dodgePercent}%', 'Chance to dodge melee attacks.', theme),
        _buildStatRow('Parry', secondary.parryPercent > 0 ? '${secondary.parryPercent}%' : 'N/A', 'Chance to parry (melee classes only).', theme),
        _buildStatRow('Block', secondary.blockPercent > 0 ? '${secondary.blockPercent}% (${secondary.blockValue} BV)' : 'N/A', 'Chance to block (shield classes only).', theme),
        const SizedBox(height: 8),
        _buildStatHeader('OFFENSIVE', theme),
        _buildStatRow('Attack Power', secondary.attackPower.toString(), 'Increases melee and ranged damage.', theme),
        _buildStatRow('Spell Power', secondary.spellPower.toString(), 'Increases spell damage.', theme),
        _buildStatRow('Healing Power', secondary.healingPower.toString(), 'Increases healing done.', theme),
        _buildStatRow('Critical Strike', secondary.critPercent > 0 ? '${secondary.critPercent}%': '5%', 'Chance for bonus damage or heals.', theme),
        _buildStatRow('Hit Rating', secondary.hitPercent > 0 ? '${secondary.hitPercent}%': '8%', 'Chance for attacks to hit (8% to cap vs same level).', theme),
        _buildStatRow('Haste', secondary.hastePercent > 0 ? '${secondary.hastePercent}%' : '0%', 'Increases attack and cast speed.', theme),
        _buildStatRow('Expertise', secondary.expertise > 0 ? '${secondary.expertise}' : '0', 'Reduces chance enemies dodge your melee attacks.', theme),
        const SizedBox(height: 8),
        _buildStatHeader('DEFENSIVE / PVP', theme),
        _buildStatRow('Resilience', secondary.resilience > 0 ? secondary.resilience.toString() : '0', 'Reduces critical damage taken from players.', theme),
        _buildStatRow('PVP Power', secondary.pvpPower > 0 ? secondary.pvpPower.toString() : '0', 'Increases damage and healing done to players.', theme),
        const SizedBox(height: 8),
        _buildStatHeader('REGENERATION', theme),
        _buildStatRow('Mana / 5s', secondary.manaPer5 > 0 ? secondary.manaPer5.toString() : '0', 'Mana regenerated every 5 seconds.', theme),
        const SizedBox(height: 8),
        _buildStatHeader('RACIAL BONUSES', theme),
        _buildRaceRacialsWidget(theme),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildGearStatsSummary(ThemeData theme) {
    final gearItems = _equippedGear.values.where((g) => g != null).toList();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: _specColor.withValues(alpha: 0.3), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.inventory_2, size: 18),
              const SizedBox(width: 12),
              Text('${gearItems.length} gear piece${gearItems.length != 1 ? 's' : ''} equipped',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: gearItems.map((g) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(g!.name,
                      style: TextStyle(
                          color: g.rarity.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 13)),
                  Text(g.slot.displayName,
                      style: theme.textTheme.labelSmall
                          ?.copyWith(color: theme.hintColor)),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildRaceRacialsWidget(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _selectedRace.racialAbilities.map((r) => Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 4),
        child: Text('• $r', style: theme.textTheme.bodyMedium),
      )).toList(),
    );
  }

  Widget _buildStatHeader(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title,
          style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: _specColor)),
    );
  }

  Widget _buildStatRow(String name, String value, String description, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(name,
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(value.isEmpty ? '—' : value,
                textAlign: TextAlign.right,
                style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: value.isNotEmpty ? _specColor : theme.hintColor)),
          ),
        ],
      ),
    );
  }

  Color _tierColor(EnchantTier tier) {
    switch (tier) {
      case EnchantTier.uncommon: return const Color(0xFF1EFF00);
      case EnchantTier.rare: return Colors.blue;
      case EnchantTier.epic: return Colors.purple;
      case EnchantTier.legendary: return const Color(0xFFFF8000);
    }
  }

  void _saveBuild([Build? existing]) {
    final build = Build(
      id: existing?.id ?? 'build_${DateTime.now().millisecondsSinceEpoch}',
      name: _buildNameController.text.isNotEmpty
          ? _buildNameController.text
          : '${_selectedClass.displayName} $_selectedSpec',
      classId: _selectedClass.id,
      specName: _selectedSpec,
      raceId: _selectedRace.id,
      abilityIds: _selectedAbilities.toList(),
      talentIds: _selectedTalents.toList(),
      enchantSlots: Map.fromEntries(
        _selectedEnchantSlots.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      ),
      isClassless: false,
      createdAt: existing?.createdAt ?? DateTime.now(),
      notes: existing?.notes,
    );
    AppDatabase.saveBuild(build);
    if (!mounted) return;
    if (_isEditing) {
      Navigator.of(context).pop();
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(existing != null ? 'Build updated!' : 'Build saved!')),
    );
  }
}
