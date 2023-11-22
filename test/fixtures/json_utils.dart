import 'dart:io';

String jsonReader(String name) =>
    File('test/fixtures/$name').readAsStringSync();

extension ExtendedString on String {
  clearEncodedJson() => replaceAll(' ', '')
      .replaceAll('\n', '')
      .replaceAll(r'\', '')
      .replaceAll(r'"{', '{')
      .replaceAll(r'}"', '}')
      .replaceAll('\r', '');
}
