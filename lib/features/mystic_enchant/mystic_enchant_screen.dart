import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../data/models/mystic_enchant.dart';

class MysticEnchantScreen extends ConsumerStatefulWidget {
  const MysticEnchantScreen({super.key});

  @override
  ConsumerState<MysticEnchantScreen> createState() => _MysticEnchantScreenState();
}

class _MysticEnchantScreenState extends ConsumerState<MysticEnchantScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: EnchantSlot.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mystic Enchants'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: EnchantSlot.values.map((s) => Tab(text: s.displayName)).toList(),
        ),
      ),
      body: Column(
        children: [
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
                    .where((e) => _searchQuery.isEmpty ||
                        e.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                        e.description.toLowerCase().contains(_searchQuery.toLowerCase()))
                    .toList();

                final tiers = <EnchantTier, List<MysticEnchant>>{};
                for (final e in enchants) {
                  tiers.putIfAbsent(e.tier, () => []).add(e);
                }
                final tierKeys = tiers.keys.toList()..sort((a, b) => a.index.compareTo(b.index));

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    if (enchants.isEmpty)
                      const Center(child: Text('No enchants found for this slot')),
                    ...tierKeys.map((tier) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 4),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: tier.color, size: 16),
                                const SizedBox(width: 4),
                                Text('Tier ${tier.displayName}',
                                    style: theme.textTheme.titleSmall?.copyWith(
                                        fontWeight: FontWeight.bold, color: tier.color)),
                              ],
                            ),
                          ),
                          ...tiers[tier]!.map((e) {
                            return Card(
                              child: ListTile(
                                title: Text(e.name,
                                    style: const TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text('${e.description} | ${e.slot.displayName}'),
                                trailing: Icon(Icons.star, color: tier.color, size: 20),
                                onTap: () => _showEnchantDetail(context, e, tier.color),
                              ),
                            ).animate().fadeIn(duration: 200.ms);
                          }),
                          const Divider(),
                        ],
                      );
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

  void _showEnchantDetail(BuildContext context, MysticEnchant e, Color tierColor) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.6,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (ctx, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.name,
                    style: Theme.of(ctx).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold, color: tierColor)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: tierColor),
                    const SizedBox(width: 4),
                    Text(e.tier.displayName),
                    const Spacer(),
                    Text(e.slot.displayName),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Effect:\n${e.description}',
                    style: Theme.of(ctx).textTheme.bodyLarge),
                if (e.materials.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text('Materials:',
                      style: Theme.of(ctx).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold)),
                  ...e.materials.map((m) => Text('• $m')),
                ],
                if (e.goldCost != null)
                  Text('Cost: ${e.goldCost}g',
                      style: Theme.of(ctx).textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
