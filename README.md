# bibleverse_open

Flutter package with plug-and-play BibleVerse-inspired UI widgets.

This package ships client-side UI and mock/public-safe data models.
It does not include auth, backend integrations, user profiles, monetization, or private keys.
This repository is source-available under a custom non-compete license.
UI components are curated from real BibleVerse app patterns and adapted for standalone use.

## Features

- `VerseReaderCard`: verse card inspired by BibleVerse reading UI
- `StreakOverviewCard`: streak hero card inspired by BibleVerse streak screen
- `DailyReadingPlanCard`: daily chapter list inspired by BibleVerse challenge navigator
- `ChallengeCard`: active challenge card inspired by BibleVerse challenge dashboard
- `VerseTextFlow`: continuous verse text with optional highlight spans
- `VerseShareCard`: social-share styled verse card inspired by BibleVerse share templates
- `ProgressBadgeChip` and `ProgressBadgeWrap`: reusable progress badges
- `BibleVerseOpenTheme.light()` and `.dark()`: app-inspired themes
- `BibleVerseMockData`: hardcoded safe data to start quickly

## Install

### Git dependency

```yaml
dependencies:
  bibleverse_open:
    git:
      url: https://github.com/RojasAltieri/bibleverse-open.git
```

### Local path (while developing)

```yaml
dependencies:
  bibleverse_open:
    path: ../bibleverse_open
```

## Quick usage

```dart
import 'package:bibleverse_open/bibleverse_open.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final verse = BibleVerseMockData.verseOfTheDay;
    final streak = BibleVerseMockData.sampleStreak;
    final readings = BibleVerseMockData.sampleDailyReadings;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        VerseReaderCard(verse: verse),
        const SizedBox(height: 12),
        StreakOverviewCard(streak: streak),
        const SizedBox(height: 12),
        DailyReadingPlanCard(
          readings: readings,
          dayLabel: 'Dia 12',
        ),
      ],
    );
  }
}
```

## Example app

Run the local demo:

```bash
cd example
flutter run
```

Primary target is Android and iOS. The example also runs on web and desktop for contributor convenience.

## Connect real DB data

`bibleverse_open` stays UI-only. Keep DB/auth/API in your main app and map payloads to package models:

```dart
final streak = StreakData.fromMap(apiResponse['streak']);
final challenge = ChallengeData.fromMap(apiResponse['activeChallenge']);

return StreakOverviewCard(streak: streak);
```

This keeps the main app clean without coupling UI package code to backend providers.

## Contribution scope (important)

Accepted:
- Client-side UI widgets
- Theme improvements
- Mock/public-safe data samples
- Mobile UX, accessibility, and tests

Not accepted:
- Backend code or API connectors
- Auth flows and private user data handling
- Production analytics, secrets, or payment logic

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

## Good first issues

- Add new visual variants for `VerseReaderCard`
- Add optional loading/skeleton states for cards
- Add golden tests for core widgets
- Add localization-ready text labels and examples
- Improve accessibility labels and focus behavior

## License

This repository uses the **BibleVerse Community License (Source-Available, Non-Compete) - v1.0**.
Copyright holder: **BIBLEVERSE, LLC**.
See [LICENSE](LICENSE).
