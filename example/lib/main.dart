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

    return Scaffold(
      appBar: AppBar(title: const Text('BibleVerse Open')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            VerseReaderCard(
              verse: verse,
              onReadMore: () => _showInfo(context, 'Lectura'),
              onShare: () => _showInfo(context, 'Compartir'),
              onBookmark: () => _showInfo(context, 'Guardar'),
            ),
            const SizedBox(height: 12),
            StreakOverviewCard(streak: streak),
            const SizedBox(height: 12),
            for (final challenge in challenges) ...[
              ChallengeCard(
                challenge: challenge,
                onPrimaryAction: () => _showInfo(context, challenge.title),
              ),
              const SizedBox(height: 12),
            ],
            Text(
              'Badges de progreso',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            ProgressBadgeWrap(badges: badges),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  void _showInfo(BuildContext context, String label) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Accion demo: $label')));
  }
}
