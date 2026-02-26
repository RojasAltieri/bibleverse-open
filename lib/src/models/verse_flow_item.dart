import 'package:flutter/material.dart';

class VerseFlowItem {
  const VerseFlowItem({
    required this.verseNumber,
    required this.text,
    this.highlightColor,
  });

  final String verseNumber;
  final String text;
  final Color? highlightColor;

  factory VerseFlowItem.fromMap(Map<String, dynamic> map) {
    Color? parseColor(dynamic value) {
      if (value is Color) return value;
      if (value is int) return Color(value);
      if (value is String) {
        final hex = value.replaceFirst('#', '');
        final parsed = int.tryParse('FF$hex', radix: 16);
        if (parsed != null) return Color(parsed);
      }
      return null;
    }

    return VerseFlowItem(
      verseNumber: (map['verseNumber'] ?? map['verse_number'] ?? '').toString(),
      text: (map['text'] ?? '').toString(),
      highlightColor: parseColor(
        map['highlightColor'] ?? map['highlight_color'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'verseNumber': verseNumber,
      'text': text,
      'highlightColor': highlightColor?.toARGB32(),
    };
  }
}
