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
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFC),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1D2DA), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.auto_stories_rounded, color: Color(0xFF2C6E49)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  verse.reference,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Chip(
                visualDensity: VisualDensity.compact,
                label: Text(verse.translation),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            verse.text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontStyle: FontStyle.italic,
              height: 1.4,
              color: const Color(0xFF3A3A3A),
            ),
          ),
          if (verse.context.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              verse.context,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilledButton.tonalIcon(
                onPressed: onReadMore,
                icon: const Icon(Icons.menu_book_rounded),
                label: const Text('Leer contexto'),
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
    );
  }
}
