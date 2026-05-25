import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../data/repository/ascension_repository.dart';

class DungeonRouteDetailScreen extends ConsumerStatefulWidget {
  final String routeId;
  const DungeonRouteDetailScreen({super.key, required this.routeId});

  @override
  ConsumerState<DungeonRouteDetailScreen> createState() =>
      _DungeonRouteDetailScreenState();
}

class _DungeonRouteDetailScreenState
    extends ConsumerState<DungeonRouteDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncRoutes = ref.watch(dungeonRoutesProvider);
    final asyncImages = ref.watch(dungeonRouteImagesProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Route Details')),
      body: asyncRoutes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (routes) {
          final route = routes.firstWhere(
            (r) => r.id == widget.routeId,
            orElse: () => throw Exception('Route not found'),
          );
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(route.name,
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 12),
                if (route.expansion != null && route.expansion!.isNotEmpty)
                  _label('Expansion', route.expansion!),
                if (route.notes != null && route.notes!.isNotEmpty)
                  _section('Notes', route.notes!),
                if (route.difficultyNotes != null && route.difficultyNotes!.isNotEmpty)
                  _section('Difficulty', route.difficultyNotes!),
                if (route.affixNotes != null && route.affixNotes!.isNotEmpty)
                  _section('Affix Notes', route.affixNotes!),
                if (route.groupTips != null && route.groupTips!.isNotEmpty)
                  _section('Group Tips', route.groupTips!),
                if (route.seasonLabel != null && route.seasonLabel!.isNotEmpty)
                  _label('Season', route.seasonLabel!),
                const SizedBox(height: 20),
                const Divider(),
                const Text('Route Images',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 12),
                asyncImages.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Text('Images error: $err'),
                  data: (images) {
                    final routeImages = images
                        .where((img) => img.dungeonId == widget.routeId)
                        .toList()
                      ..sort((a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0));
                    
                    // Also try local asset
                    final localPath = 'assets/images/dungeons/${route.name.toLowerCase().replaceAll(' ', '_')}.png';
                    
                    return SizedBox(
                      height: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                localPath,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) {
                                  if (routeImages.isNotEmpty) {
                                    return CachedNetworkImage(
                                      imageUrl: routeImages.first.imageUrl,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      placeholder: (c, u) => const Center(child: CircularProgressIndicator()),
                                      errorWidget: (c, u, e) => const Icon(Icons.broken_image),
                                    );
                                  }
                                  return Container(
                                    height: 160,
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary.withValues(alpha: 0.08),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.map, size: 40, color: theme.hintColor),
                                          const SizedBox(height: 8),
                                          Text('No route image', style: TextStyle(color: theme.hintColor)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          if (routeImages.length > 1)
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: routeImages.length,
                                itemBuilder: (context, i) {
                                  final img = routeImages[i];
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8, top: 8),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: GestureDetector(
                                        onTap: () => _showImageFullscreen(context, img.imageUrl),
                                        child: CachedNetworkImage(
                                          imageUrl: img.imageUrl,
                                          width: 160,
                                          fit: BoxFit.cover,
                                          placeholder: (c, u) => const SizedBox(
                                            width: 160, height: 90,
                                            child: Center(child: CircularProgressIndicator()),
                                          ),
                                          errorWidget: (c, u, e) => const SizedBox(
                                            width: 160, height: 90,
                                            child: Icon(Icons.broken_image),
                                          ),
                                        ),
                                      ),
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
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _label(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.white70),
          children: [
            TextSpan(
                text: '$label: ',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget _section(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(height: 1.5)),
        ],
      ),
    );
  }

  void _showImageFullscreen(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        child: InteractiveViewer(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
              placeholder: (c, u) => const Center(child: CircularProgressIndicator()),
              errorWidget: (c, u, e) => const Icon(Icons.broken_image, color: Colors.white, size: 48),
            ),
          ),
        ),
      ),
    );
  }
}
