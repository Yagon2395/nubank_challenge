import 'dart:convert';

import '../../domain/entities/url_links.dart';

class UrlLinksModel extends UrlLinks {
  const UrlLinksModel({
    required super.self,
    required super.short,
  });

  Map<String, dynamic> toMap() {
    return {
      'self': self,
      'short': short,
    };
  }

  static UrlLinksModel fromMap(Map<String, dynamic> map) {
    return UrlLinksModel(
      self: map['self'],
      short: map['short'],
    );
  }

  String toJson() => json.encode(toMap());

  static UrlLinksModel fromJson(String source) => fromMap(json.decode(source));
}
