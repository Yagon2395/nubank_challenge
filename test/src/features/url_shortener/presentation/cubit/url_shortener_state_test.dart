import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_challenge/src/core/errors/failures.dart';
import 'package:nubank_challenge/src/features/url_shortener/presentation/cubit/url_shortener_cubit.dart';

import '../../../../../fixtures/url_shortener_fixtures.dart';

void main() {
  group('copyWith', () {
    final UrlShortenerState tUrlShortenerState = UrlShortenerState.initial();
    test(
        'copyWith without any arguments should not modify any property of state',
        () {
      final newUrlShortenerState = tUrlShortenerState.copyWith();
      expect(newUrlShortenerState, tUrlShortenerState);
    });

    test('copyWith should work for all properties of state', () {
      final newUrlShortenerState = tUrlShortenerState.copyWith(
        url: tUrl,
        status: NetworkStatus.loading,
        shortenedUrls: [tUrlShortener],
        failure: ServerFailure(),
      );

      expect(newUrlShortenerState.url, tUrl);
      expect(newUrlShortenerState.status, NetworkStatus.loading);
      expect(newUrlShortenerState.shortenedUrls, [tUrlShortener]);
      expect(newUrlShortenerState.failure, ServerFailure());
    });
  });
}
