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

  factory BibleVerse.fromMap(Map<String, dynamic> map) {
    return BibleVerse(
      reference: (map['reference'] ?? '').toString(),
      text: (map['text'] ?? '').toString(),
      translation: (map['translation'] ?? 'RVR1960').toString(),
      context: (map['context'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reference': reference,
      'text': text,
      'translation': translation,
      'context': context,
    };
  }
}
