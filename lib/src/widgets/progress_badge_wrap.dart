import 'package:flutter/material.dart';

import '../models/progress_badge.dart';
import 'progress_badge_chip.dart';

class ProgressBadgeWrap extends StatelessWidget {
  const ProgressBadgeWrap({
    super.key,
    required this.badges,
    this.spacing = 8,
    this.runSpacing = 8,
  });

  final List<ProgressBadge> badges;
  final double spacing;
  final double runSpacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing,
      runSpacing: runSpacing,
      children: badges.map((badge) => ProgressBadgeChip(badge: badge)).toList(),
    );
  }
}
