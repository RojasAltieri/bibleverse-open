class ReadingPlanEntry {
  const ReadingPlanEntry({
    required this.bookCanonicalName,
    required this.displayName,
    required this.chapterNumber,
    this.isCompleted = false,
  });

  final String bookCanonicalName;
  final String displayName;
  final int chapterNumber;
  final bool isCompleted;

  factory ReadingPlanEntry.fromMap(Map<String, dynamic> map) {
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

    return ReadingPlanEntry(
      bookCanonicalName: (map['bookCanonicalName'] ?? map['book'] ?? '')
          .toString(),
      displayName: (map['displayName'] ?? map['display_name'] ?? '').toString(),
      chapterNumber: intValue(map['chapterNumber'] ?? map['chapter_number'], 1),
      isCompleted: boolValue(map['isCompleted'] ?? map['is_completed'], false),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bookCanonicalName': bookCanonicalName,
      'displayName': displayName,
      'chapterNumber': chapterNumber,
      'isCompleted': isCompleted,
    };
  }
}
