import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/widgets/url_shortener_item.dart';

import '../../../../../fixtures/url_shortener_fixtures.dart';

void main() {
  Widget makeTestableWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: UrlShortenerItem(item: tUrlShortener),
      ),
    );
  }

  testWidgets('url shortener item should render correctly', (tester) async {
    // Act
    await tester.pumpWidget(makeTestableWidget());

    // Assert
    expect(find.text(tUrlShortener.alias), findsOneWidget);
    expect(find.text(tUrlShortener.links.short), findsOneWidget);
  });
}
