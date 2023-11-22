import 'package:flutter_test/flutter_test.dart';
import '../../../../../fixtures/json_utils.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/models/url_shortener_model.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/entities/url_shortener.dart';

import '../../../../../fixtures/url_shortener_fixtures.dart';

void main() {
  test(
    'should be a subclass of UrlShortener entity',
    () async {
      // assert
      expect(tUrlShortenerModel, isA<UrlShortener>());
    },
  );
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader('url_shortener.json');

        // Act
        final result = UrlShortenerModel.fromJson(jsonStr);

        // Assert
        expect(result, tUrlShortenerModel);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader('url_shortener.json');

        // Act
        final result = tUrlShortenerModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
