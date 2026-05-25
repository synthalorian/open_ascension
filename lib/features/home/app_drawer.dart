import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Navigation drawer with themed sections for Open Ascension.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: Container(
        color: theme.colorScheme.surface,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.primary.withValues(alpha: 0.4),
                    theme.colorScheme.surface,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.auto_awesome,
                      size: 40, color: theme.colorScheme.primary),
                  const SizedBox(height: 8),
                  Text('Open Ascension',
                      style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.primary)),
                  Text('The Ultimate Companion',
                      style: TextStyle(color: theme.hintColor)),
                ],
              ),
            ),
            // ── Character Builder ──
            _Header('Character Builder'),
            _NavItem(
              icon: Icons.flash_on,
              label: 'Class Builder',
              route: '/class',
            ),
            _NavItem(
              icon: Icons.account_tree,
              label: 'Talents',
              route: '/talents',
            ),
            _NavItem(
              icon: Icons.stars,
              label: 'Mystic Enchants',
              route: '/enchants',
            ),
            _NavItem(
              icon: Icons.folder,
              label: 'My Builds',
              route: '/builds',
            ),
            _NavItem(
              icon: Icons.inventory_2,
              label: 'Gear Database',
              route: '/gear',
            ),
            const Divider(),
            // ── Reference ──
            _Header('Reference'),
            _NavItem(
              icon: Icons.bolt,
              label: 'Mythic+ Affixes',
              route: '/affixes',
            ),
            _NavItem(
              icon: Icons.map,
              label: 'Enchant Zones',
              route: '/map',
            ),
            _NavItem(
              icon: Icons.build,
              label: 'Item Affixes',
              route: '/affixes/items',
            ),
            _NavItem(
              icon: Icons.map,
              label: 'Dungeon Routes',
              route: '/dungeon-routes',
            ),
            _NavItem(
              icon: Icons.extension,
              label: 'WeakAuras',
              route: '/weakauras',
            ),
            _NavItem(
              icon: Icons.lightbulb,
              label: 'Suggestions',
              route: '/suggestions',
            ),
            _NavItem(
              icon: Icons.inventory_2_outlined,
              label: 'Item Affix Suggestions',
              route: '/items/affixes',
            ),
            _NavItem(
              icon: Icons.speed,
              label: 'Mythic+',
              route: '/mplus',
            ),
            _NavItem(
              icon: Icons.trending_up,
              label: 'M+ Upgrade Costs',
              route: '/mplus/upgrades',
            ),
            const Divider(),
            // ── Lore ──
            _Header('Lore'),
            _NavItem(
              icon: Icons.menu_book,
              label: 'Lore & Stories',
              route: '/lore',
            ),
            const Divider(),
            // ── More ──
            _Header('More'),
            _NavItem(
              icon: Icons.dns,
              label: 'Realms',
              route: '/realms',
            ),
            _NavItem(
              icon: Icons.info_outline,
              label: 'About',
              route: '/about',
            ),
            _NavItem(
              icon: Icons.contact_mail,
              label: 'Contact',
              route: '/contact',
            ),
            _NavItem(
              icon: Icons.settings,
              label: 'Settings',
              route: '/settings',
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String label;
  const _Header(this.label);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Text(label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: theme.colorScheme.primary,
            letterSpacing: 1.2,
          )),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 22),
      title: Text(label, style: const TextStyle(fontSize: 14)),
      dense: true,
      onTap: () {
        Navigator.pop(context); // close drawer
        context.push(route);
      },
    );
  }
}
