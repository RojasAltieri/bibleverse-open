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
}
