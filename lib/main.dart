import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_provider.dart';
import 'data/repositories/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.init();

  runApp(
    ProviderScope(
      child: const App(),
    ),
  );
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return themeMode.when(
      loading: () => const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (e, st) => const MaterialApp(
        home: Scaffold(
          body: Center(child: Icon(Icons.error_outline)),
        ),
      ),
      data: (mode) {
        // Load saved theme on startup
        final provider = ref.read(themeProvider.notifier);
        provider.loadSaved();

        return MaterialApp.router(
          title: 'Open Ascension',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getTheme(mode),
          routerConfig: appRouter,
        );
      },
    );
  }
}
