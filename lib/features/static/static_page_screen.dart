import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/ascension_repository.dart';

class StaticPageScreen extends ConsumerWidget {
  final String pageKey;

  const StaticPageScreen({super.key, required this.pageKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPages = ref.watch(pageContentProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(_titleFor(pageKey))),
      body: asyncPages.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (pages) {
          final page = pages.where((p) => p.pageKey == pageKey).firstOrNull;
          if (page == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.article_outlined,
                        size: 80, color: theme.hintColor),
                    const SizedBox(height: 16),
                    Text('Page not found',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'This page has not been published yet.\n'
                      'Check back later or visit ascension.help.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.hintColor, height: 1.5),
                    ),
                  ],
                ),
              ),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(page.title,
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                if (page.subtitle != null && page.subtitle!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(page.subtitle!,
                      style: TextStyle(color: theme.hintColor)),
                ],
                if (page.bodyContent != null &&
                    page.bodyContent!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(page.bodyContent!,
                      style: const TextStyle(height: 1.6)),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  String _titleFor(String key) {
    switch (key) {
      case 'about':
        return 'About';
      case 'contact':
        return 'Contact';
      case 'privacy':
        return 'Privacy';
      default:
        return key;
    }
  }
}
