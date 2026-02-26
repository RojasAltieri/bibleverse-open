import 'package:flutter/material.dart';

enum VerseShareDesign { paper, midnight, emerald, royal }

class VerseShareCard extends StatelessWidget {
  const VerseShareCard({
    super.key,
    required this.text,
    required this.reference,
    this.design = VerseShareDesign.paper,
    this.brandLabel = 'BIBLEVERSE',
    this.footerText = 'bibleverse.app',
    this.width = 1080,
    this.height = 1350,
  });

  final String text;
  final String reference;
  final VerseShareDesign design;
  final String brandLabel;
  final String footerText;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = _VerseShareTheme.byDesign(design);
    final scale = width / 1080;
    final padding = EdgeInsets.symmetric(
      horizontal: 80 * scale,
      vertical: 80 * scale,
    );

    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        border: theme.frameColor == null
            ? null
            : Border.all(color: theme.frameColor!, width: 3 * scale),
        gradient: theme.gradientColors == null
            ? null
            : LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: theme.gradientColors!,
              ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -30 * scale,
            top: -30 * scale,
            child: _softCircle(
              theme.accentColor.withValues(alpha: 0.16),
              220 * scale,
            ),
          ),
          Positioned(
            right: -40 * scale,
            bottom: -40 * scale,
            child: _softCircle(
              theme.accentColor.withValues(alpha: 0.12),
              260 * scale,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    theme.headerIcon,
                    color: theme.titleColor,
                    size: 40 * scale,
                  ),
                  SizedBox(width: 12 * scale),
                  Text(
                    brandLabel,
                    style: TextStyle(
                      color: theme.titleColor,
                      fontSize: 28 * scale,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              Icon(
                Icons.format_quote_rounded,
                color: theme.titleColor.withValues(alpha: 0.18),
                size: 92 * scale,
              ),
              SizedBox(height: 14 * scale),
              Expanded(
                flex: 8,
                child: Center(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    maxLines: _maxLinesForText(text.length),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: theme.bodyColor,
                      fontSize: _fontSizeForText(text.length, scale),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      height: 1.35,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30 * scale),
              Container(
                width: 200 * scale,
                height: 2 * scale,
                decoration: BoxDecoration(
                  color: theme.accentColor.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              SizedBox(height: 16 * scale),
              Text(
                reference,
                style: TextStyle(
                  color: theme.titleColor,
                  fontSize: 38 * scale,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(flex: 2),
              Text(
                footerText,
                style: TextStyle(
                  color: theme.subtitleColor,
                  fontSize: 22 * scale,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _softCircle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  double _fontSizeForText(int length, double scale) {
    if (length > 450) return 22 * scale;
    if (length > 300) return 26 * scale;
    if (length > 180) return 32 * scale;
    if (length > 90) return 38 * scale;
    return 46 * scale;
  }

  int _maxLinesForText(int length) {
    if (length > 450) return 24;
    if (length > 300) return 18;
    if (length > 180) return 14;
    if (length > 90) return 12;
    return 10;
  }
}

class _VerseShareTheme {
  const _VerseShareTheme({
    required this.headerIcon,
    required this.accentColor,
    required this.backgroundColor,
    required this.titleColor,
    required this.bodyColor,
    required this.subtitleColor,
    this.frameColor,
    this.gradientColors,
  });

  final IconData headerIcon;
  final Color accentColor;
  final Color backgroundColor;
  final Color titleColor;
  final Color bodyColor;
  final Color subtitleColor;
  final Color? frameColor;
  final List<Color>? gradientColors;

  factory _VerseShareTheme.byDesign(VerseShareDesign design) {
    switch (design) {
      case VerseShareDesign.midnight:
        return const _VerseShareTheme(
          headerIcon: Icons.auto_awesome_rounded,
          accentColor: Color(0xFF80ED99),
          backgroundColor: Color(0xFF101820),
          titleColor: Color(0xFFFFFFFF),
          bodyColor: Color(0xFFFFFFFF),
          subtitleColor: Color(0xFFC8D3DC),
          gradientColors: [
            Color(0xFF101820),
            Color(0xFF1A2732),
            Color(0xFF101820),
          ],
        );
      case VerseShareDesign.emerald:
        return const _VerseShareTheme(
          headerIcon: Icons.park_rounded,
          accentColor: Color(0xFF86EFAC),
          backgroundColor: Color(0xFF0B2E1B),
          titleColor: Color(0xFFFFFFFF),
          bodyColor: Color(0xFFFFFFFF),
          subtitleColor: Color(0xFFCAECD8),
          gradientColors: [
            Color(0xFF0B2E1B),
            Color(0xFF175D35),
            Color(0xFF0B2E1B),
          ],
        );
      case VerseShareDesign.royal:
        return const _VerseShareTheme(
          headerIcon: Icons.star_rounded,
          accentColor: Color(0xFFA78BFA),
          backgroundColor: Color(0xFF0F1630),
          titleColor: Color(0xFFFFFFFF),
          bodyColor: Color(0xFFFFFFFF),
          subtitleColor: Color(0xFFDFD6FF),
          gradientColors: [
            Color(0xFF0F1630),
            Color(0xFF253061),
            Color(0xFF0F1630),
          ],
        );
      case VerseShareDesign.paper:
        return const _VerseShareTheme(
          headerIcon: Icons.auto_stories_rounded,
          accentColor: Color(0xFFE9A3B5),
          backgroundColor: Color(0xFFFAFAFC),
          frameColor: Color(0xFFF1D2DA),
          titleColor: Color(0xFF2A2A2A),
          bodyColor: Color(0xFF3A3A3A),
          subtitleColor: Color(0xFF6A6A6A),
        );
    }
  }
}
