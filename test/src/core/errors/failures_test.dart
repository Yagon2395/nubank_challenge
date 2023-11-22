import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_challenge/src/core/errors/failures.dart';

void main() {
  group('failures', () {
    test('ServerFailure should return correct message', () {
      final tServerFailure = ServerFailure();
      expect(tServerFailure.message(),
          'Network error, please check your connection and service status to try again.');
    });

    test('UnknownFailure should return correct message', () {
      final tUnknownFailure = UnknownFailure();
      expect(
          tUnknownFailure.message(), 'Something went wrong, please try again.');
    });
  });
}
