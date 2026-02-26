class ChallengeData {
  const ChallengeData({
    required this.id,
    required this.title,
    required this.description,
    required this.totalSteps,
    required this.completedSteps,
    required this.category,
    required this.difficulty,
    this.dueDate,
  });

  final String id;
  final String title;
  final String description;
  final int totalSteps;
  final int completedSteps;
  final String category;
  final String difficulty;
  final DateTime? dueDate;

  double get progress {
    if (totalSteps <= 0) {
      return 0;
    }
    final value = completedSteps / totalSteps;
    return value.clamp(0, 1).toDouble();
  }
}
