import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/lore_entry.dart';

class LoreScreen extends ConsumerStatefulWidget {
  const LoreScreen({super.key});

  @override
  ConsumerState<LoreScreen> createState() => _LoreScreenState();
}

class _LoreScreenState extends ConsumerState<LoreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: LoreCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warcraft Lore'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: LoreCategory.values
              .map((c) => Tab(text: c.displayName))
              .toList(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search lore...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => _searchQuery = v),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: LoreCategory.values.map((category) {
                final entries = sampleLoreEntries
                    .where((e) => e.category == category)
                    .where((e) => _searchQuery.isEmpty ||
                        e.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                        e.summary.toLowerCase().contains(_searchQuery.toLowerCase()))
                    .toList();

                return ListView(
                  padding: const EdgeInsets.all(12),
                  children: [
                    if (entries.isEmpty)
                      const Center(
                        child: Text('No entries in this category yet'),
                      ),
                    ...entries.map((entry) {
                      return Card(
                        child: ListTile(
                          leading: _categoryIcon(category),
                          title: Text(entry.title,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(entry.summary),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => context.push('/lore/${entry.id}'),
                        ),
                      ).animate().fadeIn(duration: 200.ms);
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

  Widget _categoryIcon(LoreCategory category) {
    switch (category) {
      case LoreCategory.timeline:
        return const Icon(Icons.timeline, color: Colors.amber);
      case LoreCategory.characters:
        return const Icon(Icons.person, color: Colors.blue);
      case LoreCategory.factions:
        return const Icon(Icons.groups, color: Colors.red);
      case LoreCategory.locations:
        return const Icon(Icons.map, color: Colors.green);
      case LoreCategory.ascension:
        return const Icon(Icons.auto_awesome, color: Colors.purple);
      case LoreCategory.items:
        return const Icon(Icons.inventory_2, color: Colors.orange);
    }
  }
}
