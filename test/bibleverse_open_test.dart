import 'package:bibleverse_open/bibleverse_open.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('StreakData weeklyProgress stays in 0..1 range', () {
    const streak = StreakData(
      currentDays: 3,
      longestDays: 5,
      weeklyGoal: 7,
      completedThisWeek: 20,
    );

    expect(streak.weeklyProgress, 1);
  });

  testWidgets('VerseReaderCard renders reference and actions', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: VerseReaderCard(verse: BibleVerseMockData.verseOfTheDay),
        ),
      ),
    );

    expect(find.text('Filipenses 4:13'), findsOneWidget);
    expect(find.text('Compartir'), findsOneWidget);
    expect(find.text('Guardar'), findsOneWidget);
  });

  testWidgets('DailyReadingPlanCard renders progress labels', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: DailyReadingPlanCard(
            readings: BibleVerseMockData.sampleDailyReadings,
            dayLabel: 'Dia 12',
            currentIndex: 1,
          ),
        ),
      ),
    );

    expect(find.text('Plan del Dia'), findsOneWidget);
    expect(find.text('Progreso del dia'), findsOneWidget);
    expect(find.text('Capitulo 3'), findsOneWidget);
  });
}
