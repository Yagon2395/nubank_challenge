import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/cubit/url_shortener_cubit.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/widgets/widgets.dart';

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
            child: const UrlShortenerContent(),
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

  testWidgets('url shortener content should render correctly', (tester) async {
    // Arrange
    mockInitialState();
    // Act
    await tester.pumpWidget(makeTestableWidget());

    // Assert
    expect(find.byType(UrlShortenerForm), findsOneWidget);
    expect(find.text('Recently shortened URLs'), findsOneWidget);
    expect(find.byType(UrlShortenerList), findsOneWidget);
  });
}
