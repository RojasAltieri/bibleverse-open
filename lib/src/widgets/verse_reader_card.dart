import 'package:flutter/material.dart';

import '../models/bible_verse.dart';

class VerseReaderCard extends StatelessWidget {
  const VerseReaderCard({
    super.key,
    required this.verse,
    this.onShare,
    this.onBookmark,
    this.onReadMore,
  });

  final BibleVerse verse;
  final VoidCallback? onShare;
  final VoidCallback? onBookmark;
  final VoidCallback? onReadMore;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.auto_stories_rounded, color: colorScheme.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    verse.reference,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Chip(label: Text(verse.translation)),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              verse.text,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.4),
            ),
            if (verse.context.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                verse.context,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.tonalIcon(
                  onPressed: onReadMore,
                  icon: const Icon(Icons.menu_book_rounded),
                  label: const Text('Leer'),
                ),
                OutlinedButton.icon(
                  onPressed: onShare,
                  icon: const Icon(Icons.share_rounded),
                  label: const Text('Compartir'),
                ),
                OutlinedButton.icon(
                  onPressed: onBookmark,
                  icon: const Icon(Icons.bookmark_border_rounded),
                  label: const Text('Guardar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
