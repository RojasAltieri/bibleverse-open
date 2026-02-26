import 'package:flutter/material.dart';

import '../models/streak_data.dart';

class StreakOverviewCard extends StatelessWidget {
  const StreakOverviewCard({
    super.key,
    required this.streak,
    this.title = 'Racha actual',
  });

  final StreakData streak;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Icons.local_fire_department_rounded,
                    color: colorScheme.primary,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${streak.currentDays} dias',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    Text(
                      streak.completedToday
                          ? 'Hoy ya completaste tu lectura'
                          : 'Hoy aun no registras lectura',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            LinearProgressIndicator(
              value: streak.weeklyProgress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(24),
            ),
            const SizedBox(height: 8),
            Text(
              'Meta semanal: ${streak.completedThisWeek}/${streak.weeklyGoal} dias '
              '(record: ${streak.longestDays} dias)',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
