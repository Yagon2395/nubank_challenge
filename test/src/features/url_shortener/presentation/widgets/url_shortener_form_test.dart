import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/cubit/url_shortener_cubit.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/widgets/url_shortener_form.dart';

import '../../../../../fixtures/url_shortener_fixtures.dart';

class MockUrlShortenerCubit extends Mock implements UrlShortenerCubit {}

void main() {
  late UrlShortenerCubit urlShortenerCubit;

  setUp(() => urlShortenerCubit = MockUrlShortenerCubit());

  Widget makeTestableWidget() {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<UrlShortenerCubit>(
          create: (context) => urlShortenerCubit,
          child: const UrlShortenerForm(),
        ),
      ),
    );
  }

  void mockInitialState() {
    whenListen(
      urlShortenerCubit,
      Stream.fromIterable([UrlShortenerState.initial()]),
      initialState: UrlShortenerState.initial(),
    );

    when(() => urlShortenerCubit.close()).thenAnswer((_) async {});
  }

  testWidgets('url shortener form should render correctly', (tester) async {
    // Arrange
    mockInitialState();
    // Act
    await tester.pumpWidget(makeTestableWidget());

    // Assert
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(GestureDetector), findsOneWidget);
  });

  testWidgets('should call cubit to update state when TextField text changes',
      (tester) async {
    // Arrange
    mockInitialState();
    // Act
    await tester.pumpWidget(makeTestableWidget());

    await tester.enterText(find.byType(TextField), tUrl);
    await tester.pump();

    // Assert
    verify(() => urlShortenerCubit.onUrlChanged(any()));
  });

  testWidgets('should call cubit to submit url for shortening', (tester) async {
    // Arrange
    mockInitialState();
    // Act
    await tester.pumpWidget(makeTestableWidget());

    await tester.tap(find.byType(GestureDetector));
    await tester.pump();

    // Assert
    verify(() => urlShortenerCubit.shortenUrl());
  });
}
