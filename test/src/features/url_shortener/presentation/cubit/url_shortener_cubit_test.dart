import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/core/errors/failures.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/entities/url_shortener.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/usecases/shorten_url_usecase.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/cubit/url_shortener_cubit.dart';

import '../../../../../fixtures/url_shortener_fixtures.dart';

class MockShortenUrlUsecase extends Mock implements ShortenUrlUsecase {}

void main() {
  late ShortenUrlUsecase shortenUrlUsecase;
  late UrlShortenerCubit urlShortenerCubit;

  setUp(() {
    shortenUrlUsecase = MockShortenUrlUsecase();
    urlShortenerCubit = UrlShortenerCubit(shortenUrlUsecase);
  });

  void mockShortenUrlUsecaseSuccess() {
    when(() => shortenUrlUsecase.call(any())).thenAnswer(
        (_) async => const Right<Failure, UrlShortener>(tUrlShortener));
  }

  void mockShortenUrlUsecaseFailure() {
    when(() => shortenUrlUsecase.call(any()))
        .thenAnswer((_) async => Left<Failure, UrlShortener>(UnknownFailure()));
  }

  group('onUrlChanged', () {
    blocTest(
      'emits correct state with changed url',
      setUp: () => mockShortenUrlUsecaseSuccess(),
      build: () => urlShortenerCubit,
      act: (cubit) => cubit.onUrlChanged(tUrl),
      expect: () => [
        UrlShortenerState.initial().copyWith(url: tUrl),
      ],
      verify: (_) => verifyNever(() => shortenUrlUsecase.call(any())),
    );
  });

  group('shortenUrl', () {
    blocTest(
      'emits correct sequence of states when usecase completes successfully',
      setUp: () => mockShortenUrlUsecaseSuccess(),
      seed: () => UrlShortenerState.initial().copyWith(url: tUrl),
      build: () => urlShortenerCubit,
      act: (cubit) => cubit.shortenUrl(),
      expect: () => [
        const UrlShortenerState(
          url: tUrl,
          status: NetworkStatus.loading,
          shortenedUrls: [],
        ),
        const UrlShortenerState(
          url: tUrl,
          status: NetworkStatus.idle,
          shortenedUrls: [tUrlShortener],
        ),
      ],
      verify: (_) => verify(() => shortenUrlUsecase.call(any())).called(1),
    );

    blocTest(
      'emits correct sequence of states when usecase completes with failures',
      setUp: () => mockShortenUrlUsecaseFailure(),
      seed: () => UrlShortenerState.initial().copyWith(url: tUrl),
      build: () => urlShortenerCubit,
      act: (cubit) => cubit.shortenUrl(),
      expect: () => [
        const UrlShortenerState(
          url: tUrl,
          status: NetworkStatus.loading,
          shortenedUrls: [],
        ),
        UrlShortenerState(
          url: tUrl,
          status: NetworkStatus.idle,
          shortenedUrls: const [],
          failure: UnknownFailure(),
        ),
      ],
      verify: (_) => verify(() => shortenUrlUsecase.call(any())).called(1),
    );
  });
}
