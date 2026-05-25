import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import '../../data/models/ascension/zone_map_data.dart';
import 'package:flutter_animate/flutter_animate.dart';

final zoneMapProvider = FutureProvider.autoDispose<ZoneMapData>((ref) async {
  final jsonStr = await rootBundle.loadString('assets/data/zone_map.json');
  final data = json.decode(jsonStr) as Map<String, dynamic>;
  return ZoneMapData.fromJson(data);
});

class ZoneMapScreen extends ConsumerWidget {
  const ZoneMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(zoneMapProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enchant Zones'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Zone Map'),
                content: const Text(
                  'Browse all 65 zones where mystic enchants can be found.\n\n'
                  'Zones are grouped by continent. Tap any zone to see '
                  'which enchants are available there.',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx),
                    child: const Text('Got it'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: asyncData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (data) => _ZoneMapContent(data: data, theme: theme),
      ),
    );
  }
}

class _ZoneMapContent extends StatefulWidget {
  final ZoneMapData data;
  final ThemeData theme;

  const _ZoneMapContent({required this.data, required this.theme});

  @override
  State<_ZoneMapContent> createState() => _ZoneMapContentState();
}

class _ZoneMapContentState extends State<_ZoneMapContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.theme.colorScheme.primary.withValues(alpha: 0.15),
                Colors.transparent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: widget.theme.colorScheme.primary,
            unselectedLabelColor: widget.theme.hintColor,
            indicatorColor: widget.theme.colorScheme.primary,
            tabs: [
              Tab(
                child: Row(
                  children: [
                    Icon(Icons.landscape, size: 16),
                    const SizedBox(width: 6),
                    const Text('Eastern Kingdoms'),
                    const SizedBox(width: 4),
                    Text('${widget.data.easternKingdoms.length}',
                        style: TextStyle(
                            fontSize: 11, color: widget.theme.hintColor)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Icon(Icons.nature, size: 16),
                    const SizedBox(width: 6),
                    const Text('Kalimdor'),
                    const SizedBox(width: 4),
                    Text('${widget.data.kalimdor.length}',
                        style: TextStyle(
                            fontSize: 11, color: widget.theme.hintColor)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Icon(Icons.whatshot, size: 16),
                    const SizedBox(width: 6),
                    const Text('Outlands'),
                    const SizedBox(width: 4),
                    Text('${widget.data.outlands.length}',
                        style: TextStyle(
                            fontSize: 11, color: widget.theme.hintColor)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Icon(Icons.castle, size: 16),
                    const SizedBox(width: 6),
                    const Text('Dungeons'),
                    const SizedBox(width: 4),
                    Text('${widget.data.other.length}',
                        style: TextStyle(
                            fontSize: 11, color: widget.theme.hintColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _ZoneGrid(zones: widget.data.easternKingdoms, theme: widget.theme),
              _ZoneGrid(zones: widget.data.kalimdor, theme: widget.theme),
              _ZoneGrid(zones: widget.data.outlands, theme: widget.theme),
              _ZoneGrid(zones: widget.data.other, theme: widget.theme),
            ],
          ),
        ),
      ],
    );
  }
}

class _ZoneGrid extends StatelessWidget {
  final List<ZoneContinent> zones;
  final ThemeData theme;

  const _ZoneGrid({required this.zones, required this.theme});

  Color _getZoneColor(int count, int maxCount) {
    final intensity = maxCount > 0 ? count / maxCount : 0.0;
    if (intensity > 0.7) return const Color(0xFFFF6B6B);
    if (intensity > 0.4) return const Color(0xFFFFD93D);
    if (intensity > 0.15) return const Color(0xFF6BCB77);
    return const Color(0xFF4D96FF);
  }

  @override
  Widget build(BuildContext context) {
    if (zones.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map, size: 64, color: theme.hintColor),
            const SizedBox(height: 16),
            Text('No zones in this region',
                style: TextStyle(color: theme.hintColor)),
          ],
        ),
      );
    }

    final maxCount = zones.map((z) => z.count).reduce((a, b) => a > b ? a : b);

    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: zones.length,
      itemBuilder: (context, i) {
        final zone = zones[i];
        final zoneColor = _getZoneColor(zone.count, maxCount);
        final intensity = maxCount > 0 ? zone.count / maxCount : 0.0;

        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _showZoneDetail(context, zone, zoneColor),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  // Color indicator bar
                  Container(
                    width: 4,
                    height: 48,
                    decoration: BoxDecoration(
                      color: zoneColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Enchant count badge
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: zoneColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        '${zone.count}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: zoneColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(zone.zone,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15)),
                        const SizedBox(height: 2),
                        Text(
                          zone.count == 1
                              ? '1 enchant'
                              : '${zone.count} enchants',
                          style: TextStyle(
                              color: theme.hintColor, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  // Density bar
                  Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.dividerColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: intensity.clamp(0.1, 1.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: zoneColor,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.chevron_right, size: 20, color: theme.hintColor),
                ],
              ),
            ),
          ),
        ).animate().fadeIn(delay: (50 * i).ms).slideX(begin: 0.1);
      },
    );
  }

  void _showZoneDetail(BuildContext context, ZoneContinent zone, Color color) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.85,
        minChildSize: 0.3,
        expand: false,
        builder: (context, scrollController) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 32,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(zone.zone,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('${zone.count}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: color)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('Enchants found here:',
                    style: TextStyle(color: theme.hintColor)),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: zone.enchants.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.stars,
                                size: 16, color: color.withValues(alpha: 0.7)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(zone.enchants[i],
                                  style: const TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}