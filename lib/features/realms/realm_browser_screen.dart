import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../data/models/realm.dart';

class RealmBrowserScreen extends StatelessWidget {
  const RealmBrowserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Server Realms')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sampleRealms.length,
        itemBuilder: (context, index) {
          final realm = sampleRealms[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: Icon(Icons.dns, color: _statusColor(realm.status)),
              title: Text(
                realm.name,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: _statusColor(realm.status),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${realm.status.displayName}${realm.isPvP ? ' • PvP' : ' • PvE'} • Pop: ${realm.population}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.hintColor,
                    ),
                  ),
                ],
              ),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              expandedAlignment: Alignment.centerLeft,
              children: [
                _RealmDetailCard(label: 'Type', value: realm.type.displayName, theme: theme),
                _RealmDetailCard(label: 'Status', value: realm.status.displayName, theme: theme, color: _statusColor(realm.status)),
                if (realm.description != null)
                  _RealmDetailCard(label: 'About', value: realm.description!, theme: theme),
                _RealmDetailCard(label: 'Phase', value: realm.currentPhase, theme: theme),
                if (realm.maxLevel != '80')
                  _RealmDetailCard(label: 'Max Level', value: realm.maxLevel, theme: theme),
                if (realm.hostAddress != null)
                  _RealmDetailCard(label: 'Connect', value: realm.hostAddress, theme: theme, monospace: true),
              ],
            ),
          ).animate().fadeIn(delay: (index * 80).milliseconds);
        },
      ),
    );
  }

  Color _statusColor(RealmStatus status) {
    switch (status) {
      case RealmStatus.online: return Colors.green;
      case RealmStatus.maintenance: return Colors.orange;
      case RealmStatus.full: return Colors.red;
    }
  }
}

class _RealmDetailCard extends StatelessWidget {
  final String label;
  final String? value;
  final ThemeData theme;
  final Color? color;
  final bool monospace;

  const _RealmDetailCard({
    required this.label,
    this.value,
    required this.theme,
    this.color,
    this.monospace = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.hintColor,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value ?? 'N/A',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: color,
                fontFamily: monospace ? 'monospace' : null,
                fontSize: monospace ? 12 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
