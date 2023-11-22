import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/widgets/url_shortener_shimmer.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  Widget makeTestableWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: UrlShortenerShimmer(),
      ),
    );
  }

  testWidgets('url shortener shimmer should render correctly', (tester) async {
    // Act
    await tester.pumpWidget(makeTestableWidget());

    // Assert
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(Shimmer), findsNWidgets(4));
    expect(
        find.byWidgetPredicate(
          (Widget widget) =>
              widget is Container && widget.color == Colors.black,
          description: 'shimmer loading boxes',
        ),
        findsNWidgets(8));
  });
}
