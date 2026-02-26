class BibleVerse {
  const BibleVerse({
    required this.reference,
    required this.text,
    this.translation = 'RVR1960',
    this.context = '',
  });

  final String reference;
  final String text;
  final String translation;
  final String context;
}
