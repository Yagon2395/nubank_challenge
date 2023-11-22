import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/core/errors/exceptions.dart';
import 'package:nubank_challenge/src/core/errors/failures.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/datasources/url_shortener_datasource.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/repositories/url_shortener_repository_impl.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/entities/url_shortener.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/repositories/url_shortener_repository.dart';

import '../../../../../fixtures/url_shortener_fixtures.dart';

class MockUrlShortenerDatasource extends Mock
    implements UrlShortenerDatasource {}

void main() {
  late UrlShortenerDatasource urlShortenerDatasource;
  late UrlShortenerRepository urlShortenerRepository;

  setUp(() {
    urlShortenerDatasource = MockUrlShortenerDatasource();
    urlShortenerRepository = UrlShortenerRepositoryImpl(urlShortenerDatasource);

    registerFallbackValue(tUrlModel);
  });

  group('shortenUrl', () {
    test(
        'should return Right with correct value when datasource completes successfully',
        () async {
      // Arrange
      when(() => urlShortenerDatasource.shortenUrl(any()))
          .thenAnswer((_) async => tUrlShortenerModel);

      // Act
      final result = await urlShortenerRepository.shortenUrl(tUrl);

      // Assert
      expect(result, const Right(tUrlShortener));
    });

    test('should return Left with Failure when datasource throws', () async {
      // Arrange
      when(() => urlShortenerDatasource.shortenUrl(any()))
          .thenThrow(ServerException());

      // Act
      final result = await urlShortenerRepository.shortenUrl(tUrl);

      // Assert
      expect(result, Left<Failure, UrlShortener>(ServerFailure()));
    });

    test('should call datasource correctly', () async {
      // Arrange
      when(() => urlShortenerDatasource.shortenUrl(any()))
          .thenAnswer((_) async => tUrlShortenerModel);

      // Act
      await urlShortenerRepository.shortenUrl(tUrl);

      // Assert
      verify(
        () => urlShortenerDatasource.shortenUrl(any()),
      ).called(1);
      verifyNoMoreInteractions(urlShortenerDatasource);
    });
  });
}
