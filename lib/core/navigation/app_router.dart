import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/home_screen.dart';
import '../../features/class_builder/class_builder_screen.dart';
import '../../features/talent_tree/talent_tree_screen.dart';
import '../../features/mystic_enchant/mystic_enchant_screen.dart';
import '../../features/builds/build_manager_screen.dart';
import '../../features/lore/lore_screen.dart';
import '../../features/lore/lore_entry_screen.dart';
import '../../features/settings/settings_screen.dart';

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
      pageBuilder: (context, state) => _fadePage(const ClassBuilderScreen(), state),
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
      pageBuilder: (context, state) => _fadePage(const MysticEnchantScreen(), state),
    ),
    GoRoute(
      path: '/builds',
      pageBuilder: (context, state) => _fadePage(const BuildManagerScreen(), state),
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
      pageBuilder: (context, state) => _fadePage(const SettingsScreen(), state),
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
