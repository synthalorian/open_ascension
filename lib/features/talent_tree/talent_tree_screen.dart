import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/class.dart';
import '../../data/models/talent.dart';

class TalentTreeScreen extends ConsumerStatefulWidget {
  final String classId;
  final String? specName;

  const TalentTreeScreen({super.key, required this.classId, this.specName});

  @override
  ConsumerState<TalentTreeScreen> createState() => _TalentTreeScreenState();
}

class _TalentTreeScreenState extends ConsumerState<TalentTreeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late WarClass _cls;
  final Set<String> _selectedTalentIds = {};
  int _pointsRemaining = 31;

  @override
  void initState() {
    super.initState();
    _cls = WarClass.findById(widget.classId)!;
    _tabController = TabController(length: _cls.specNames.length, vsync: this);
    _tabController.addListener(_onSpecTabChanged);
  }

  void _onSpecTabChanged() {
    if (_tabController.indexIsChanging) return;
    setState(() {
      _selectedTalentIds.clear();
      _pointsRemaining = 31;
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onSpecTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  Color get _specColor => _cls.color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${_cls.displayName} Talents'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _cls.specNames.map((s) => Tab(text: s)).toList(),
          labelColor: _specColor,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Talent Points:'),
                const SizedBox(width: 8),
                Text('$_pointsRemaining / 31',
                    style: theme.textTheme.titleMedium?.copyWith(
                        color: _pointsRemaining <= 5 ? Colors.red
                            : theme.colorScheme.primary,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _cls.specNames.map((spec) {
                final talents = sampleTalents
                    .where((t) => t.classId == widget.classId && t.specName == spec)
                    .toList();
                return _buildTalentGrid(theme, talents);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTalentGrid(ThemeData theme, List<Talent> talents) {
    if (talents.isEmpty) {
      return const Center(child: Text('No talents defined for this spec yet'));
    }

    final tiers = <int, List<Talent>>{};
    for (final t in talents) {
      tiers.putIfAbsent(t.tier, () => []).add(t);
    }
    final tierKeys = tiers.keys.toList()..sort();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: tierKeys.map((tier) {
        final tierTalents = tiers[tier]!
            .toList()..sort((a, b) => a.column.compareTo(b.column));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 8),
              child: Text('Tier $tier',
                  style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold, color: _specColor)),
            ),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: tierTalents.map((t) {
                final isSelected = _selectedTalentIds.contains(t.id);
                return _TalentNode(
                  talent: t,
                  isSelected: isSelected,
                  specColor: _specColor,
                  canSelect: !isSelected && _pointsRemaining > 0,
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        _selectedTalentIds.remove(t.id);
                        _pointsRemaining++;
                      } else if (_pointsRemaining > 0) {
                        _selectedTalentIds.add(t.id);
                        _pointsRemaining--;
                      }
                    });
                  },
                );
              }).toList(),
            ),
          ],
        );
      }).toList(),
    );
  }
}

class _TalentNode extends StatelessWidget {
  final Talent talent;
  final bool isSelected;
  final Color specColor;
  final bool canSelect;
  final VoidCallback onTap;

  const _TalentNode({
    required this.talent,
    required this.isSelected,
    required this.specColor,
    required this.canSelect,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLocked = !canSelect && !isSelected;

    return InkWell(
      onTap: isLocked ? null : onTap,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: isSelected ? specColor
              : isLocked ? theme.disabledColor.withValues(alpha: 0.3)
              : specColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? specColor : (isLocked ? theme.disabledColor : specColor),
            width: isSelected ? 2.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(talent.name[0],
                style: theme.textTheme.titleSmall?.copyWith(
                    color: isSelected ? Colors.white : specColor,
                    fontWeight: FontWeight.bold)),
            if (talent.maxRank > 1)
              Text('x${talent.maxRank}',
                  style: theme.textTheme.labelSmall?.copyWith(
                      color: isSelected ? Colors.white70 : theme.hintColor)),
          ],
        ),
      ),
    );
  }
}
