import 'package:flutter/material.dart';

import '../models/streak_data.dart';

class StreakOverviewCard extends StatelessWidget {
  const StreakOverviewCard({
    super.key,
    required this.streak,
    this.title = 'Racha personal',
    this.readButtonLabel = 'Leer un capitulo',
    this.onReadPressed,
  });

  final StreakData streak;
  final String title;
  final String readButtonLabel;
  final VoidCallback? onReadPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1E2B3C), Color(0xFF1A2533)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: streak.completedToday
                ? Colors.orange.withValues(alpha: 0.24)
                : Colors.black.withValues(alpha: 0.22),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  color: streak.completedToday
                      ? Colors.orange.withValues(alpha: 0.2)
                      : Colors.white.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  streak.completedToday
                      ? Icons.local_fire_department_rounded
                      : Icons.mode_night_rounded,
                  color: streak.completedToday
                      ? Colors.orangeAccent
                      : Colors.white70,
                  size: 34,
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${streak.currentDays}',
                    style: const TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                  Text(
                    'dias seguidos',
                    style: TextStyle(color: Colors.grey.shade300, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          LinearProgressIndicator(
            value: streak.weeklyProgress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(999),
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.orangeAccent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Meta semanal ${streak.completedThisWeek}/${streak.weeklyGoal} - record ${streak.longestDays} dias',
            style: TextStyle(
              color: Colors.grey.shade300,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onReadPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.menu_book_rounded),
              label: Text(
                readButtonLabel,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
