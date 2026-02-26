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
}
