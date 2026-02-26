import 'package:bibleverse_open/bibleverse_open.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BibleVerseOpenExampleApp());
}

class BibleVerseOpenExampleApp extends StatelessWidget {
  const BibleVerseOpenExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bibleverse_open example',
      debugShowCheckedModeBanner: false,
      theme: BibleVerseOpenTheme.light(),
      home: const ShowcasePage(),
    );
  }
}

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final verse = BibleVerseMockData.verseOfTheDay;
    final streak = BibleVerseMockData.sampleStreak;
    final challenges = BibleVerseMockData.sampleChallenges;
    final badges = BibleVerseMockData.sampleBadges;
    final readings = BibleVerseMockData.sampleDailyReadings;
    final verseFlow = BibleVerseMockData.sampleVerseFlow;

    return Scaffold(
      appBar: AppBar(title: const Text('BibleVerse Open UI Kit')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _sectionTitle(context, 'Verso del dia'),
            VerseReaderCard(
              verse: verse,
              onReadMore: () => _showInfo(context, 'Lectura'),
              onShare: () => _showInfo(context, 'Compartir'),
              onBookmark: () => _showInfo(context, 'Guardar'),
            ),
            const SizedBox(height: 12),
            _sectionTitle(context, 'Racha curada de BibleVerse'),
            StreakOverviewCard(
              streak: streak,
              onReadPressed: () => _showInfo(context, 'Leer capitulo'),
            ),
            const SizedBox(height: 12),
            _sectionTitle(context, 'Plan diario'),
            DailyReadingPlanCard(
              readings: readings,
              dayLabel: 'Dia 12',
              currentIndex: 1,
              onTapReading: (entry) => _showInfo(
                context,
                '${entry.displayName} ${entry.chapterNumber}',
              ),
            ),
            const SizedBox(height: 12),
            _sectionTitle(context, 'Retos activos'),
            for (final challenge in challenges) ...[
              ChallengeCard(
                challenge: challenge,
                onPrimaryAction: () => _showInfo(context, challenge.title),
              ),
              const SizedBox(height: 12),
            ],
            _sectionTitle(context, 'Texto continuo de versos'),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.06),
                ),
              ),
              child: VerseTextFlow(
                verses: verseFlow,
                onVerseLongPress: (_, verseItem) =>
                    _showInfo(context, 'Verso ${verseItem.verseNumber}'),
              ),
            ),
            const SizedBox(height: 12),
            _sectionTitle(context, 'Badges de progreso'),
            ProgressBadgeWrap(badges: badges),
            const SizedBox(height: 12),
            _sectionTitle(context, 'Card para compartir'),
            FittedBox(
              fit: BoxFit.contain,
              child: VerseShareCard(
                text: verse.text,
                reference: verse.reference,
                design: VerseShareDesign.paper,
                width: 360,
                height: 450,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }

  void _showInfo(BuildContext context, String label) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Accion demo: $label')));
  }
}
