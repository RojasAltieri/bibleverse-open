import 'package:flutter/material.dart';

import '../models/reading_plan_entry.dart';

class DailyReadingPlanCard extends StatelessWidget {
  const DailyReadingPlanCard({
    super.key,
    required this.readings,
    required this.dayLabel,
    this.title = 'Plan del Dia',
    this.currentIndex = 0,
    this.onTapReading,
  });

  final List<ReadingPlanEntry> readings;
  final String dayLabel;
  final String title;
  final int currentIndex;
  final ValueChanged<ReadingPlanEntry>? onTapReading;

  @override
  Widget build(BuildContext context) {
    if (readings.isEmpty) {
      return const SizedBox.shrink();
    }

    final completedCount = readings.where((entry) => entry.isCompleted).length;
    final progress = completedCount / readings.length;

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.menu_book_rounded, color: Colors.amber),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                Text(
                  dayLabel,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...readings.asMap().entries.map((entry) {
              final index = entry.key;
              final reading = entry.value;
              return _ReadingItem(
                reading: reading,
                order: index + 1,
                isCurrent: index == currentIndex,
                onTap: onTapReading == null
                    ? null
                    : () => onTapReading!(reading),
              );
            }),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Progreso del dia',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$completedCount/${readings.length}',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(999),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReadingItem extends StatelessWidget {
  const _ReadingItem({
    required this.reading,
    required this.order,
    required this.isCurrent,
    this.onTap,
  });

  final ReadingPlanEntry reading;
  final int order;
  final bool isCurrent;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isCompleted = reading.isCompleted;

    final itemColor = isCurrent
        ? const Color(0xFFE8F1FF)
        : isCompleted
        ? const Color(0xFFE9F8F1)
        : colorScheme.surfaceContainerLow;

    final borderColor = isCurrent
        ? colorScheme.primary
        : isCompleted
        ? const Color(0xFF3AA872)
        : colorScheme.outlineVariant;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: itemColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: isCurrent ? 1.6 : 1),
      ),
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: -1),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        leading: CircleAvatar(
          radius: 15,
          backgroundColor: isCompleted
              ? const Color(0xFF3AA872)
              : isCurrent
              ? colorScheme.primary
              : colorScheme.outline,
          child: isCompleted
              ? const Icon(Icons.check_rounded, color: Colors.white, size: 16)
              : Text(
                  '$order',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
        ),
        title: Text(
          reading.displayName,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          'Capitulo ${reading.chapterNumber}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: isCurrent
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Text(
                  'Actual',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )
            : IconButton(
                onPressed: onTap,
                icon: const Icon(Icons.play_arrow_rounded),
                iconSize: 20,
              ),
      ),
    );
  }
}
