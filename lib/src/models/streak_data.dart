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

  factory StreakData.fromMap(Map<String, dynamic> map) {
    int intValue(dynamic value, int fallback) {
      if (value is int) return value;
      if (value is num) return value.toInt();
      return int.tryParse(value?.toString() ?? '') ?? fallback;
    }

    bool boolValue(dynamic value, bool fallback) {
      if (value is bool) return value;
      final raw = value?.toString().toLowerCase();
      if (raw == 'true' || raw == '1') return true;
      if (raw == 'false' || raw == '0') return false;
      return fallback;
    }

    return StreakData(
      currentDays: intValue(map['currentDays'] ?? map['current_days'], 0),
      longestDays: intValue(map['longestDays'] ?? map['longest_days'], 0),
      weeklyGoal: intValue(map['weeklyGoal'] ?? map['weekly_goal'], 7),
      completedThisWeek: intValue(
        map['completedThisWeek'] ?? map['completed_this_week'],
        0,
      ),
      completedToday: boolValue(
        map['completedToday'] ?? map['completed_today'],
        false,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currentDays': currentDays,
      'longestDays': longestDays,
      'weeklyGoal': weeklyGoal,
      'completedThisWeek': completedThisWeek,
      'completedToday': completedToday,
    };
  }

  double get weeklyProgress {
    if (weeklyGoal <= 0) {
      return 0;
    }
    final value = completedThisWeek / weeklyGoal;
    return value.clamp(0, 1).toDouble();
  }
}
