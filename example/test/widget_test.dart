import 'package:flutter_test/flutter_test.dart';

import 'package:bibleverse_open_example/main.dart';

void main() {
  testWidgets('showcase renders key widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const BibleVerseOpenExampleApp());

    expect(find.text('BibleVerse Open'), findsOneWidget);
    expect(find.text('Filipenses 4:13'), findsOneWidget);
    expect(find.text('Racha actual'), findsOneWidget);
  });
}
