import 'package:flutter/material.dart';

import '../models/challenge_data.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    super.key,
    required this.challenge,
    this.onTap,
    this.onPrimaryAction,
    this.primaryActionLabel = 'Continuar dia actual',
  });

  final ChallengeData challenge;
  final VoidCallback? onTap;
  final VoidCallback? onPrimaryAction;
  final String primaryActionLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final currentDay = challenge.completedSteps + 1;
    final totalDays = challenge.totalSteps;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: colorScheme.primary.withValues(alpha: 0.25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.menu_book_rounded,
                    color: colorScheme.primary,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    challenge.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Dia $currentDay de $totalDays',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            Text(
              challenge.description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: LinearProgressIndicator(
                value: challenge.progress,
                minHeight: 8,
                backgroundColor: colorScheme.outline.withValues(alpha: 0.2),
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Chip(
                  label: Text(challenge.category),
                  avatar: const Icon(Icons.category_outlined, size: 16),
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(challenge.difficulty),
                  avatar: const Icon(Icons.speed_rounded, size: 16),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: onPrimaryAction,
                  icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                  label: Text(
                    primaryActionLabel,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
