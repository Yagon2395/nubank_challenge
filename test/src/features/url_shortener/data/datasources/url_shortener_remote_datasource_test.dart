import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nubank_challenge/src/core/errors/exceptions.dart';
import 'package:nubank_challenge/src/core/utils/constants.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/datasources/url_shortener_datasource.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/datasources/url_shortener_remote_datasource.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/models/url_shortener_model.dart';

import '../../../../../fixtures/json_utils.dart';
import '../../../../../fixtures/url_shortener_fixtures.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late Dio dioClient;
  late UrlShortenerDatasource urlShortenerDatasource;

  setUp(() {
    dioClient = MockDio();
    urlShortenerDatasource = UrlShortenerRemoteDatasource(dioClient);
  });

  void setUpMockDioClientSuccess200() {
    final urlShortenerJson = jsonReader('url_shortener.json');

    when(() => dioClient.post(
          any(),
          options: any(named: 'options'),
          data: any(named: 'data'),
        )).thenAnswer((_) async => Response(
          statusCode: 200,
          data: urlShortenerJson,
          requestOptions: RequestOptions(
            baseUrl: baseUrl,
            data: tUrlModel,
          ),
        ));
  }

  void setUpMockDioClientFailure404() {
    when(() => dioClient.post(
          any(),
          options: any(named: 'options'),
          data: any(named: 'data'),
        )).thenThrow(DioException.badResponse(
      statusCode: 404,
      requestOptions: RequestOptions(
        baseUrl: baseUrl,
        data: tUrlModel,
      ),
      response: Response(
        requestOptions: RequestOptions(
          baseUrl: baseUrl,
          data: tUrlModel,
        ),
        data: null,
      ),
    ));
  }

  group('shortenUrl', () {
    test(
        'should return UrlShortenerModel when the response code is 200 (success)',
        () async {
      // Arrange
      setUpMockDioClientSuccess200();

      // Act
      final result = await urlShortenerDatasource.shortenUrl(tUrlModel);

      // Assert
      expect(result, isA<UrlShortenerModel>());
    });

    test(
        'should throw ServerException when the response code is 404 (not found)',
        () async {
      // Arrange
      setUpMockDioClientFailure404();

      // Act
      final action = urlShortenerDatasource.shortenUrl;

      // Assert
      expect(() => action(tUrlModel), throwsA(isA<ServerException>()));
    });

    test('should perform the POST request as expected', () async {
      // Arrange
      setUpMockDioClientSuccess200();

      // Act
      await urlShortenerDatasource.shortenUrl(tUrlModel);

      // Assert
      verify(
        () => dioClient.post(
          '$baseUrl/api/alias',
          data: tUrlModel,
          options: any(named: 'options'),
        ),
      ).called(1);
    });
  });
}
