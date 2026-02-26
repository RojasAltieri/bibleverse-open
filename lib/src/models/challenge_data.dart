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

  factory ChallengeData.fromMap(Map<String, dynamic> map) {
    int intValue(dynamic value, int fallback) {
      if (value is int) return value;
      if (value is num) return value.toInt();
      return int.tryParse(value?.toString() ?? '') ?? fallback;
    }

    DateTime? parseDate(dynamic value) {
      if (value is DateTime) return value;
      if (value == null) return null;
      return DateTime.tryParse(value.toString());
    }

    return ChallengeData(
      id: (map['id'] ?? map['_id'] ?? '').toString(),
      title: (map['title'] ?? '').toString(),
      description: (map['description'] ?? '').toString(),
      totalSteps: intValue(map['totalSteps'] ?? map['total_steps'], 0),
      completedSteps: intValue(
        map['completedSteps'] ?? map['completed_steps'],
        0,
      ),
      category: (map['category'] ?? '').toString(),
      difficulty: (map['difficulty'] ?? '').toString(),
      dueDate: parseDate(map['dueDate'] ?? map['due_date']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'totalSteps': totalSteps,
      'completedSteps': completedSteps,
      'category': category,
      'difficulty': difficulty,
      'dueDate': dueDate?.toIso8601String(),
    };
  }

  double get progress {
    if (totalSteps <= 0) {
      return 0;
    }
    final value = completedSteps / totalSteps;
    return value.clamp(0, 1).toDouble();
  }
}
