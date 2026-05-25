import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/ascension/feature_suggestion.dart';
import '../../data/repository/ascension_repository.dart';

class SuggestionListScreen extends ConsumerWidget {
  const SuggestionListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSuggestions = ref.watch(featureSuggestionsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Feature Suggestions')),
      body: asyncSuggestions.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (suggestions) {
          if (suggestions.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lightbulb_outline,
                        size: 80, color: theme.hintColor),
                    const SizedBox(height: 16),
                    Text('No suggestions yet',
                        style: theme.textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'Suggest features on the website at ascension.help',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: theme.hintColor),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, i) {
              final s = suggestions[i];
              return _SuggestionCard(suggestion: s, theme: theme);
            },
          );
        },
      ),
    );
  }
}

class _SuggestionCard extends StatelessWidget {
  final FeatureSuggestion suggestion;
  final ThemeData theme;

  const _SuggestionCard({required this.suggestion, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ExpansionTile(
        leading: Icon(
          suggestion.status == 'approved'
              ? Icons.check_circle
              : suggestion.status == 'rejected'
                  ? Icons.cancel
                  : Icons.hourglass_empty,
          color: suggestion.status == 'approved'
              ? Colors.green
              : suggestion.status == 'rejected'
                  ? Colors.red
                  : Colors.orange,
        ),
        title: Text(suggestion.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Icon(Icons.thumb_up, size: 14, color: Colors.green),
            const SizedBox(width: 4),
            Text('${suggestion.upvotes}'),
            const SizedBox(width: 16),
            Icon(Icons.thumb_down, size: 14, color: Colors.red),
            const SizedBox(width: 4),
            Text('${suggestion.downvotes}'),
          ],
        ),
        children: [
          if (suggestion.description != null &&
              suggestion.description!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(suggestion.description!,
                  style: const TextStyle(height: 1.5)),
            ),
        ],
      ),
    );
  }
}
