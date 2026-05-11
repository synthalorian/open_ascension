import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/theme_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final currentTheme = ref.watch(themeProvider);
    final mode = currentTheme.value;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.colorScheme.primary.withValues(alpha: 0.3),
                    theme.colorScheme.primary.withValues(alpha: 0.05),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, size: 40,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Open Ascension',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.2),
                  const SizedBox(height: 4),
                  Text('The Ultimate Ascension Companion',
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.hintColor)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text('Quick Access',
                  style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: [
                  _QuickCard(
                    title: 'Class Builder',
                    subtitle: 'Abilities, talents, stats',
                    icon: Icons.flash_on,
                    color: theme.colorScheme.primary,
                    onTap: () => context.push('/class'),
                  ).animate().fadeIn(delay: 100.ms),
                  _QuickCard(
                    title: 'Talents',
                    subtitle: 'Tree builder & planner',
                    icon: Icons.account_tree,
                    color: theme.colorScheme.secondary,
                    onTap: () => context.push('/talents'),
                  ).animate().fadeIn(delay: 200.ms),
                  _QuickCard(
                    title: 'Mystic Enchants',
                    subtitle: 'Titan-forged enchants',
                    icon: Icons.stars,
                    color: theme.colorScheme.tertiary,
                    onTap: () => context.push('/enchants'),
                  ).animate().fadeIn(delay: 300.ms),
                  _QuickCard(
                    title: 'My Builds',
                    subtitle: 'Saved character builds',
                    icon: Icons.folder,
                    color: theme.colorScheme.primary,
                    onTap: () => context.push('/builds'),
                  ).animate().fadeIn(delay: 400.ms),
                  _QuickCard(
                    title: 'Lore',
                    subtitle: 'Warcraft & Ascension',
                    icon: Icons.menu_book,
                    color: theme.colorScheme.secondary,
                    onTap: () => context.push('/lore'),
                  ).animate().fadeIn(delay: 500.ms),
                  _QuickCard(
                    title: 'Settings',
                    subtitle: 'Themes, data, about',
                    icon: Icons.settings,
                    color: theme.hintColor,
                    onTap: () => context.push('/settings'),
                  ).animate().fadeIn(delay: 600.ms),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.palette,
                          color: theme.colorScheme.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Theme: ${mode?.displayName ?? "Neon Grid"}',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.push('/settings'),
                        child: const Text('Change'),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(delay: 700.ms),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
        ],
      ),
    );
  }
}

class _QuickCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      color: color.withValues(alpha: 0.1),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(title,
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: color)),
              Text(subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.hintColor)),
            ],
          ),
        ),
      ),
    );
  }
}
