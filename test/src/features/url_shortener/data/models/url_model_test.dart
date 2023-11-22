import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/models/url_model.dart';

import '../../../../../fixtures/json_utils.dart';
import '../../../../../fixtures/url_shortener_fixtures.dart';

void main() {
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader('url.json');

        // Act
        final result = UrlModel.fromJson(jsonStr);

        // Assert
        expect(result.url, tUrlModel.url);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader('url.json');

        // Act
        final result = tUrlModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
