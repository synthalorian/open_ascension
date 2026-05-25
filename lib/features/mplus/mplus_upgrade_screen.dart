import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/ascension_repository.dart';

class MplusUpgradeScreen extends ConsumerWidget {
  const MplusUpgradeScreen({super.key});

  static const _columnLabels = [
    'MH / OH',
    'Boots, Neck,\nWaist, Back\nFinger, Feet,\nWrist',
    'Hands &\nShoulders',
    'Ranged',
    'Trinket',
    'Legs, Head,\nChest',
    'Totem /\nRelic',
    '2-Hand',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUpgrades = ref.watch(mplusUpgradesProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('M+ Upgrade Costs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('About M+ Upgrade Costs'),
                content: const Text(
                  'Purchase and upgrade costs for Mythic+ gear '
                  'by item slot and upgrade level.\n\n'
                  'Costs are in Emblems of Triumph.',
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Got it')),
                ],
              ),
            ),
          ),
        ],
      ),
      body: asyncUpgrades.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (upgrades) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              columnSpacing: 16,
              headingRowHeight: 56,
              dataRowMinHeight: 36,
              dataRowMaxHeight: 36,
              columns: [
                DataColumn(
                  label: SizedBox(
                    width: 80,
                    child: Text('Level',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary)),
                  ),
                ),
                ..._columnLabels.map((label) => DataColumn(
                      label: SizedBox(
                        width: 70,
                        child: Text(label,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10)),
                      ),
                    )),
              ],
              rows: upgrades.map((u) {
                final isTotal = u.level == 'Total';
                return DataRow(
                  color: isTotal
                      ? WidgetStateProperty.all(
                          theme.colorScheme.primary.withValues(alpha: 0.12))
                      : null,
                  cells: [
                    DataCell(Text(u.level,
                        style: TextStyle(
                            fontWeight: isTotal ? FontWeight.bold : null,
                            color: isTotal
                                ? theme.colorScheme.primary
                                : null))),
                    DataCell(Text('${u.mainHandOffHand}')),
                    DataCell(Text('${u.bootsNeckWaistBackFingerFeetWrist}')),
                    DataCell(Text('${u.handsShoulders}')),
                    DataCell(Text('${u.ranged}')),
                    DataCell(Text('${u.trinket}')),
                    DataCell(Text('${u.legsHeadChest}')),
                    DataCell(Text('${u.totemRelic}')),
                    DataCell(Text('${u.twoHand}',
                        style: TextStyle(
                            fontWeight: isTotal ? FontWeight.bold : null))),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}