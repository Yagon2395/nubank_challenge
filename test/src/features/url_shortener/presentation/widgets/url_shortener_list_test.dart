import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/core/errors/failures.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/cubit/url_shortener_cubit.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/widgets/widgets.dart';

import '../../../../../fixtures/url_shortener_fixtures.dart';

class MockUrlShortenerCubit extends Mock implements UrlShortenerCubit {}

void main() {
  late UrlShortenerCubit urlShortenerCubit;

  setUp(() => urlShortenerCubit = MockUrlShortenerCubit());

  Widget makeTestableWidget() {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: BlocProvider<UrlShortenerCubit>(
            create: (context) => urlShortenerCubit,
            child: const UrlShortenerList(),
          ),
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

  void mockLoadedItemsState() {
    whenListen(
      urlShortenerCubit,
      Stream.fromIterable([
        UrlShortenerState.initial(),
        UrlShortenerState.initial().copyWith(shortenedUrls: [
          tUrlShortener,
          tUrlShortener,
        ])
      ]),
      initialState: UrlShortenerState.initial(),
    );

    when(() => urlShortenerCubit.close()).thenAnswer((_) async {});
  }

  void mockFailureState() {
    whenListen(
      urlShortenerCubit,
      Stream.fromIterable([
        UrlShortenerState.initial(),
        UrlShortenerState.initial().copyWith(failure: ServerFailure())
      ]),
      initialState:
          UrlShortenerState.initial().copyWith(failure: ServerFailure()),
    );

    when(() => urlShortenerCubit.close()).thenAnswer((_) async {});
  }

  testWidgets('url shortener list should be empty when state is initial',
      (tester) async {
    // Arrange
    mockInitialState();
    // Act
    await tester.pumpWidget(makeTestableWidget());

    // Assert
    expect(find.byType(UrlShortenerItem), findsNothing);
  });

  testWidgets('url shortener list should render correctly when it has items',
      (tester) async {
    // Arrange
    mockLoadedItemsState();
    // Act
    await tester.pumpWidget(makeTestableWidget());

    // Assert
    await tester.pump();
    expect(find.byType(UrlShortenerItem), findsNWidgets(2));
    expect(find.byType(Divider), findsOneWidget);
  });

  testWidgets(
      'should show snackbar with error message when state has a failure',
      (tester) async {
    // Arrange
    mockFailureState();

    // Act
    await tester.pumpWidget(makeTestableWidget());

    // Assert
    await tester.pump();
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
