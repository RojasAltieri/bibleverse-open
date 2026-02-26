import 'package:flutter/material.dart';

import '../models/progress_badge.dart';

class ProgressBadgeChip extends StatelessWidget {
  const ProgressBadgeChip({super.key, required this.badge});

  final ProgressBadge badge;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: badge.color.withValues(alpha: 0.14),
        child: Icon(badge.icon, size: 18, color: badge.color),
      ),
      label: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            badge.title,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(badge.subtitle, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
      visualDensity: VisualDensity.comfortable,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    );
  }
}
