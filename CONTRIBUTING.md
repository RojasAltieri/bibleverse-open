# Contributing to bibleverse_open

Thanks for helping improve this package.

## License notice

By contributing, you agree that your changes can be integrated into BibleVerse
under the repository license in [LICENSE](LICENSE).
Rights holder: **BIBLEVERSE, LLC**.

## Before you code

1. Open an issue describing the change.
2. Wait for maintainer confirmation on scope.
3. Submit a PR linked to that issue.

## Scope rules

This package is strictly client-side UI.

Allowed:
- Flutter widgets and UI states
- Theme and design tokens
- Mock or public-safe sample data
- Tests, docs, and example improvements

Not allowed:
- Backend services, API clients, cloud functions
- Auth systems and real user data flows
- Supabase/Firestore production connectors
- Monetization, billing, ads, or secret keys
- Competing app packaging or redistribution

## Code standards

- Keep changes mobile-first (Android/iOS priority)
- Ensure null-safety and lint-clean code
- Add or update tests for new behavior when possible
- Keep public API small and documented
- Use English in code comments and docs for broader OSS collaboration

## Pull request checklist

- [ ] Linked issue
- [ ] No backend/auth/real-user-data changes
- [ ] `flutter analyze` passes
- [ ] `flutter test` passes
- [ ] Example app still runs
- [ ] Docs updated if API changed

## Security

Never commit credentials, tokens, or private datasets.
