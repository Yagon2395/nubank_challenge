import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/core/errors/failures.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/entities/url_shortener.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/repositories/url_shortener_repository.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/usecases/shorten_url_usecase.dart';

import '../../../../../fixtures/url_shortener_fixtures.dart';

class MockShortenerUrlRepository extends Mock
    implements UrlShortenerRepository {}

void main() {
  late UrlShortenerRepository mockShortenerUrlRepository;
  late ShortenUrlUsecase shortenUrlUsecase;

  setUp(() {
    mockShortenerUrlRepository = MockShortenerUrlRepository();
    shortenUrlUsecase = ShortenUrlUsecase(mockShortenerUrlRepository);
  });

  test(
    'should return Right with correct value when repository completes successfully',
    () async {
      // Arrange
      when(() => mockShortenerUrlRepository.shortenUrl(any()))
          .thenAnswer((_) async => const Right(tUrlShortener));

      // Act
      final result = await shortenUrlUsecase(tUrl);

      // Assert
      expect(result, const Right(tUrlShortener));
    },
  );

  test(
    'should return Left with Failure when repository catch exceptions',
    () async {
      // Arrange
      when(() => mockShortenerUrlRepository.shortenUrl(any()))
          .thenAnswer((_) async => Left(UnknownFailure()));

      // Act
      final result = await shortenUrlUsecase(tUrl);

      // Assert
      expect(result, Left<Failure, UrlShortener>(UnknownFailure()));
    },
  );

  test(
    'should call repository correctly',
    () async {
      // Arrange
      when(() => mockShortenerUrlRepository.shortenUrl(any()))
          .thenAnswer((_) async => const Right(tUrlShortener));

      // Act
      await shortenUrlUsecase(tUrl);

      // Assert
      verify(() => mockShortenerUrlRepository.shortenUrl(any())).called(1);
      verifyNoMoreInteractions(mockShortenerUrlRepository);
    },
  );
}
