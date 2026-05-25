import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/home_screen.dart';
import '../../features/class_builder/class_builder_screen.dart';
import '../../features/talent_tree/talent_tree_screen.dart';
import '../../features/mystic_enchant/mystic_enchant_screen.dart';
import '../../features/builds/build_manager_screen.dart';
import '../../features/lore/lore_screen.dart';
import '../../features/lore/lore_entry_screen.dart';
import '../../features/realms/realm_browser_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/gear/gear_browser_screen.dart';
import '../../features/affixes/affix_list_screen.dart';
import '../../features/affixes/affix_detail_screen.dart';
import '../../features/dungeon_routes/dungeon_route_list_screen.dart';
import '../../features/dungeon_routes/dungeon_route_detail_screen.dart';
import '../../features/weakauras/weakaura_list_screen.dart';
import '../../features/weakauras/weakaura_detail_screen.dart';
import '../../features/suggestions/suggestion_list_screen.dart';
import '../../features/items/item_affix_suggestions_screen.dart';
import '../../features/mplus/mplus_screen.dart';
import '../../features/affixes/item_affix_list_screen.dart';
import '../../features/mplus/mplus_upgrade_screen.dart';
import '../../features/map/zone_map_screen.dart';
import '../../features/static/static_page_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  redirect: (context, state) {
    if (state.matchedLocation == '/') return '/home';
    return null;
  },
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => _fadePage(const HomeScreen(), state),
    ),
    GoRoute(
      path: '/class',
      pageBuilder: (context, state) =>
          _fadePage(const ClassBuilderScreen(), state),
    ),
    GoRoute(
      path: '/talents',
      pageBuilder: (context, state) {
        final extra = state.extra as Map<String, dynamic>?;
        return _fadePage(
          TalentTreeScreen(
            classId: extra?['classId'] as String? ?? 'warrior',
            specName: extra?['specName'] as String?,
          ),
          state,
        );
      },
    ),
    GoRoute(
      path: '/enchants',
      pageBuilder: (context, state) =>
          _fadePage(const MysticEnchantScreen(), state),
    ),
    GoRoute(
      path: '/builds',
      pageBuilder: (context, state) =>
          _fadePage(const BuildManagerScreen(), state),
    ),
    GoRoute(
      path: '/lore',
      pageBuilder: (context, state) => _fadePage(const LoreScreen(), state),
    ),
    GoRoute(
      path: '/lore/:entryId',
      pageBuilder: (context, state) => _fadePage(
        LoreEntryScreen(entryId: state.pathParameters['entryId']!),
        state,
      ),
    ),
    GoRoute(
      path: '/settings',
      pageBuilder: (context, state) =>
          _fadePage(const SettingsScreen(), state),
    ),
    GoRoute(
      path: '/realms',
      pageBuilder: (context, state) =>
          _fadePage(const RealmBrowserScreen(), state),
    ),
    GoRoute(
      path: '/gear',
      pageBuilder: (context, state) =>
          _fadePage(const GearBrowserScreen(), state),
    ),
    // Reference section
    GoRoute(
      path: '/affixes',
      pageBuilder: (context, state) =>
          _fadePage(const AffixListScreen(), state),
    ),
    GoRoute(
      path: '/affixes/:id',
      pageBuilder: (context, state) => _fadePage(
        AffixDetailScreen(affixId: state.pathParameters['id']!),
        state,
      ),
    ),
    GoRoute(
      path: '/affixes/items',
      pageBuilder: (context, state) =>
          _fadePage(const ItemAffixListScreen(), state),
    ),
    GoRoute(
      path: '/mplus/upgrades',
      pageBuilder: (context, state) =>
          _fadePage(const MplusUpgradeScreen(), state),
    ),
    GoRoute(
      path: '/dungeon-routes',
      pageBuilder: (context, state) =>
          _fadePage(const DungeonRouteListScreen(), state),
    ),
    GoRoute(
      path: '/dungeon-routes/:id',
      pageBuilder: (context, state) => _fadePage(
        DungeonRouteDetailScreen(routeId: state.pathParameters['id']!),
        state,
      ),
    ),
    GoRoute(
      path: '/weakauras',
      pageBuilder: (context, state) =>
          _fadePage(const WeakauraListScreen(), state),
    ),
    GoRoute(
      path: '/weakauras/:id',
      pageBuilder: (context, state) => _fadePage(
        WeakauraDetailScreen(weakauraId: state.pathParameters['id']!),
        state,
      ),
    ),
    GoRoute(
      path: '/suggestions',
      pageBuilder: (context, state) =>
          _fadePage(const SuggestionListScreen(), state),
    ),
    GoRoute(
      path: '/items/affixes',
      pageBuilder: (context, state) =>
          _fadePage(const ItemAffixSuggestionsScreen(), state),
    ),
    GoRoute(
      path: '/mplus',
      pageBuilder: (context, state) => _fadePage(const MplusScreen(), state),
    ),
    GoRoute(
      path: '/map',
      pageBuilder: (context, state) =>
          _fadePage(const ZoneMapScreen(), state),
    ),
    GoRoute(
      path: '/about',
      pageBuilder: (context, state) => _fadePage(
        const StaticPageScreen(pageKey: 'about'),
        state,
      ),
    ),
    GoRoute(
      path: '/contact',
      pageBuilder: (context, state) => _fadePage(
        const StaticPageScreen(pageKey: 'contact'),
        state,
      ),
    ),
  ],
);

CustomTransitionPage _fadePage(Widget child, GoRouterState state) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
