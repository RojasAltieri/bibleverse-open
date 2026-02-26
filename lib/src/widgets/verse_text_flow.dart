import 'package:flutter/material.dart';

import '../models/verse_flow_item.dart';

class VerseTextFlow extends StatelessWidget {
  const VerseTextFlow({
    super.key,
    required this.verses,
    this.fontSize = 18,
    this.lineHeight = 1.7,
    this.textColor = const Color(0xFF253238),
    this.verseNumberColor = const Color(0xFF2C6E49),
    this.onVerseLongPress,
  });

  final List<VerseFlowItem> verses;
  final double fontSize;
  final double lineHeight;
  final Color textColor;
  final Color verseNumberColor;
  final void Function(int verseIndex, VerseFlowItem verse)? onVerseLongPress;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          height: lineHeight,
          color: textColor,
        ),
        children: _buildVerseSpans(),
      ),
    );
  }

  List<InlineSpan> _buildVerseSpans() {
    final spans = <InlineSpan>[];

    for (var i = 0; i < verses.length; i++) {
      final verse = verses[i];

      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: GestureDetector(
            onLongPress: () => onVerseLongPress?.call(i, verse),
            child: Text(
              '${verse.verseNumber} ',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: fontSize * 0.7,
                color: verseNumberColor,
                height: lineHeight,
              ),
            ),
          ),
        ),
      );

      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: GestureDetector(
            onLongPress: () => onVerseLongPress?.call(i, verse),
            child: Container(
              decoration: verse.highlightColor == null
                  ? null
                  : BoxDecoration(
                      color: verse.highlightColor!.withValues(alpha: 0.22),
                      borderRadius: BorderRadius.circular(4),
                    ),
              padding: verse.highlightColor == null
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
              child: Text(
                verse.text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  height: lineHeight,
                ),
              ),
            ),
          ),
        ),
      );

      if (i < verses.length - 1) {
        spans.add(const TextSpan(text: ' '));
      }
    }

    return spans;
  }
}
