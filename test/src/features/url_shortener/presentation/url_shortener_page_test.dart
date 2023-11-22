import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/cubit/url_shortener_cubit.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/widgets/url_shortener_content.dart';

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

  testWidgets('url shortener page should render correctly', (tester) async {
    // Arrange
    whenListen(
      urlShortenerCubit,
      Stream.fromIterable([UrlShortenerState.initial()]),
      initialState: UrlShortenerState.initial(),
    );

    when(() => urlShortenerCubit.close()).thenAnswer((_) async {});

    // Act
    await tester.pumpWidget(makeTestableWidget());

    // Assert
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(BlocProvider<UrlShortenerCubit>), findsOneWidget);
    expect(find.byType(UrlShortenerContent), findsOneWidget);
  });
}
