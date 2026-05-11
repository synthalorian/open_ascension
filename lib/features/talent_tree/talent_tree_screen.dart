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
  final Map<String, int> _ranks = {};
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
      _ranks.clear();
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

  /// Check if a talent's prerequisites are met.
  bool _canSelect(Talent t, List<Talent> allTalents) {
    if (t.prereqTalentId == null) return true;
    final prereq = allTalents.where((x) => x.id == t.prereqTalentId).firstOrNull;
    if (prereq == null) return true;
    final currentRank = _ranks[prereq.id] ?? 0;
    return currentRank >= prereq.maxRank;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('${_cls.displayName} Talents'),
        actions: [
          if (_ranks.isNotEmpty)
            TextButton.icon(
              onPressed: () => setState(() {
                _ranks.clear();
                _pointsRemaining = 31;
              }),
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Reset'),
            ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: _cls.specNames.map((s) => Tab(text: s)).toList(),
          labelColor: _specColor,
          indicatorColor: _specColor,
        ),
      ),
      body: Column(
        children: [
          _buildHeader(theme),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _cls.specNames.map((spec) {
                final talents = sampleTalents
                    .where((t) => t.classId == widget.classId && t.specName == spec)
                    .toList();
                return _buildTalentTree(theme, talents);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.dividerColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.stars, color: _specColor, size: 18),
          const SizedBox(width: 8),
          const Text('Talent Points:'),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: _specColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text('$_pointsRemaining / 31',
                style: theme.textTheme.titleMedium?.copyWith(
                    color: _pointsRemaining <= 5 ? Colors.red : _specColor,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildTalentTree(ThemeData theme, List<Talent> talents) {
    if (talents.isEmpty) {
      return const Center(child: Text('No talents defined for this spec yet'));
    }

    final tiers = <int, List<Talent>>{};
    for (final t in talents) {
      tiers.putIfAbsent(t.tier, () => []).add(t);
    }
    final tierKeys = tiers.keys.toList()..sort();
    final maxTier = tierKeys.last;

    return CustomPaint(
      painter: _TalentLinesPainter(talents: talents, ranks: _ranks, specColor: _specColor),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: _TalentGrid(
          talents: talents,
          tierKeys: tierKeys,
          maxTier: maxTier,
          specColor: _specColor,
          ranks: _ranks,
          pointsRemaining: _pointsRemaining,
          canSelect: (t) => _canSelect(t, talents),
          onRankUp: (t) {
            setState(() {
              if (_pointsRemaining > 0) {
                final currentRank = _ranks[t.id] ?? 0;
                if (currentRank < t.maxRank) {
                  _ranks[t.id] = currentRank + 1;
                  _pointsRemaining--;
                }
              }
            });
          },
          onRankDown: (t) {
            setState(() {
              final currentRank = _ranks[t.id] ?? 0;
              if (currentRank > 0) {
                // Check nothing downstream depends on this rank
                final dependents = talents.where((x) => x.prereqTalentId == t.id);
                for (final dep in dependents) {
                  final depRank = _ranks[dep.id] ?? 0;
                  if (depRank > 0) return; // Can't demote if downstream is spec'd
                }
                _ranks[t.id] = currentRank - 1;
                _pointsRemaining++;
              }
            });
          },
          onTap: (t) {
            // Show talent details
            showModalBottomSheet(
              context: context,
              builder: (ctx) => _TalentDetailSheet(talent: t, rank: _ranks[t.id] ?? 0, specColor: _specColor),
            );
          },
        ),
      ),
    );
  }
}

/// Grid-based talent layout with 3 columns per tier.
class _TalentGrid extends StatelessWidget {
  final List<Talent> talents;
  final List<int> tierKeys;
  final int maxTier;
  final Color specColor;
  final Map<String, int> ranks;
  final int pointsRemaining;
  final bool Function(Talent) canSelect;
  final void Function(Talent) onRankUp;
  final void Function(Talent) onRankDown;
  final void Function(Talent) onTap;

  const _TalentGrid({
    required this.talents, required this.tierKeys, required this.maxTier,
    required this.specColor, required this.ranks, required this.pointsRemaining,
    required this.canSelect, required this.onRankUp, required this.onRankDown,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const colWidth = 72.0;
    const rowHeight = 96.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = 3 * colWidth;
        final totalHeight = (maxTier) * rowHeight + 40;

        return Center(
          child: SizedBox(
            width: totalWidth + 32,
            height: totalHeight,
            child: Stack(
              children: [
                for (int tier = 1; tier <= maxTier; tier++) ...[
                  for (final t in talents.where((t) => t.tier == tier))
                    Positioned(
                      left: (t.column - 1) * colWidth + 16,
                      top: (tier - 1) * rowHeight + 12,
                      child: _TalentNode(
                        talent: t,
                        specColor: specColor,
                        currentRank: ranks[t.id] ?? 0,
                        isSelectable: canSelect(t) && pointsRemaining > 0,
                        hasPrereq: t.prereqTalentId != null,
                        prereqMet: canSelect(t),
                        onRankUp: () => onRankUp(t),
                        onRankDown: () => onRankDown(t),
                        onTap: () => onTap(t),
                      ),
                    ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Draws connecting lines between tiers and to prerequisite talents
class _TalentLinesPainter extends CustomPainter {
  final List<Talent> talents;
  final Map<String, int> ranks;
  final Color specColor;

  _TalentLinesPainter({required this.talents, required this.ranks, required this.specColor});

  @override
  void paint(Canvas canvas, Size size) {
    const colWidth = 72.0;
    const rowHeight = 96.0;

    for (final t in talents) {
      if (t.prereqTalentId == null) continue;
      final prereq = talents.where((x) => x.id == t.prereqTalentId).firstOrNull;
      if (prereq == null) continue;

      // Calculate positions
      final startX = (prereq.column - 1) * colWidth + 16 + 36 + 8;
      final startY = (prereq.tier - 1) * rowHeight + 12 + 80 + 8;
      final endX = (t.column - 1) * colWidth + 16 + 36 + 8;
      final endY = (t.tier - 1) * rowHeight + 12 + 8;

      final isLocked = (ranks[prereq.id] ?? 0) < prereq.maxRank;

      final paint = Paint()
        ..color = isLocked ? specColor.withValues(alpha: 0.2) : specColor.withValues(alpha: 0.7)
        ..strokeWidth = isLocked ? 1.5 : 2.5
        ..style = PaintingStyle.stroke;

      // Draw a simple line with arrow
      final path = Path();
      path.moveTo(startX, startY);
      // Curve to the next node
      final midY = (startY + endY) / 2;
      path.cubicTo(startX, midY, endX, midY, endX, endY);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _TalentLinesPainter old) => true;
}

class _TalentNode extends StatelessWidget {
  final Talent talent;
  final Color specColor;
  final int currentRank;
  final bool isSelectable;
  final bool hasPrereq;
  final bool prereqMet;
  final VoidCallback onRankUp;
  final VoidCallback onRankDown;
  final VoidCallback onTap;

  const _TalentNode({
    required this.talent, required this.specColor,
    required this.currentRank, required this.isSelectable,
    required this.hasPrereq, required this.prereqMet,
    required this.onRankUp, required this.onRankDown, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMaxed = currentRank >= talent.maxRank;
    final isLocked = !prereqMet && hasPrereq;

    return GestureDetector(
      onLongPress: onTap,
      onDoubleTap: isSelectable && !isMaxed ? onRankUp : null,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: isMaxed ? specColor
              : isLocked ? Colors.grey.withValues(alpha: 0.2)
              : currentRank > 0 ? specColor.withValues(alpha: 0.4)
              : specColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isMaxed ? specColor
                : isLocked ? Colors.grey.withValues(alpha: 0.3)
                : currentRank > 0 ? specColor.withValues(alpha: 0.6)
                : specColor.withValues(alpha: 0.3),
            width: isMaxed ? 2.5 : currentRank > 0 ? 2 : 1,
          ),
          boxShadow: isMaxed ? [
            BoxShadow(color: specColor.withValues(alpha: 0.3), blurRadius: 8),
          ] : null,
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (talent.maxRank > 1)
                    Text('$currentRank/${talent.maxRank}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isLocked ? Colors.grey : Colors.white,
                        ))
                  else
                    Icon(
                      isMaxed ? Icons.check_circle : Icons.star_outline,
                      color: isLocked ? Colors.grey
                          : isMaxed ? Colors.white
                          : specColor.withValues(alpha: 0.7),
                      size: 24,
                    ),
                  if (talent.maxRank > 1 && currentRank == 0)
                    Text('0/${talent.maxRank}',
                        style: TextStyle(fontSize: 11,
                            color: isLocked ? Colors.grey : specColor.withValues(alpha: 0.5))),
                ],
              ),
            ),
            if (isLocked)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(Icons.lock, color: Colors.white54, size: 18),
                ),
              ),
            // Rank controls
            if (currentRank > 0)
              Positioned(
                bottom: -4,
                right: -4,
                child: GestureDetector(
                  onTap: onRankDown,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: specColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.remove, color: Colors.white, size: 12),
                  ),
                ),
              ),
            if (isSelectable && !isMaxed)
              Positioned(
                bottom: -4,
                left: -4,
                child: GestureDetector(
                  onTap: onRankUp,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: specColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _TalentDetailSheet extends StatelessWidget {
  final Talent talent;
  final int rank;
  final Color specColor;

  const _TalentDetailSheet({required this.talent, required this.rank, required this.specColor});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.4,
      minChildSize: 0.3,
      maxChildSize: 0.7,
      builder: (ctx, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: specColor.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(talent.name[0],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: specColor,
                          )),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(talent.name,
                            style: Theme.of(ctx).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold, color: specColor)),
                        if (talent.maxRank > 1)
                          Text('Rank $rank of ${talent.maxRank}',
                              style: Theme.of(ctx).textTheme.labelMedium?.copyWith(
                                  color: specColor)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(talent.description,
                  style: Theme.of(ctx).textTheme.bodyLarge),
              if (talent.prereqTalentId != null) ...[
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.lock_outline, size: 16),
                    const SizedBox(width: 4),
                    Text('Requires prerequisite talent',
                        style: Theme.of(ctx).textTheme.labelSmall),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
