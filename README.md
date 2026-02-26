# bibleverse_open

Open-source Flutter package with plug-and-play BibleVerse-inspired UI widgets.

This package only ships client-side UI and mock/public-safe data models.
It does not include auth, backend integrations, user profiles, monetization, or private keys.

## Features

- `VerseReaderCard`: verse reading card with quick actions
- `StreakOverviewCard`: streak summary and weekly progress
- `ChallengeCard`: challenge progress card
- `ProgressBadgeChip` and `ProgressBadgeWrap`: reusable progress badges
- `BibleVerseOpenTheme.light()`: mobile-ready Material 3 theme
- `BibleVerseMockData`: hardcoded demo data to start fast

## Install

### Git dependency

```yaml
dependencies:
  bibleverse_open:
    git:
      url: https://github.com/YOUR_ORG/bibleverse_open.git
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

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        VerseReaderCard(verse: verse),
        const SizedBox(height: 12),
        StreakOverviewCard(streak: streak),
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

[MIT](LICENSE)
