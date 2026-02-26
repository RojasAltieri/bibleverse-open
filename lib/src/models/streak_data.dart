class StreakData {
  const StreakData({
    required this.currentDays,
    required this.longestDays,
    required this.weeklyGoal,
    required this.completedThisWeek,
    this.completedToday = false,
  });

  final int currentDays;
  final int longestDays;
  final int weeklyGoal;
  final int completedThisWeek;
  final bool completedToday;

  double get weeklyProgress {
    if (weeklyGoal <= 0) {
      return 0;
    }
    final value = completedThisWeek / weeklyGoal;
    return value.clamp(0, 1).toDouble();
  }
}
