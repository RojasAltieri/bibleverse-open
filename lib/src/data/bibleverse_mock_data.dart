import 'package:flutter/material.dart';

import '../models/bible_verse.dart';
import '../models/challenge_data.dart';
import '../models/progress_badge.dart';
import '../models/reading_plan_entry.dart';
import '../models/streak_data.dart';
import '../models/verse_flow_item.dart';

class BibleVerseMockData {
  static const BibleVerse verseOfTheDay = BibleVerse(
    reference: 'Filipenses 4:13',
    text: 'Todo lo puedo en Cristo que me fortalece.',
    translation: 'RVR1960',
    context: 'Fortaleza diaria para perseverar en la fe.',
  );

  static const List<BibleVerse> featuredVerses = [
    BibleVerse(
      reference: 'Salmos 119:105',
      text: 'Lampara es a mis pies tu palabra, y lumbrera a mi camino.',
      translation: 'RVR1960',
      context: 'Direccion para decisiones cotidianas.',
    ),
    BibleVerse(
      reference: 'Josue 1:9',
      text:
          'Mira que te mando que te esfuerces y seas valiente; no temas ni desmayes.',
      translation: 'RVR1960',
      context: 'Animo para avanzar con valentia.',
    ),
    BibleVerse(
      reference: 'Romanos 8:28',
      text: 'A los que aman a Dios, todas las cosas les ayudan a bien.',
      translation: 'RVR1960',
      context: 'Esperanza en medio de cualquier temporada.',
    ),
  ];

  static final StreakData sampleStreak = StreakData(
    currentDays: 12,
    longestDays: 34,
    weeklyGoal: 7,
    completedThisWeek: 5,
    completedToday: true,
  );

  static final List<ChallengeData> sampleChallenges = [
    ChallengeData(
      id: 'challenge-psalms-7',
      title: 'Reto de Salmos',
      description: 'Lee un salmo diario por una semana.',
      totalSteps: 7,
      completedSteps: 5,
      category: 'Lectura',
      difficulty: 'Basico',
      dueDate: DateTime.now().add(const Duration(days: 2)),
    ),
    ChallengeData(
      id: 'challenge-proverbs-30',
      title: '30 Dias de Proverbios',
      description: 'Un proverbio al dia para crecer en sabiduria.',
      totalSteps: 30,
      completedSteps: 11,
      category: 'Sabiduria',
      difficulty: 'Intermedio',
      dueDate: DateTime.now().add(const Duration(days: 18)),
    ),
  ];

  static const List<ProgressBadge> sampleBadges = [
    ProgressBadge(
      id: 'badge-week-1',
      title: 'Semana Fiel',
      subtitle: '7 dias seguidos',
      icon: Icons.local_fire_department_rounded,
      color: Color(0xFFE86A33),
    ),
    ProgressBadge(
      id: 'badge-reader-10',
      title: 'Lector Activo',
      subtitle: '10 capitulos leidos',
      icon: Icons.menu_book_rounded,
      color: Color(0xFF2C6E49),
    ),
    ProgressBadge(
      id: 'badge-challenge-1',
      title: 'Reto Cumplido',
      subtitle: 'Primer reto completado',
      icon: Icons.emoji_events_rounded,
      color: Color(0xFF6A4C93),
    ),
  ];

  static const List<ReadingPlanEntry> sampleDailyReadings = [
    ReadingPlanEntry(
      bookCanonicalName: 'psalms',
      displayName: 'Salmos',
      chapterNumber: 23,
      isCompleted: true,
    ),
    ReadingPlanEntry(
      bookCanonicalName: 'proverbs',
      displayName: 'Proverbios',
      chapterNumber: 3,
      isCompleted: false,
    ),
    ReadingPlanEntry(
      bookCanonicalName: 'john',
      displayName: 'Juan',
      chapterNumber: 15,
      isCompleted: false,
    ),
  ];

  static const List<VerseFlowItem> sampleVerseFlow = [
    VerseFlowItem(
      verseNumber: '1',
      text: 'Jehová es mi pastor; nada me faltará.',
    ),
    VerseFlowItem(
      verseNumber: '2',
      text: 'En lugares de delicados pastos me hará descansar.',
      highlightColor: Color(0xFFFFE7B2),
    ),
    VerseFlowItem(
      verseNumber: '3',
      text:
          'Confortará mi alma; me guiará por sendas de justicia por amor de su nombre.',
    ),
  ];
}
