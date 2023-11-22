import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_challenge/src/features/url_shortener/data/models/url_links_model.dart';
import 'package:nubank_challenge/src/features/url_shortener/domain/entities/url_links.dart';

import '../../../../../fixtures/json_utils.dart';
import '../../../../../fixtures/url_shortener_fixtures.dart';

void main() {
  test(
    'should be a subclass of UrlLinks entity',
    () async {
      // assert
      expect(tUrlLinksModel, isA<UrlLinks>());
    },
  );
  group('serialization', () {
    test(
      'fromJson',
      () async {
        // Arrange
        final jsonStr = jsonReader('url_links.json');

        // Act
        final result = UrlLinksModel.fromJson(jsonStr);

        // Assert
        expect(result, tUrlLinksModel);
      },
    );

    test(
      'toJson',
      () async {
        // Arrange
        final jsonStr = jsonReader('url_links.json');

        // Act
        final result = tUrlLinksModel.toJson();

        // Assert
        expect(result.clearEncodedJson(), jsonStr.clearEncodedJson());
      },
    );
  });
}
