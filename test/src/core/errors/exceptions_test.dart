import 'package:flutter_test/flutter_test.dart';
import 'package:nubank_challenge/src/core/errors/exceptions.dart';

void main() {
  void throwsServerException() {
    throw ServerException();
  }

  test('should throw ServerException', () {
    expect(
      throwsServerException,
      throwsA(
        predicate((ex) => ex is ServerException),
      ),
    );
  });
}
