import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/repository/ascension_repository.dart';

class DungeonRouteListScreen extends ConsumerWidget {
  const DungeonRouteListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRoutes = ref.watch(dungeonRoutesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Dungeon Routes')),
      body: asyncRoutes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (routes) {
          if (routes.isEmpty) {
            return const Center(
              child: Text('No dungeon routes available.',
                  style: TextStyle(color: Colors.grey)),
            );
          }
          return ListView.builder(
            itemCount: routes.length,
            itemBuilder: (context, i) {
              final route = routes[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(route.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: route.expansion != null && route.expansion!.isNotEmpty
                      ? Text(route.expansion!)
                      : null,
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => context.push('/dungeon-routes/${route.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
