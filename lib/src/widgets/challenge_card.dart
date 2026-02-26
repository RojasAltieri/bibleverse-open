import 'package:flutter/material.dart';

import '../models/challenge_data.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    super.key,
    required this.challenge,
    this.onTap,
    this.onPrimaryAction,
    this.primaryActionLabel = 'Continuar',
  });

  final ChallengeData challenge;
  final VoidCallback? onTap;
  final VoidCallback? onPrimaryAction;
  final String primaryActionLabel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                challenge.title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(challenge.description),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(
                    avatar: const Icon(Icons.category_rounded, size: 18),
                    label: Text(challenge.category),
                  ),
                  Chip(
                    avatar: const Icon(Icons.speed_rounded, size: 18),
                    label: Text(challenge.difficulty),
                  ),
                  if (challenge.dueDate != null)
                    Chip(
                      avatar: const Icon(
                        Icons.calendar_today_rounded,
                        size: 18,
                      ),
                      label: Text(_formatDate(challenge.dueDate!)),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: challenge.progress,
                minHeight: 8,
                borderRadius: BorderRadius.circular(24),
              ),
              const SizedBox(height: 8),
              Text(
                '${challenge.completedSteps}/${challenge.totalSteps} pasos',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton.icon(
                  onPressed: onPrimaryAction,
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: Text(primaryActionLabel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day/$month/$year';
  }
}
