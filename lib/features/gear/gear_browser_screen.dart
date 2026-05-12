import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../data/models/gear_item.dart';
import '../../data/models/gear_items.dart';

class GearBrowserScreen extends StatefulWidget {
  const GearBrowserScreen({super.key});

  @override
  State<GearBrowserScreen> createState() => _GearBrowserScreenState();
}

class _GearBrowserScreenState extends State<GearBrowserScreen> {
  String _searchQuery = '';
  GearSlot? _filterSlot;
  GearRarity? _filterRarity;
  String? _filterSource;
  GearType? _filterType;
  ArmorType? _filterArmorType;
  WeaponType? _filterWeaponType;

  List<GearItem> get _filtered {
    var items = List<GearItem>.from(sampleGearItems);
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      items = items
          .where((i) =>
              i.name.toLowerCase().contains(q) ||
              (i.source?.toLowerCase().contains(q) ?? false) ||
              i.slot.name.contains(q))
          .toList();
    }
    if (_filterSlot != null) items = items.where((i) => i.slot == _filterSlot).toList();
    if (_filterRarity != null)
      items = items.where((i) => i.rarity == _filterRarity).toList();
    if (_filterSource != null)
      items = items.where((i) => i.source == _filterSource).toList();
    if (_filterType != null)
      items = items.where((i) => i.type == _filterType).toList();
    if (_filterArmorType != null)
      items = items.where((i) => i.armorType == _filterArmorType).toList();
    if (_filterWeaponType != null)
      items = items.where((i) => i.weaponType == _filterWeaponType).toList();
    items.sort((a, b) => b.itemLevel.compareTo(a.itemLevel));
    return items;
  }


  bool get _hasActiveFilters =>
      _filterSlot != null ||
      _filterRarity != null ||
      _filterSource != null ||
      _filterType != null ||
      _filterArmorType != null ||
      _filterWeaponType != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gear Database (${_filtered.length})'),
        actions: [
          if (_hasActiveFilters)
            TextButton.icon(
              onPressed: () => setState(() {
                _filterSlot = null;
                _filterRarity = null;
                _filterSource = null;
                _filterType = null;
                _filterArmorType = null;
                _filterWeaponType = null;
              }),
              icon: const Icon(Icons.clear_all, size: 18),
              label: const Text('Clear'),
            ),
        ],
      ),
      body: Column(
        children: [
          // Search
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search gear by name, source, or slot...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
              onChanged: (v) => setState(() => _searchQuery = v),
            ),
          ),
          // Filter chips row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                _filterChip<GearSlot>(
                  label: _filterSlot?.displayName ?? 'All Slots',
                  value: _filterSlot,
                  items: GearSlot.values,
                  onChanged: (slot) => setState(() => _filterSlot = slot),
                  labelBuilder: (s) => s.displayName,
                ),
                const SizedBox(width: 4),
                _filterChip<GearRarity>(
                  label: _filterRarity?.displayName ?? 'All Tiers',
                  value: _filterRarity,
                  items: GearRarity.values,
                  onChanged: (r) => setState(() => _filterRarity = r),
                  labelBuilder: (r) => r.displayName,
                ),
                const SizedBox(width: 4),
                _filterChip<GearType>(
                  label: _filterType?.name.toUpperCase() ?? 'Both',
                  value: _filterType,
                  items: GearType.values,
                  onChanged: (t) => setState(() => _filterType = t),
                  labelBuilder: (t) => t == GearType.armor ? 'Armor' : 'Weapons',
                ),
                if (_filterType == null || _filterType == GearType.armor) ...[
                  const SizedBox(width: 4),
                  _filterChip<ArmorType>(
                    label: _filterArmorType?.name.toUpperCase() ?? 'All Armor',
                    value: _filterArmorType,
                    items: ArmorType.values,
                    onChanged: (a) => setState(() => _filterArmorType = a),
                    labelBuilder: (a) => a.name[0].toUpperCase() + a.name.substring(1),
                  ),
                ],
                if (_filterType == null || _filterType == GearType.weapon) ...[
                  const SizedBox(width: 4),
                  _filterChip<WeaponType>(
                    label: _filterWeaponType?.displayName ?? 'All Weapons',
                    value: _filterWeaponType,
                    items: WeaponType.values,
                    onChanged: (w) => setState(() => _filterWeaponType = w),
                    labelBuilder: (w) => w.displayName,
                  ),
                ],
                const SizedBox(width: 4),
                const SizedBox(width: 4),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.location_city, size: 20),
                  tooltip: 'Filter by source',
                  onSelected: (src) => setState(() => _filterSource = _filterSource == src ? null : src),
                  itemBuilder: (ctx) {
                    const sources = [
                      'Naxxramas', 'Ulduar', 'Trial of the Crusader',
                      'Icecrown Citadel', 'Heroic Dungeon',
                      'PvP Arena', 'Blacksmithing', 'Engineering',
                      'Emblem of Frost', 'Ashen Verdict Exalted',
                      'Kirin Tor Exalted', 'Wyrmrest Accord Exalted',
                      'Argent Crusade Exalted',
                      'Sons of Hodir Revered', 'The Wyrmrest Accord Revered',
                      'Legendary Quest',
                    ];
                    return [
                      const PopupMenuItem<String>(
                        value: '',
                        child: Text('All Sources'),
                      ),
                      ...sources.map((s) => PopupMenuItem<String>(
                            value: s,
                            child: Row(
                              children: [
                                if (_filterSource == s)
                                  const Icon(Icons.check, size: 16)
                                else
                                  const SizedBox(width: 16),
                                const SizedBox(width: 8),
                                Text(s),
                              ],
                            ),
                          )),
                    ];
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      _filterSource ?? 'Source',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // List
          Expanded(
            child: _filtered.isEmpty
                ? SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.inventory_2_outlined, size: 64, color: Theme.of(context).colorScheme.primary),
                          const SizedBox(height: 16),
                          Text('No gear matches your filters',
                              style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(height: 8),
                          Text('Try adjusting your search or filters',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).hintColor)),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) {
                      final item = _filtered[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ExpansionTile(
                          leading: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: item.rarity.color.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(_slotIcon(item.slot),
                                color: item.rarity.color, size: 20),
                          ),
                          title: Text(
                            item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: item.rarity.color,
                              fontSize: 14,
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 2,
                              children: [
                                Text('${item.rarity.displayName}  •  iLvl ${item.itemLevel}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(color: Theme.of(context).hintColor)),
                                if (item.armorType != null)
                                  Text(item.armorType!.name,
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                          color: Theme.of(context).hintColor)),
                                if (item.weaponType != null)
                                  Text(item.weaponType!.displayName,
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                          color: Theme.of(context).hintColor)),
                              ],
                            ),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Slot: ${item.slot.displayName}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500, fontSize: 12)),
                                  if (item.source != null)
                                    Text('Source: ${item.source}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500, fontSize: 12)),
                                  const SizedBox(height: 6),
                                  Text('Item Level: ${item.itemLevel}  |  Req Level: ${item.requiredLevel}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(fontWeight: FontWeight.w600)),
                                  const SizedBox(height: 4),
                                  // Stats
                                  ...item.stats.entries.map((e) {
                                    final statLabel = _statLabel(e.key);
                                    final statValue = _displayStatValue(e.key, e.value);
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8, top: 1),
                                      child: Text('+$statValue $statLabel',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: (index % 10 * 30).milliseconds);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _filterChip<T>({
    required String label,
    required T? value,
    required List<T> items,
    required void Function(T?) onChanged,
    required String Function(T) labelBuilder,
  }) {
    return PopupMenuButton<T>(
      icon: Chip(
        label: Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
      ),
      onSelected: (selected) => onChanged(selected),
      itemBuilder: (ctx) => [
        PopupMenuItem<T>(
          value: null,
          child: const Text('All'),
        ),
        ...items.map((item) => PopupMenuItem<T>(
              value: item,
              child: Text(labelBuilder(item)),
            )),
      ],
    );
  }

  IconData _slotIcon(GearSlot slot) {
    switch (slot) {
      case GearSlot.head:
        return Icons.person_outline;
      case GearSlot.neck:
        return Icons.circle_outlined;
      case GearSlot.shoulder:
        return Icons.layers_outlined;
      case GearSlot.chest:
        return Icons.shield_outlined;
      case GearSlot.wrist:
        return Icons.watch_outlined;
      case GearSlot.hands:
        return Icons.pan_tool_outlined;
      case GearSlot.waist:
        return Icons.line_weight;
      case GearSlot.legs:
        return Icons.sports_martial_arts;
      case GearSlot.feet:
        return Icons.change_circle;
      case GearSlot.mainHand:
      case GearSlot.offHand:
      case GearSlot.twoHand:
        return Icons.gavel;
      case GearSlot.ranged:
        return Icons.arrow_forward;
      case GearSlot.relic:
        return Icons.auto_awesome;
      case GearSlot.wrist1:
      case GearSlot.wrist2:
        return Icons.diamond_outlined;
    }
  }

  String _statLabel(String key) {
    const map = {
      'strength': 'Strength',
      'agility': 'Agility',
      'stamina': 'Stamina',
      'intellect': 'Intellect',
      'spirit': 'Spirit',
      'attackPower': 'Attack Power',
      'spellPower': 'Spell Power',
      'armor': 'Armor',
      'crit': 'Crit',
      'haste': 'Haste',
      'hit': 'Hit Rating',
      'dodge': 'Dodge',
      'parry': 'Parry',
      'block': 'Block',
      'blockValue': 'Block Value',
      'resilience': 'Resilience',
      'expertise': 'Expertise',
      'health': 'Health',
      'healing': 'Healing Power',
      'healingPower': 'Healing Power',
    };
    return map[key] ?? key;
  }

  String _displayStatValue(String key, dynamic value) {
    if (value is num && value < 1 && (key == 'crit' || key == 'haste' || key == 'dodge' || key == 'parry' || key == 'hit' || key == 'block')) {
      return '${(value * 100).toInt()}%';
    }
    return value.toString();
  }
}
